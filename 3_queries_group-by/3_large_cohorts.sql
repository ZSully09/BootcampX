SELECT cohorts.name as cohort_name, COUNT(cohort_id) as student_count
FROM students
JOIN cohorts
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(cohort_id) >= 18
ORDER BY COUNT(cohort_id);
