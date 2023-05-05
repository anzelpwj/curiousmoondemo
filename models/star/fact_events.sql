SELECT
    ROW_NUMBER() OVER (ORDER BY start_at ASC) AS id,
    title,
    smp.description,
    event_types.id AS event_type_id,
    targets.id AS target_id,
    teams.id AS team_id,
    requests.id AS request_id,
    spass_types.id AS spass_type_id
FROM {{ ref("stg_master_plan") }} smp
LEFT JOIN {{ ref("dim_event_types") }} event_types
  ON event_types.description = smp.library_definition
LEFT JOIN {{ ref("dim_targets") }} targets
  ON targets.description = smp.target
LEFT JOIN {{ ref("dim_teams") }} teams
  ON teams.description = smp.team
LEFT JOIN {{ ref("dim_requests") }} requests
  ON requests.description = smp.request_name
LEFT JOIN {{ ref("dim_spass_types") }} spass_types
  ON spass_types.description = smp.spass_type
