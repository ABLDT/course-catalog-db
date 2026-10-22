-- 1. Get all courses 
-- Analog GET/courses
SELECT *
FROM courses
ORDER BY likes DESC;


-- 2. Filter elective courses
-- ?is_elective=true
SELECT *
FROM courses
WHERE is_elective = TRUE
ORDER BY likes DESC;

-- ?is_elective=false
SELECT *
FROM courses
WHERE is_elective = FALSE
ORDER BY likes DESC;


-- 3. Sort courses by title
-- ?sort=title
SELECT *
FROM courses
ORDER BY title ASC;


-- 4. Pagination: page 2, page size 2
-- ?page=2&page_size=2
SELECT *
FROM courses
ORDER BY likes DESC
LIMIT 2
OFFSET 2;


-- 5. Get one course by id
-- Analog GET /courses/web-security
-- GET /courses/web-security
SELECT *
FROM courses
WHERE id = 'web-security';


-- 6. Like a course
-- POST /like
UPDATE courses
SET likes = likes + 1
WHERE id = 'web-security'
RETURNING *;


-- 7. Find student
SELECT *
FROM students
WHERE email = 'aigerim@example.com';


-- 8. Create enrollment
-- POST /enrollments
INSERT INTO enrollments (
    student_id,
    course_id
)
VALUES (
    1,
    'ai-integration'
)
RETURNING *;


-- 9. Show enrollments with student and course data
SELECT
    e.id AS enrollment_id,
    s.name AS student_name,
    s.email,
    c.id AS course_id,
    c.title AS course_title,
    e.enrolled_at
FROM enrollments e
JOIN students s
    ON e.student_id = s.id
JOIN courses c
    ON e.course_id = c.id
ORDER BY e.id;


-- 10. Number of students per course
SELECT
    c.id,
    c.title,
    COUNT(e.id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e
    ON c.id = e.course_id
GROUP BY c.id, c.title
ORDER BY enrollment_count DESC;


-- 11. Course statistics
SELECT
    COUNT(*) AS total_courses,
    AVG(likes) AS average_likes,
    MAX(likes) AS maximum_likes,
    MIN(likes) AS minimum_likes
FROM courses;


-- 12. Statistics by course type
SELECT
    is_elective,
    COUNT(*) AS course_count,
    AVG(likes) AS average_likes
FROM courses
GROUP BY is_elective;