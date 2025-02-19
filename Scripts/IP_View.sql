--2. IP
---------------------------------------------
DROP VIEW IF EXISTS public.vwippbi;
CREATE VIEW public.vwippbi AS
 SELECT bpe.patencounterid,
    bpe.mrno,
    pat.admiteddate AS encounterstartdate,
    pat.dischargedate AS encounterenddate,
    bpe.encountermodetext,
    bpe.departmentname,
    bpe.specialityname,
    bpe.providername,
    bpe.gender,
    bpe.dob,
    rm.name AS room,
    bpe.sitename,
    COALESCE(pat.dischargedate::timestamp with time zone, now()) - pat.admiteddate::timestamp with time zone AS lengthofstay,
    rm.name AS bedid,
        CASE
            WHEN pat.bedcategory = 1 THEN 'WARD'::text
            WHEN pat.bedcategory = 2 THEN 'ROOM'::text
            WHEN pat.bedcategory = 3 THEN 'ICU'::text
            WHEN pat.bedcategory = 4 THEN 'ER'::text
            WHEN pat.bedcategory = 4 THEN 'Motion Room'::text
            ELSE 'Room'::text
        END AS bedcategory,
    pat.roomtypename,
    pat.roomtypeid,
    pat.admittype,
    pat.nursingstationname,
        CASE
            WHEN pat.admittype::text = 'Normal IP'::text OR pat.admittype::text = 'IP'::text THEN 'IP'::text
            WHEN pat.admittype::text = 'ER'::text THEN 'Emergency'::text
            ELSE 'Day case'::text
        END AS "Admission Type",
    pat.paytypeid,
    pat.paytype,
        CASE
            WHEN COALESCE(pat.paytypeid, 0) = 0 THEN 'Selfpay'::text
            WHEN ps.insurancename IS NOT NULL THEN 'Insurance'::text
            WHEN ps.corporatename IS NOT NULL AND upper(ps.corporatename::text) = 'DEFAULT'::text THEN 'Selfpay'::text
            ELSE 'Corporate'::text
        END AS payertype,
        CASE
            WHEN COALESCE(pat.paytypeid, 0) = 0 THEN 'Patient'::character varying
            WHEN ps.insurancename IS NOT NULL THEN ps.insurancename
            WHEN ps.corporatename IS NOT NULL AND upper(ps.corporatename::text) = 'DEFAULT'::text THEN 'Patient'::character varying
            ELSE ps.corporatename
        END AS payer
   FROM billingpatencounter bpe
     JOIN patadt pat ON bpe.patencounterid = pat.patencounterid
     JOIN patientscheme ps ON ps.patientschemeid = pat.patientschemeid
     JOIN resourcemaster rm ON rm.resourcemasterid = pat.bedid
  WHERE bpe.isvalid = 1 AND bpe.encountermode = 2 AND (pat.admitstatus <> ALL (ARRAY[3, 5])) AND pat.isvalid = 1;
