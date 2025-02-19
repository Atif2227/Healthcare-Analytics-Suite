--5. SURGERY
---------------------------------------------
DROP VIEW IF EXISTS public.vwsurgerypbi;
CREATE VIEW public.vwsurgerypbi AS
 SELECT bor.billingorregisterid,
    bor.surgerytype,
    bor.servicename,
    COALESCE(bor.orderprovidername, ( SELECT genuser.deptname
           FROM genuser
          WHERE genuser.genuserid = bor.surgeonid)) AS orderdepartmentname,
    COALESCE(bor.orderprovidername, bor.surgeonname) AS orderprovidername,
    rm.name AS orname,
    bor.mrno,
    pd.fullname,
    pd.gender,
    pd.dob,
    bor.surgerydate,
    pd.nationality,
    ( SELECT
                CASE
                    WHEN COALESCE(ba.payertypeid::integer, 0) = 0 THEN 'Cash'::text
                    WHEN ba.insurancename IS NOT NULL THEN 'Insurance'::text
                    WHEN ba.corporatename IS NOT NULL AND upper(ba.corporatename::text) = 'DEFAULT'::text THEN 'Cash'::text
                    ELSE 'Corporate'::text
                END AS "case"
           FROM billallocation ba
          WHERE ba.isvalid = 1 AND ba.billingorregisterid = bor.billingorregisterid
         LIMIT 1) AS payertype,
    ( SELECT
                CASE
                    WHEN COALESCE(ba.payertypeid::integer, 0) = 0 THEN ba.payertype
                    ELSE ba.payername
                END AS payername
           FROM billallocation ba
          WHERE ba.isvalid = 1 AND ba.billingorregisterid = bor.billingorregisterid
         LIMIT 1) AS payer
   FROM billingorregister bor
     JOIN resourcemaster rm ON rm.resourcemasterid = bor.resourcemasterorid
     JOIN patdemographics pd ON pd.mrno::text = bor.mrno::text
  WHERE bor.isvalid = 1 AND COALESCE(bor.isbilled::integer, 0) = 1;
