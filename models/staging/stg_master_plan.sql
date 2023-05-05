
WITH source AS (
SELECT
    start_time_utc,
    duration,
    team,
    spass_type,
    mp.target,
    request_name,
    library_definition,
    title,
    mp.description
FROM {{ source('raw_data', 'master_plan') }} mp
),
final AS (
SELECT
    start_time_utc::TIMESTAMPTZ AT TIME ZONE 'UTC' AS start_at,
    MAKE_INTERVAL(
        0, 0, 0,
        SUBSTRING(duration FROM 1 FOR 3)::int,  -- days
        SUBSTRING(duration FROM 5 FOR 2)::int,  -- hours
        SUBSTRING(duration FROM 8 FOR 2)::int,  -- minutes
        SUBSTRING(duration FROM 11 FOR 2)::int  -- seconds
    ) AS duration,
    start_time_utc::DATE AS start_date,
    team,
    spass_type,
    s.target,
    request_name,
    library_definition,
    title,
    s.description
FROM source s
)
SELECT * FROM final

