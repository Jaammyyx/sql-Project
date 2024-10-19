with top_paying_jobs as (
    select job_postings_fact.job_id,
    job_postings_fact.job_title,
    company_dim.name,
    job_postings_fact.salary_year_avg
    from job_postings_fact 
    left join company_dim on company_dim.company_id = job_postings_fact.company_id
    where job_title_short = 'Data Analyst' and job_location = 'Anywhere' and salary_year_avg is NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

select top_paying_jobs.*,
skills
 from top_paying_jobs
inner JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id