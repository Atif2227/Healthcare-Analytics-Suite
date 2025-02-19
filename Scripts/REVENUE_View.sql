--4. REVENUE
---------------------------------------------
DROP VIEW IF EXISTS public.vwrevenuepbi;
CREATE VIEW public.vwrevenuepbi AS
 SELECT ra.sitename,
    ra.revenuedate,
    ra.mrno,
    bm.gender,
    bm.dob,
    ra.netamountwithoutvat,
    ra.netamountwithvat,
    ra.revenuedepartment,
    COALESCE(ra.providername, ra.orderprovidername) AS providername,
    COALESCE(ra.departmentname, ra.orderdepartmentname) AS departmentname,
    COALESCE(ra.specialityname, ra.orderspecialityname) AS specialityname,
        CASE
            WHEN ra.paytypeid = 0 THEN 'Cash'::text
            ELSE 'Credit'::text
        END AS paytype,
    ra.encountermode,
    ra.encountermodetext,
        CASE
            WHEN COALESCE(ra.paytypeid, 0) = 0 THEN 'Selfpay'::text
            WHEN ra.insurancename IS NOT NULL THEN 'Insurance'::text
            WHEN ra.corporatename IS NOT NULL AND upper(ra.corporatename::text) = 'DEFAULT'::text THEN 'Selfpay'::text
            ELSE 'Corporate'::text
        END AS payertype,
        CASE
            WHEN COALESCE(ra.paytypeid, 0) = 0 THEN 'Patient'::character varying
            WHEN ra.insurancename IS NOT NULL THEN ra.insurancename
            WHEN ra.corporatename IS NOT NULL AND upper(ra.corporatename::text) = 'DEFAULT'::text THEN 'Patient'::character varying
            ELSE ra.corporatename
        END AS payer,
    ra.rootinvcategory AS category,
    ra.invcategory AS subcategory
   FROM revenueallocation ra
     JOIN billmaster bm ON ra.billmasterid = bm.billmasterid;