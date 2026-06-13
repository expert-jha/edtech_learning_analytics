select * from edtech.enrollment_statuses;


INSERT INTO edtech.students (student_id, full_name, email, country, signup_date)
VALUES (20749, 'Aarav Sharma', 'aarav.sharma20749@gmail.com', 'India', '2024-01-15');

INSERT INTO edtech.students (student_id, full_name, email, country, signup_date)
VALUES (23615, 'Ananya Iyer', 'ananya.iyer23615@gmail.com', 'India', '2024-02-20');

INSERT INTO edtech.students (student_id, full_name, email, country, signup_date)
VALUES (24518, 'Rohan Verma', 'rohan.verma24518@gmail.com', 'India', '2024-03-05');

copy edtech.enrollment_statuses (status_id, status_name)
FROM 'D:\edtech_learning_analytics\data\enrollment_statuses.csv' DELIMITER ',' CSV HEADER;

copy edtech.payment_methods (payment_method_id,payment_method_name)
FROM 'D:\edtech_learning_analytics\data\payment_methods.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.course_categories (category_id,category_name)
FROM 'D:\edtech_learning_analytics\data\course_categories.csv'
DELIMITER ',' CSV HEADER;


copy edtech.students (student_id,full_name,email,country,signup_date)
FROM 'D:\edtech_learning_analytics\data\students.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.instructors (instructor_id,instructor_name,email,expertise,join_date)
FROM 'D:\edtech_learning_analytics\data\instructors.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.courses (course_id,instructor_id,category_id,course_name,difficulty_level,price,course_duration_hours,launch_date,is_active)
FROM 'D:\edtech_learning_analytics\data\courses.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.lessons (lesson_id,course_id,lesson_title,lesson_sequence_no,lesson_duration_minutes)
FROM 'D:\edtech_learning_analytics\data\lessons.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.quizzes (quiz_id,course_id,quiz_title,total_marks,passing_marks)
FROM 'D:\edtech_learning_analytics\data\quizzes.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.enrollments (enrollment_id,student_id,course_id,status_id,enrollment_date,completion_date)
FROM 'D:\edtech_learning_analytics\data\enrollments.csv' 
DELIMITER ',' CSV HEADER;

copy edtech.payments (payment_id,student_id,course_id,payment_method_id,amount,payment_date)
FROM 'D:\edtech_learning_analytics\data\payments.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.lesson_progress (progress_id,student_id,lesson_id,completion_percentage,last_accessed)
FROM 'D:\edtech_learning_analytics\data\lesson_progress.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.quiz_attempts (attempt_id,student_id,quiz_id,score,attempt_date)
FROM 'D:\edtech_learning_analytics\data\quiz_attempts.csv' 
DELIMITER ',' CSV HEADER;


copy edtech.certificates (certificate_id,student_id,course_id,issue_date)
FROM 'D:\edtech_learning_analytics\data\certificates.csv' 
DELIMITER ',' CSV HEADER;