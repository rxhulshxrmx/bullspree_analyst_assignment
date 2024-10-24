-- Dummy Data Insert Queries for Stock Market Courses
-- 1. Users Table
INSERT INTO users (username, email, password_hash, status)
VALUES 
('john_trader', 'john@example.com', 'hashed_password1', 'active'),
('jane_investor', 'jane@example.com', 'hashed_password2', 'inactive'),
('alice_broker', 'alice@example.com', 'hashed_password3', 'suspended'),
('bob_hedgefund', 'bob@example.com', 'hashed_password4', 'active'),
('charlie_daytrader', 'charlie@example.com', 'hashed_password5', 'uninstalled');

-- 2. Courses Table
INSERT INTO courses (course_name, description, difficulty_level, price)
VALUES 
('Stock Market Basics', 'Learn the fundamentals of the stock market and how it operates.', 'beginner', 59.99),
('Options Trading Mastery', 'Master the art of options trading and maximize profits.', 'advanced', 249.99),
('Technical Analysis for Stocks', 'Understand charts and technical indicators to predict market movements.', 'intermediate', 149.99),
('Swing Trading Strategies', 'Learn profitable swing trading strategies for quick gains.', 'intermediate', 129.99),
('Investing for the Long Term', 'How to build a diversified portfolio for long-term growth.', 'beginner', 79.99);

-- 3. Modules Table
INSERT INTO modules (course_id, module_name, description, sequence_number)
VALUES 
(1, 'Introduction to Stock Market', 'Overview of stock market basics.', 1),
(1, 'Types of Stocks and Shares', 'Learn about different types of stocks, ETFs, and dividends.', 2),
(2, 'Understanding Options Contracts', 'A deep dive into options contracts and their structures.', 1),
(2, 'Advanced Options Strategies', 'Strategies like iron condor, straddle, and more.', 2),
(3, 'Chart Patterns', 'Learn key chart patterns like head & shoulders, triangles, etc.', 1),
(3, 'Technical Indicators', 'Understanding indicators like RSI, MACD, and moving averages.', 2);

-- 4. Quizzes Table
INSERT INTO quizzes (module_id, quiz_name, description, passing_score)
VALUES 
(1, 'Stock Market Basics Quiz', 'Test your knowledge of stock market fundamentals.', 70),
(1, 'Stock Types Quiz', 'Quiz on different types of stocks and their properties.', 75),
(2, 'Options Contracts Quiz', 'Evaluate your understanding of options contracts.', 80),
(3, 'Chart Patterns Quiz', 'Test your knowledge of technical chart patterns.', 65),
(3, 'Technical Indicators Quiz', 'Quiz on understanding technical indicators.', 70);

-- 5. User App Sessions
INSERT INTO user_app_sessions (user_id, start_time, end_time, device_info, ip_address)
VALUES 
(1, NOW(), NOW() + INTERVAL 2 HOUR, '{"device":"iPhone 12"}', '192.168.1.1'),
(2, NOW(), NOW() + INTERVAL 1 HOUR, '{"device":"Samsung Galaxy S20"}', '192.168.1.2'),
(3, NOW(), NOW() + INTERVAL 3 HOUR, '{"device":"iPad Pro"}', '192.168.1.3'),
(4, NOW(), NOW() + INTERVAL 2 HOUR, '{"device":"MacBook Pro"}', '192.168.1.4'),
(5, NOW(), NOW() + INTERVAL 1 HOUR, '{"device":"Dell XPS"}', '192.168.1.5');

-- 6. User Purchase
INSERT INTO user_purchases (user_id, course_id, amount, status)
VALUES 
(1, 1, 59.99, 'completed'),
(2, 2, 249.99, 'pending'),
(3, 3, 149.99, 'completed'),
(4, 4, 129.99, 'failed'),
(5, 5, 79.99, 'refunded');

-- 7. Course Progress Table
INSERT INTO course_progress (user_id, course_id, completion_status, start_date, completion_date, last_accessed_at)
VALUES 
(1, 1, 'completed', NOW() - INTERVAL 30 DAY, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 1 DAY),
(2, 2, 'in_progress', NOW() - INTERVAL 10 DAY, NULL, NOW() - INTERVAL 2 DAY),
(3, 3, 'completed', NOW() - INTERVAL 15 DAY, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 1 DAY),
(4, 4, 'not_started', NOW(), NULL, NULL),
(5, 5, 'abandoned', NOW() - INTERVAL 20 DAY, NULL, NOW() - INTERVAL 5 DAY);

-- 8. Quiz Attempts Table
INSERT INTO quiz_attempts (user_id, quiz_id, score, status, attempt_time, completion_time)
VALUES 
(1, 1, 80, 'passed', NOW() - INTERVAL 7 DAY, NOW() - INTERVAL 7 DAY), 
(2, 2, 50, 'failed', NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY), 
(3, 3, 75, 'passed', NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY), 
(4, 4, 60, 'started', NOW(), NULL),                                   
(5, 5, 70, 'passed', NOW() - INTERVAL 10 DAY, NOW() - INTERVAL 10 DAY);

-- 9. User Course Interaction Table
INSERT INTO user_course_interactions (user_id, course_id, interaction_type, status, created_at)
VALUES 
(1, 1, 'view', 'active', NOW() - INTERVAL 30 DAY),
(2, 2, 'bookmark', 'active', NOW() - INTERVAL 15 DAY),
(3, 3, 'share', 'active', NOW() - INTERVAL 10 DAY),
(4, 4, 'download', 'active', NOW()),
(5, 5, 'review', 'active', NOW() - INTERVAL 5 DAY);

