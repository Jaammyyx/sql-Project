with High_deman_skills as ( 
    SELECT skills_dim.skill_id,
    skills_dim.skills,
    count(job_postings_fact.job_id) as Demand_in_jobs
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst'
    group BY Skills_dim.skill_id
    ORDER BY Demand_in_jobs DESC

),Average_Salary AS(
    select skills_dim.skill_id,
    Round(avg(salary_year_avg),0) as Average_Salary_for_job,
    skills_dim.skills
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst' and salary_year_avg is NOT NULL
    group by skills_dim.skill_id
    order by Average_Salary_for_job DESC
)
select High_deman_skills.skill_id,
High_deman_skills.skills,
High_deman_skills.Demand_in_jobs,
Average_Salary.Average_Salary_for_job
from High_deman_skills
INNER JOIN Average_Salary on High_deman_skills.skill_id = Average_Salary.skill_id