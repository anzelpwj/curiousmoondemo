SELECT DISTINCT
    MD5(target) AS id,
    target AS description
FROM {{ref("stg_master_plan")}}
WHERE target IS NOT NULL
