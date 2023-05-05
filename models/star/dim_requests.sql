SELECT DISTINCT
    MD5(request_name) AS id,
    request_name AS description
FROM {{ref("stg_master_plan")}}
WHERE request_name IS NOT NULL
