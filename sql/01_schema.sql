
CREATE SCHEMA IF NOT EXISTS edtech;

-- =====================================================
-- REFERENCE TABLES
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.enrollment_statuses (
    status_id SMALLSERIAL PRIMARY KEY,
    status_name VARCHAR(30) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS edtech.payment_methods (
    payment_method_id SMALLSERIAL PRIMARY KEY,
    payment_method_name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS edtech.course_categories (
    category_id SMALLSERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);



-- =====================================================
-- STUDENT Registration
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.students (
    student_id BIGSERIAL PRIMARY KEY,

    full_name VARCHAR(100) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,

    country VARCHAR(100),

    signup_date DATE NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- =====================================================
-- INSTRUCTORS
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.instructors (
    instructor_id BIGSERIAL PRIMARY KEY,

    instructor_name VARCHAR(100) NOT NULL,

    email VARCHAR(255) UNIQUE,

    expertise VARCHAR(150),

    join_date DATE NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- =====================================================
-- COURSES
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.courses (
    course_id BIGSERIAL PRIMARY KEY,

    instructor_id BIGINT NOT NULL,

    category_id SMALLINT NOT NULL,

    course_name VARCHAR(200) NOT NULL,

    difficulty_level VARCHAR(20) NOT NULL
        CHECK (
            difficulty_level IN
            ('Beginner','Intermediate','Advanced')
        ),

    price NUMERIC(10,2) NOT NULL
        CHECK(price >= 0),

    course_duration_hours NUMERIC(6,2),

    launch_date DATE,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_course_instructor
        FOREIGN KEY(instructor_id)
        REFERENCES edtech.instructors(instructor_id),

    CONSTRAINT fk_course_category
        FOREIGN KEY(category_id)
        REFERENCES edtech.course_categories(category_id)
);


-- =====================================================
-- LESSONS
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.lessons (
    lesson_id BIGSERIAL PRIMARY KEY,

    course_id BIGINT NOT NULL,

    lesson_title VARCHAR(250) NOT NULL,

    lesson_sequence_no INTEGER NOT NULL,

    lesson_duration_minutes INTEGER NOT NULL
        CHECK(lesson_duration_minutes > 0),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_lesson_course
        FOREIGN KEY(course_id)
        REFERENCES edtech.courses(course_id)
);



-- =====================================================
-- QUIZZES
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.quizzes (
    quiz_id BIGSERIAL PRIMARY KEY,

    course_id BIGINT NOT NULL,

    quiz_title VARCHAR(200) NOT NULL,

    total_marks INTEGER NOT NULL
        CHECK(total_marks > 0),

    passing_marks INTEGER NOT NULL
        CHECK(passing_marks > 0),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_quiz_course
        FOREIGN KEY(course_id)
        REFERENCES edtech.courses(course_id)
);



-- =====================================================
-- ENROLLMENTS
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.enrollments (
    enrollment_id BIGSERIAL PRIMARY KEY,

    student_id BIGINT NOT NULL,

    course_id BIGINT NOT NULL,

    status_id SMALLINT NOT NULL,

    enrollment_date DATE NOT NULL,

    completion_date DATE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY(student_id)
        REFERENCES edtech.students(student_id),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY(course_id)
        REFERENCES edtech.courses(course_id),

    CONSTRAINT fk_enrollment_status
        FOREIGN KEY(status_id)
        REFERENCES edtech.enrollment_statuses(status_id)
);


-- =====================================================
-- PAYMENTS
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.payments (
    payment_id BIGSERIAL PRIMARY KEY,

    student_id BIGINT NOT NULL,

    course_id BIGINT NOT NULL,

    payment_method_id SMALLINT NOT NULL,

    amount NUMERIC(10,2) NOT NULL
        CHECK(amount > 0),

    payment_date DATE NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_payment_student
        FOREIGN KEY(student_id)
        REFERENCES edtech.students(student_id),

    CONSTRAINT fk_payment_course
        FOREIGN KEY(course_id)
        REFERENCES edtech.courses(course_id),

    CONSTRAINT fk_payment_method
        FOREIGN KEY(payment_method_id)
        REFERENCES edtech.payment_methods(payment_method_id)
);


-- =====================================================
-- PROGRESS
-- =====================================================

CREATE TABLE IF NOT EXISTS edtech.lesson_progress (
    progress_id BIGSERIAL PRIMARY KEY,

    student_id BIGINT NOT NULL,

    lesson_id BIGINT NOT NULL,

    completion_percentage NUMERIC(5,2)
        CHECK(
            completion_percentage >= 0
            AND completion_percentage <= 100
        ),

    last_accessed TIMESTAMP,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_progress_student
        FOREIGN KEY(student_id)
        REFERENCES edtech.students(student_id),

    CONSTRAINT fk_progress_lesson
        FOREIGN KEY(lesson_id)
        REFERENCES edtech.lessons(lesson_id)
);


-- =====================================================
-- QUIZ ATTEMPTS
-- =====================================================


CREATE TABLE IF NOT EXISTS edtech.quiz_attempts (
    attempt_id BIGSERIAL PRIMARY KEY,

    student_id BIGINT NOT NULL,

    quiz_id BIGINT NOT NULL,

    score NUMERIC(5,2) NOT NULL,

    attempt_date DATE NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_attempt_student
        FOREIGN KEY(student_id)
        REFERENCES edtech.students(student_id),

    CONSTRAINT fk_attempt_quiz
        FOREIGN KEY(quiz_id)
        REFERENCES edtech.quizzes(quiz_id)
);


-- =====================================================
-- CERTIFICATES
-- =====================================================


CREATE TABLE IF NOT EXISTS edtech.certificates (
    certificate_id BIGSERIAL PRIMARY KEY,

    student_id BIGINT NOT NULL,

    course_id BIGINT NOT NULL,

    issue_date DATE NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_certificate_student
        FOREIGN KEY(student_id)
        REFERENCES edtech.students(student_id),

    CONSTRAINT fk_certificate_course
        FOREIGN KEY(course_id)
        REFERENCES edtech.courses(course_id)
);


