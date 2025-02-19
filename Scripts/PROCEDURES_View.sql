--3. PROCEDURES
---------------------------------------------
DROP VIEW IF EXISTS public.vwprocedurespbi;
CREATE VIEW public.vwprocedurespbi AS
 SELECT bpe.patencounterid,
    ba.servicename AS procedurename,
    ba.executionlocation,
    ba.orderdepartmentname AS department,
    ba.orderprovidername AS doctor,
    ba.mrno,
    ba.patientname,
    bpe.gender,
    bm.billdate,
    bpe.dob,
    pd.nationality,
        CASE
            WHEN COALESCE(ba.payertypeid::integer, 0) = 0 THEN 'Cash'::text
            WHEN ba.insurancename IS NOT NULL THEN 'Insurance'::text
            ELSE 'Corporate'::text
        END AS payertype,
        CASE
            WHEN COALESCE(ba.payertypeid::integer, 0) = 0 THEN ba.payertype
            ELSE ba.payername
        END AS payer
   FROM billallocation ba
     JOIN billmaster bm ON bm.billmasterid = ba.billmasterid
     JOIN billingpatencounter bpe ON bpe.patencounterid = bm.patencounterid
     JOIN patdemographics pd ON pd.patdemographicsid = bm.patdemographicsid
  WHERE ba.isvalid = 1 AND bm.isvalid = 1 AND (ba.servicetypeid = ANY (ARRAY[5, 6]));