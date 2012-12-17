insert into krim_role_mbr_t
(role_mbr_id, role_id, mbr_id, mbr_typ_cd, last_updt_dt, ver_nbr, obj_id)
values ((select role_mbr_id from
        (select (max(cast(role_mbr_id as decimal)) + 1) as role_mbr_id from krim_role_mbr_t where role_mbr_id is not NULL and cast(role_mbr_id as decimal) < 10000)
        as tmptable),
        (select role_id from krim_role_t where role_nm = 'Kuali Rules Management System Administrator' and nmspc_cd = 'KR-RULE'),
        (select prncpl_id from krim_prncpl_t where prncpl_nm = 'quickstart'),
        'P', curdate(), 1, uuid())
/