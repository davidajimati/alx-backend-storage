-- script that creates a stored procedure AddBonus that adds a new correction for a student

DELIMITER //

DROP PROCEDURE IF EXISTS AddBonus;

CREATE PROCEDURE AddBonus(IN u_id INT , IN u_project_name VARCHAR(255), IN u_score INT)
BEGIN
    DECLARE u_project_id INT;
    IF NOT EXISTS (SELECT id FROM projects WHERE name = u_project_name) THEN
        INSERT INTO projects (name) VALUES (u_project_name);
        SET u_project_id = LAST_INSERT_ID();
    ELSE
        SELECT id INTO u_project_id FROM projects WHERE name = u_project_name;
    END IF;
    INSERT INTO corrections (user_id, project_id, score) VALUES (u_id, (SELECT id FROM projects WHERE name = u_project_name LIMIT 1), u_score);
END;
//

DELIMITER ;
