-- Drop and create database
DROP DATABASE IF EXISTS learning_platform;
CREATE DATABASE learning_platform;
USE learning_platform;

-- Core Tables
CREATE TABLE users (
    user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CHECK (status IN ('active', 'inactive', 'suspended', 'uninstalled'))
);

CREATE TABLE courses (
    course_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    difficulty_level VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CHECK (difficulty_level IN ('beginner', 'intermediate', 'advanced'))
);

CREATE TABLE modules (
    module_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT NOT NULL,
    module_name VARCHAR(100) NOT NULL,
    description TEXT,
    sequence_number INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE (course_id, sequence_number)
);

CREATE TABLE quizzes (
    quiz_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    module_id BIGINT NOT NULL,
    quiz_name VARCHAR(100) NOT NULL,
    description TEXT,
    passing_score INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (passing_score BETWEEN 0 AND 100),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

-- Tracking Tables
CREATE TABLE user_app_sessions (
    session_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    start_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP,
    device_info JSON,
    ip_address VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE user_purchases (
    purchase_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE course_progress (
    progress_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    completion_status VARCHAR(20) NOT NULL,
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completion_date TIMESTAMP,
    last_accessed_at TIMESTAMP,
    CHECK (completion_status IN ('not_started', 'in_progress', 'completed', 'abandoned')),
    UNIQUE (user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE quiz_attempts (
    attempt_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    quiz_id BIGINT NOT NULL,
    score INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    attempt_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completion_time TIMESTAMP,
    CHECK (status IN ('started', 'completed', 'passed', 'failed')),
    CHECK (score BETWEEN 0 AND 100),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);

CREATE TABLE user_course_interactions (
    interaction_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    interaction_type VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (interaction_type IN ('view', 'bookmark', 'share', 'download', 'review')),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Indexes for better query performance
CREATE INDEX idx_users_status ON users(status);
CREATE INDEX idx_courses_difficulty ON courses(difficulty_level);
CREATE INDEX idx_modules_course ON modules(course_id);
CREATE INDEX idx_quizzes_module ON quizzes(module_id);
CREATE INDEX idx_sessions_user ON user_app_sessions(user_id);
CREATE INDEX idx_sessions_time ON user_app_sessions(start_time);
CREATE INDEX idx_purchases_user ON user_purchases(user_id);
CREATE INDEX idx_purchases_status ON user_purchases(status);
CREATE INDEX idx_progress_user_course ON course_progress(user_id, course_id);
CREATE INDEX idx_progress_status ON course_progress(completion_status);
CREATE INDEX idx_quiz_attempts_user ON quiz_attempts(user_id);
CREATE INDEX idx_quiz_attempts_quiz ON quiz_attempts(quiz_id);
CREATE INDEX idx_interactions_user_course ON user_course_interactions(user_id, course_id);
