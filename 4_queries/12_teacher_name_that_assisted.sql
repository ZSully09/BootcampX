SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;



-- RETURNED 7 ROWS (Excluded Jadyn Bosco)
-- SELECT teachers.name as teacher, cohorts.name as cohort
-- FROM teachers
-- JOIN assistance_requests
-- ON teachers.id = assistance_requests.teacher_id
-- JOIN students
-- ON assistance_requests.student_id = students.id
-- JOIN cohorts
-- ON students.id = students.cohort_id
-- WHERE cohorts.name = 'JUL02'
-- GROUP BY cohorts.name, teachers.name
-- ORDER BY teacher