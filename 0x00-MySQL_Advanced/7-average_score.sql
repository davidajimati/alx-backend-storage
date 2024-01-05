-- script that creates a stored procedure ComputeAverageScoreForUser that computes and stores the average score for a student.
-- The average score can be a decimal

DELIMITER //

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

CREATE PROCEDURE ComputeAverageScoreForUser(IN u_id INT)
BEGIN
    DECLARE computed_avg DECIMAL(10, 2);

    SELECT AVG(score) INTO computed_avg
    FROM corrections
    WHERE user_id = u_id;

    UPDATE users
    SET average_score = computed_avg
    WHERE id = u_id;
END;
//

DELIMITER ;
