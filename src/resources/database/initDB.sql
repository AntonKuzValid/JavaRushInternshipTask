USE test;
DROP TABLE IF EXISTS task;
CREATE TABLE task( ID INT(11) NOT NULL AUTO_INCREMENT,
  TASK_DESCRIPTION VARCHAR(255) NOT NULL,
  IS_DONE INT(11) NOT NULL,
  DATE DATE NOT NULL ,
  PRIMARY KEY (ID))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Wake up', 1,'2017.10.16');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Take a shower', 1,'2017.10.16');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Go to work', 1,'2017.10.16');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('take meal', 0,'2017.10.16');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Sleep', 1,'2017.10.16');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Wake up', 1,'2017.10.17');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Watch TV', 1,'2017.10.17');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Call mom', 0,'2017.10.17');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Play game', 1,'2017.10.17');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Sleep', 0,'2017.10.17');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Wake up', 0,'2017.10.18');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Have breakfast', 0,'2017.10.18');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Code hard', 1,'2017.10.18');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Find girlfriend', 0,'2017.10.18');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Call sex-phone', 1,'2017.10.18');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Wake up', 1,'2017.10.19');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Cry', 1,'2017.10.19');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Watch TV', 1,'2017.10.19');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Eat ice-cream', 1,'2017.10.19');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Go to shop', 1,'2017.10.19');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Sleep', 1,'2017.10.19');
INSERT INTO task (TASK_DESCRIPTION, IS_DONE, DATE) VALUES ('Wake up', 1,'2017.10.20');