SELECT name, email, phone
FROM students
WHERE github is NULL AND end_date < NOW();

-- WHERE github is NULL AND end_date IS NOT NULL;