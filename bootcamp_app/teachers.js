const { Pool } = require('pg');

// @ts-ignore
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// Using paramatized queries
const queryString = `
  SELECT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  JOIN assistance_requests
  ON teachers.id = assistance_requests.teacher_id
  JOIN students
  ON assistance_requests.student_id = students.id
  JOIN cohorts
  ON students.cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
  GROUP BY cohorts.name, teachers.name
  ORDER BY teacher
  `;
const teacherName = process.argv[2];
const value = [`%${teacherName}%`];

pool
  .query(queryString, value)
  .then(res => {
    console.log('Connected');
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));

// pool
//   .query(
//     `
//   SELECT teachers.name as teacher, cohorts.name as cohort
//   FROM teachers
//   JOIN assistance_requests
//   ON teachers.id = assistance_requests.teacher_id
//   JOIN students
//   ON assistance_requests.student_id = students.id
//   JOIN cohorts
//   ON students.cohort_id = cohorts.id
//   WHERE cohorts.name LIKE '%${process.argv[2]}%'
//   GROUP BY cohorts.name, teachers.name
//   ORDER BY teacher
//   `
//   )
