-- =====================================================
-- Project : OULAD Learning Analytics
-- File    : 05_indexes.sql
-- Purpose : Performance Optimization
-- =====================================================

-- =====================================================
-- ASSESSMENTS
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_assessments_module
ON learning_analytics.assessments (
    code_module,
    code_presentation
);

CREATE INDEX IF NOT EXISTS idx_assessments_type
ON learning_analytics.assessments (
    assessment_type
);

-- =====================================================
-- STUDENT ASSESSMENT
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_student_assessment_student
ON learning_analytics.student_assessment (
    id_student
);

CREATE INDEX IF NOT EXISTS idx_student_assessment_assessment
ON learning_analytics.student_assessment (
    id_assessment
);

CREATE INDEX IF NOT EXISTS idx_student_assessment_score
ON learning_analytics.student_assessment (
    score
);

-- =====================================================
-- STUDENT INFO
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_student_info_student
ON learning_analytics.student_info (
    id_student
);

CREATE INDEX IF NOT EXISTS idx_student_info_module
ON learning_analytics.student_info (
    code_module,
    code_presentation
);

CREATE INDEX IF NOT EXISTS idx_student_info_result
ON learning_analytics.student_info (
    final_result
);

CREATE INDEX IF NOT EXISTS idx_student_info_region
ON learning_analytics.student_info (
    region
);

-- =====================================================
-- STUDENT REGISTRATION
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_student_registration_student
ON learning_analytics.student_registration (
    id_student
);

CREATE INDEX IF NOT EXISTS idx_student_registration_module
ON learning_analytics.student_registration (
    code_module,
    code_presentation
);

-- =====================================================
-- STUDENT VLE
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_student_vle_student
ON learning_analytics.student_vle (
    id_student
);

CREATE INDEX IF NOT EXISTS idx_student_vle_site
ON learning_analytics.student_vle (
    id_site
);

CREATE INDEX IF NOT EXISTS idx_student_vle_activity_date
ON learning_analytics.student_vle (
    activity_date
);

CREATE INDEX IF NOT EXISTS idx_student_vle_student_date
ON learning_analytics.student_vle (
    id_student,
    activity_date
);

-- =====================================================
-- VLE
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_vle_site
ON learning_analytics.vle (
    id_site
);

CREATE INDEX IF NOT EXISTS idx_vle_activity_type
ON learning_analytics.vle (
    activity_type
);

CREATE INDEX IF NOT EXISTS idx_vle_module
ON learning_analytics.vle (
    code_module,
    code_presentation
);

-- =====================================================
-- COURSES
-- =====================================================

CREATE INDEX IF NOT EXISTS idx_courses_module
ON learning_analytics.courses (
    code_module
);

CREATE INDEX IF NOT EXISTS idx_courses_presentation
ON learning_analytics.courses (
    code_presentation
);