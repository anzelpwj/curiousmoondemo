SELECT DISTINCT
    MD5(library_definition) AS id,
    library_definition AS description
FROM {{ref("stg_master_plan")}}
WHERE library_definition IS NOT NULL
