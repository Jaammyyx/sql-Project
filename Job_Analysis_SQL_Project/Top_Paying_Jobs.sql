select job_postings_fact.job_id,
job_postings_fact.job_title,
company_dim.name,
job_postings_fact.job_location,
job_postings_fact.job_schedule_type,
job_postings_fact.salary_year_avg,
job_posted_date
from job_postings_fact 
left join company_dim on company_dim.company_id = job_postings_fact.company_id
where job_title_short = 'Data Analyst' and job_location = 'Anywhere' and salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10

select * from job_postings_fact

