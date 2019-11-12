SELECT cohorts.name, COUNT(assignment_submissions.id) as total_submissions
FROM cohorts
JOIN students
ON students.cohort_id = cohorts.id
JOIN assignment_submissions
ON assignment_submissions.student_id = students.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;