/* Create Table example:
CREATE TABLE IF NOT EXISTS tests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;
*/
CREATE TABLE IF NOT EXISTS Result (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    Task1 VARCHAR(50) NOT NULL,
    Task2 VARCHAR(50) NOT NULL,
    Task3 VARCHAR(50) NOT NULL,
    Task4 VARCHAR(50) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Students (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Student VARCHAR(50) NOT NULL,
    StudentID INT,
)  ENGINE=INNODB;

-- Add index for unique records
ALTER TABLE `internship`.`Result` ADD INDEX `ID`, ADD UNIQUE `ID` (`ID`);
ALTER TABLE `internship`.`Result` ADD UNIQUE `StudentID` (`ID`, `StudentID`);
ALTER TABLE `internship`.`Students` ADD INDEX `ID`, ADD UNIQUE `ID` (`ID`);
ALTER TABLE `internship`.`Students` ADD UNIQUE `StudentID` (`ID`, `StudentID`);
-- ALTER TABLE `Result` CHANGE `ID` `ID` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;

-- Show all records FROM `Students`
-- SELECT * FROM `Students` WHERE 1 

-- Insert records manualy. Every Student is new line
INSERT INTO `Students`(ID, Student, StudentID) VALUES (1,'Назар Винник',1)
INSERT INTO `Students`(ID, Student, StudentID) VALUES (2,'Александр Рекун',2)
INSERT INTO `Students`(ID, Student, StudentID) VALUES (3,'Олег Бандрівський',3)
INSERT INTO `Result`(`ID`, `StudentID`, `Task1`, `Task2`, `Task3`, `Task4`) VALUES (1,1,'Done','Done','Done','Done')
INSERT INTO `Result`(`ID`, `StudentID`, `Task1`, `Task2`, `Task3`, `Task4`) VALUES (2,2,'Done','Done','Done','Done')
INSERT INTO `Result`(`ID`, `StudentID`, `Task1`, `Task2`, `Task3`, `Task4`) VALUES (3,3,'Done','Done','Done','Done')
-- .....

-- Second way to import data it use phpmyadmin-import
