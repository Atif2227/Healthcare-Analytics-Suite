--1. OP
---------------------------------------------
DROP VIEW IF EXISTS public.vwoppbi;
CREATE VIEW public.vwoppbi AS
 SELECT 0 AS resulttype,
    0 AS patencounterid,
    NULL::character varying AS mrno,
    schedule.scheduledate AS encounterstartdate,
    NULL::integer AS encountertype,
    NULL::text AS payertype,
    NULL::character varying AS payer,
    NULL::character varying AS encountermodetext,
    schedule.resourcedeptname AS departmentname,
    schedule.speciality AS specialityname,
    schedule.resourcename AS providername,
    schedule.hospitalname AS sitename,
    NULL::character varying AS gender,
    NULL::timestamp without time zone AS dob,
    NULL::text AS consultationtype,
    1 AS scheduled,
        CASE
            WHEN schedule.status = ANY (ARRAY[4, 6]) THEN 1
            ELSE 0
        END AS nowshow
   FROM schedule
  WHERE schedule.isvalid = 1 AND schedule.resourcecategoryid = 1 AND schedule.resourcegroupdetails IS NULL
UNION ALL
 SELECT 1 AS resulttype,
    bpe.patencounterid,
    bpe.mrno,
    bpe.encounterstartdate,
    bpe.encountertype,
        CASE
            WHEN COALESCE(ba.payertypeid::integer, 0) = 0 THEN 'Cash'::text
            WHEN ba.insurancename IS NOT NULL THEN 'Insurance'::text
            ELSE 'Corporate'::text
        END AS payertype,
        CASE
            WHEN COALESCE(ba.payertypeid::integer, 0) = 0 THEN ba.payertype
            ELSE ba.payername
        END AS payer,
    bpe.encountermodetext,
    bpe.departmentname,
    bpe.specialityname,
    bpe.providername,
    bpe.sitename,
    bpe.gender,
    bpe.dob,
        CASE
            WHEN bpe.encounterno = 1 THEN 'New'::text
            WHEN bpe.encounterno > 1 AND bpe.isfreeorfollowup = 1 THEN 'Free'::text
            ELSE 'Followup'::text
        END AS consultationtype,
    NULL::integer AS scheduled,
    NULL::integer AS nowshow
   FROM billingpatencounter bpe
     JOIN billmaster bm ON bpe.patencounterid = bm.patencounterid
     JOIN billallocation ba ON ba.billmasterid = bm.billmasterid
  WHERE bpe.isvalid = 1 AND bm.isvalid = 1 AND ba.isvalid = 1 AND (bpe.encountermode = ANY (ARRAY[0, 1])) AND ba.servicetypeid = 2 AND bpe.isnonconsultationencounter = 0;



