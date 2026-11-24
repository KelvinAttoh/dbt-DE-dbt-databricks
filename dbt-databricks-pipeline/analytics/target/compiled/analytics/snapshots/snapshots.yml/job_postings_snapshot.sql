with __dbt__cte__stg_job_postings_current as (


SELECT
    *
FROM `dev`.`staging`.`stg_job_postings`
WHERE search_date <= CAST('2026-11-24 02:21:33.342308+00:00' AS DATE)
QUALIFY
    ROW_NUMBER() OVER(
        PARTITION BY job_id
        ORDER BY searched_at DESC
    ) = 1
)
--EPHEMERAL-SELECT-WRAPPER-START
select * from (
select * from __dbt__cte__stg_job_postings_current
--EPHEMERAL-SELECT-WRAPPER-END
)