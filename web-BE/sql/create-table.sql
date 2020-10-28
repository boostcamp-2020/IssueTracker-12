CREATE SCHEMA IF NOT EXISTS `IssueTracker` DEFAULT CHARACTER SET utf8 ;
USE `IssueTracker` ;

-- -----------------------------------------------------
-- Table `IssueTracker`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`User` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `social` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IssueTracker`.`Issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`Issue` (
  `issue_id` INT NOT NULL AUTO_INCREMENT,
  `writer_id` VARCHAR(45) NOT NULL,
  `write_time` TIMESTAMP NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `is_open` TINYINT NOT NULL,
  PRIMARY KEY (`issue_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IssueTracker`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`Comment` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `writer_id` INT NOT NULL,
  `issue_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `write_time` TIMESTAMP NOT NULL,
  `is_issue_content` TINYINT NOT NULL COMMENT '이슈의 본문에 해당하는 댓글인지 아니면 그냥 댓글인지를 나타내는 column',
  `Issue_issue_id` INT NOT NULL,
  PRIMARY KEY (`comment_id`, `Issue_issue_id`),
  INDEX `fk_Comment_Issue_idx` (`Issue_issue_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comment_Issue`
    FOREIGN KEY (`Issue_issue_id`)
    REFERENCES `IssueTracker`.`Issue` (`issue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IssueTracker`.`Label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`Label` (
  `label_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `color` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`label_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IssueTracker`.`Milestone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`Milestone` (
  `milestone_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `due_date` DATE NOT NULL,
  `content` TEXT NULL,
  PRIMARY KEY (`milestone_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IssueTracker`.`Issue_Label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`Issue_Label` (
  `Label_label_id` INT NOT NULL,
  `Issue_issue_id` INT NOT NULL,
  PRIMARY KEY (`Label_label_id`, `Issue_issue_id`),
  INDEX `fk_Label_has_Issue_Issue1_idx` (`Issue_issue_id` ASC) VISIBLE,
  INDEX `fk_Label_has_Issue_Label1_idx` (`Label_label_id` ASC) VISIBLE,
  CONSTRAINT `fk_Label_has_Issue_Label1`
    FOREIGN KEY (`Label_label_id`)
    REFERENCES `IssueTracker`.`Label` (`label_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Label_has_Issue_Issue1`
    FOREIGN KEY (`Issue_issue_id`)
    REFERENCES `IssueTracker`.`Issue` (`issue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IssueTracker`.`Assignee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`Assignee` (
  `Issue_issue_id` INT NOT NULL,
  `User_user_id` INT NOT NULL,
  PRIMARY KEY (`Issue_issue_id`, `User_user_id`),
  INDEX `fk_Issue_has_User_User1_idx` (`User_user_id` ASC) VISIBLE,
  INDEX `fk_Issue_has_User_Issue1_idx` (`Issue_issue_id` ASC) VISIBLE,
  CONSTRAINT `fk_Issue_has_User_Issue1`
    FOREIGN KEY (`Issue_issue_id`)
    REFERENCES `IssueTracker`.`Issue` (`issue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Issue_has_User_User1`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `IssueTracker`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IssueTracker`.`Issue_Milestone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IssueTracker`.`Issue_Milestone` (
  `Milestone_milestone_id` INT NOT NULL,
  `Issue_issue_id` INT NOT NULL,
  PRIMARY KEY (`Milestone_milestone_id`, `Issue_issue_id`),
  INDEX `fk_Milestone_has_Issue_Issue1_idx` (`Issue_issue_id` ASC) VISIBLE,
  INDEX `fk_Milestone_has_Issue_Milestone1_idx` (`Milestone_milestone_id` ASC) VISIBLE,
  CONSTRAINT `fk_Milestone_has_Issue_Milestone1`
    FOREIGN KEY (`Milestone_milestone_id`)
    REFERENCES `IssueTracker`.`Milestone` (`milestone_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Milestone_has_Issue_Issue1`
    FOREIGN KEY (`Issue_issue_id`)
    REFERENCES `IssueTracker`.`Issue` (`issue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;