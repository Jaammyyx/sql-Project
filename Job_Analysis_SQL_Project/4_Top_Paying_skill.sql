SELECT avg(job_postings_fact.salary_year_avg) as Average_Salary,
skills 
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
WHERE salary_year_avg is NOT NULL and job_title_short = 'Data Analyst'
GROUP BY skills
order by Average_Salary DESC
LIMIT 25
