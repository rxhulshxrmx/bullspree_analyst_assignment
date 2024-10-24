-- Problem 1: User Behavior Tracking
DELIMITER //

CREATE PROCEDURE sp_user_behavior_tracking()
BEGIN
    -- Result Set 1: User Registration and Engagement Metrics
    SELECT 
        DATE(u.created_at) AS date,
        COUNT(DISTINCT u.user_id) AS new_users,
        COUNT(DISTINCT CASE WHEN u.status = 'uninstalled' THEN u.user_id END) AS uninstalls,
        COUNT(DISTINCT up.purchase_id) AS purchases,
        COUNT(DISTINCT qa.attempt_id) AS quiz_attempts,
        ROUND(AVG(TIMESTAMPDIFF(MINUTE, uas.start_time, uas.end_time)), 2) AS avg_session_minutes
    FROM users u
    LEFT JOIN user_purchases up ON u.user_id = up.user_id AND DATE(u.created_at) = DATE(up.created_at)
    LEFT JOIN quiz_attempts qa ON u.user_id = qa.user_id AND DATE(u.created_at) = DATE(qa.attempt_time)
    LEFT JOIN user_app_sessions uas ON u.user_id = uas.user_id AND DATE(u.created_at) = DATE(uas.start_time)
    GROUP BY DATE(u.created_at)
    ORDER BY date;

    -- Result Set 2: Course Performance Metrics
    SELECT 
        c.course_id,
        c.course_name,
        c.difficulty_level,
        COUNT(DISTINCT uci.user_id) AS total_views,
        COUNT(DISTINCT up.user_id) AS total_purchases,
        COUNT(DISTINCT CASE WHEN cp.completion_status = 'completed' THEN cp.user_id END) AS completions,
        ROUND(AVG(qa.score), 2) AS avg_quiz_score,
        MIN(TIMESTAMPDIFF(DAY, u.created_at, up.created_at)) AS min_days_to_purchase,
        AVG(TIMESTAMPDIFF(DAY, u.created_at, up.created_at)) AS avg_days_to_purchase,
        MAX(TIMESTAMPDIFF(DAY, u.created_at, up.created_at)) AS max_days_to_purchase
    FROM courses c
    LEFT JOIN user_course_interactions uci ON c.course_id = uci.course_id
    LEFT JOIN user_purchases up ON c.course_id = up.course_id
    LEFT JOIN course_progress cp ON c.course_id = cp.course_id
    LEFT JOIN users u ON up.user_id = u.user_id
    LEFT JOIN modules m ON c.course_id = m.course_id
    LEFT JOIN quizzes q ON m.module_id = q.module_id
    LEFT JOIN quiz_attempts qa ON q.quiz_id = qa.quiz_id
    GROUP BY c.course_id, c.course_name, c.difficulty_level;

    -- Result Set 3: User Purchase Patterns
    SELECT 
        u.user_id,
        COUNT(DISTINCT up.course_id) AS courses_purchased,
        MIN(TIMESTAMPDIFF(DAY, up1.created_at, up2.created_at)) AS min_gap_between_purchases,
        AVG(TIMESTAMPDIFF(DAY, up1.created_at, up2.created_at)) AS avg_gap_between_purchases,
        SUM(up.amount) AS total_spent,
        COUNT(DISTINCT qa.quiz_id) AS quizzes_attempted,
        ROUND(AVG(qa.score), 2) AS avg_quiz_score
    FROM users u
    LEFT JOIN user_purchases up ON u.user_id = up.user_id
    LEFT JOIN user_purchases up1 ON u.user_id = up1.user_id
    LEFT JOIN user_purchases up2 ON u.user_id = up2.user_id AND up1.course_id < up2.course_id
    LEFT JOIN quiz_attempts qa ON u.user_id = qa.user_id
    WHERE up.status = 'completed'
    GROUP BY u.user_id;
END //

DELIMITER ;

-- Problem 2: Retention Campaign Analysis
DELIMITER //
CREATE PROCEDURE sp_retention_metrics()
BEGIN
    -- Cohort Retention Analysis
    WITH UserCohorts AS (
        SELECT 
            user_id,
            DATE_FORMAT(created_at, '%Y-%m-01') AS cohort_month,
            TIMESTAMPDIFF(MONTH, DATE_FORMAT(created_at, '%Y-%m-01'), 
                         DATE_FORMAT(last_accessed_at, '%Y-%m-01')) AS month_number
        FROM users u
        JOIN user_app_sessions uas ON u.user_id = uas.user_id
    )
    SELECT 
        cohort_month,
        month_number,
        COUNT(DISTINCT user_id) AS active_users,
        COUNT(DISTINCT user_id) * 100.0 / 
            FIRST_VALUE(COUNT(DISTINCT user_id)) OVER (PARTITION BY cohort_month ORDER BY month_number) 
        AS retention_rate
    FROM UserCohorts
    GROUP BY cohort_month, month_number
    ORDER BY cohort_month, month_number;

    -- Course Completion Analysis
    SELECT 
        c.course_id,
        c.course_name,
        c.difficulty_level,
        COUNT(DISTINCT cp.user_id) AS enrolled_users,
        SUM(CASE WHEN cp.completion_status = 'completed' THEN 1 ELSE 0 END) AS completions,
        SUM(CASE WHEN cp.completion_status = 'abandoned' THEN 1 ELSE 0 END) AS abandonments,
        ROUND(AVG(TIMESTAMPDIFF(DAY, cp.start_date, cp.completion_date))) AS avg_completion_days
    FROM courses c
    LEFT JOIN course_progress cp ON c.course_id = cp.course_id
    GROUP BY c.course_id, c.course_name, c.difficulty_level;

    -- User Reactivation Metrics
    SELECT 
        DATE(uas.start_time) AS date,
        COUNT(DISTINCT CASE WHEN DATEDIFF(uas.start_time, u.created_at) > 30 THEN u.user_id END) AS returning_users,
        COUNT(DISTINCT CASE WHEN up.status = 'completed' THEN up.user_id END) AS purchasing_users
    FROM user_app_sessions uas
    JOIN users u ON uas.user_id = u.user_id
    LEFT JOIN user_purchases up ON u.user_id = up.user_id 
        AND DATE(up.created_at) = DATE(uas.start_time)
    GROUP BY DATE(uas.start_time)
    ORDER BY date;
END //
DELIMITER ;

CALL sp_user_behavior_tracking();

