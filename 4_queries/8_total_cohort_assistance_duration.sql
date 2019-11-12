SELECT cohorts.name as cohort, SUM(assistance_requests.completed_at - assistance_requests.started_at) as total_duration
FROM cohorts
JOIN students on cohorts.id = students.cohort_id
JOIN assistance_requests on students.id = assistance_requests.student_id
GROUP BY cohort
ORDER BY SUM(assistance_requests.completed_at - assistance_requests.started_at)