-- drop table posts;
-- drop table threads;
-- drop table sessions;
-- drop table users;


CREATE SCHEMA IF NOT EXISTS `chitchat` DEFAULT CHARACTER SET utf8 ;
USE `chitchat` ;

-- -----------------------------------------------------
-- Table `chitchat`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chitchat`.`users` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(64) NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC),
  UNIQUE INDEX `uuid` (`uuid` ASC),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `chitchat`.`threads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chitchat`.`threads` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(64) NOT NULL,
  `topic` TEXT NULL DEFAULT NULL,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC),
  UNIQUE INDEX `uuid` (`uuid` ASC),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `threads_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `chitchat`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `chitchat`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chitchat`.`posts` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(64) NOT NULL,
  `body` TEXT NULL DEFAULT NULL,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `thread_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC),
  UNIQUE INDEX `uuid` (`uuid` ASC),
  INDEX `user_id` (`user_id` ASC),
  INDEX `thread_id` (`thread_id` ASC),
  CONSTRAINT `posts_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `chitchat`.`users` (`id`),
  CONSTRAINT `posts_ibfk_2`
    FOREIGN KEY (`thread_id`)
    REFERENCES `chitchat`.`threads` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `chitchat`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chitchat`.`sessions` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(64) NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC),
  UNIQUE INDEX `uuid` (`uuid` ASC),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `sessions_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `chitchat`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
