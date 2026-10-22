-- =====================================
-- Index and EXPLAIN
-- =====================================

-- Before index
EXPLAIN ANALYZE
SELECT *
FROM enrollments
WHERE course_id = 'web-security';


-- Create index
CREATE INDEX idx_enrollments_course_id
ON enrollments(course_id);


-- After index
EXPLAIN ANALYZE
SELECT *
FROM enrollments
WHERE course_id = 'web-security';