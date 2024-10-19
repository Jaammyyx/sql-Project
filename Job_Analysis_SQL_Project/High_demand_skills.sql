select skills,
count(job_postings_fact.job_id) as Demand_in_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
inner JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' and job_location in ('India')
group by skills
ORDER BY Demand_in_jobs DESC
limit 5

select skills,
count(job_postings_fact.job_id) as Demand_in_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
inner JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' 
group by skills
ORDER BY Demand_in_jobs DESC
limit 5
