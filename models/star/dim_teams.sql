{{ config(
  pre_hook="DROP INDEX IF EXISTS team_idx",
  post_hook="CREATE INDEX IF NOT EXISTS team_idx ON {{ this }} (id)"
) }}

SELECT DISTINCT
    MD5(team) AS id,
    team AS description
FROM {{ref("stg_master_plan")}}
WHERE team IS NOT NULL
