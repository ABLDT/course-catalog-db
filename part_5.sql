-- 1. UNIQUE violation 23505 409 Conflict
INSERT INTO students (name, email)
VALUES ('Test Student', 'aigerim@example.com');


-- 2. NOT NULL violation 23502 422 Unprocessable Entity
INSERT INTO students (name, email)
VALUES (NULL, 'test@example.com');


-- 3. CHECK violation 23502 422 Unprocessable Entity
INSERT INTO courses (
    id,
    title,
    description,
    credits
)
VALUES (
    'bad-course',
    'Bad Course',
    'Invalid credits',
    -5
);


-- 4. FOREIGN KEY violation 23505 409 Conflict
INSERT INTO enrollments (
    student_id,
    course_id
)
VALUES (
    9999,
    'web-security'
);


-- 5. Composite UNIQUE violation 23505 409 Conflict
INSERT INTO enrollments (
    student_id,
    course_id
)
VALUES (
    1,
    'web-security'
);