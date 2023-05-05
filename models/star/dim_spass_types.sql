SELECT DISTINCT
    MD5(spass_type) AS id,
    spass_type AS description
FROM {{ref("stg_master_plan")}}
WHERE spass_type IS NOT NULL
