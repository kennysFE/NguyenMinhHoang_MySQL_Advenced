/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `photo_id` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `follows` (
  `follower_id` int NOT NULL,
  `followee_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`follower_id`,`followee_id`),
  KEY `followee_id` (`followee_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followee_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `likes` (
  `photo_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`photo_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `photo_tags` (
  `photo_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`photo_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `photo_tags_ibfk_1` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`),
  CONSTRAINT `photo_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(300) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





INSERT INTO `likes` (`photo_id`, `user_id`, `created_at`) VALUES
(1, 1, '2021-12-01');
INSERT INTO `likes` (`photo_id`, `user_id`, `created_at`) VALUES
(1, 2, '2021-12-02');
INSERT INTO `likes` (`photo_id`, `user_id`, `created_at`) VALUES
(1, 3, '2021-12-03');
INSERT INTO `likes` (`photo_id`, `user_id`, `created_at`) VALUES
(1, 4, '2021-12-01'),
(1, 5, '2021-12-04'),
(1, 6, '2021-12-01'),
(1, 7, '2021-12-01'),
(1, 8, '2021-12-01'),
(1, 9, '2021-12-01'),
(1, 10, '2021-12-01'),
(1, 11, '2021-12-01'),
(1, 12, '2021-12-01'),
(1, 13, '2021-12-01'),
(2, 1, '2021-12-01'),
(2, 2, '2021-12-01'),
(2, 3, '2021-12-01'),
(2, 4, '2021-12-01'),
(2, 5, '2021-12-01'),
(2, 6, '2021-12-01'),
(2, 7, '2021-12-01'),
(2, 8, '2021-12-01'),
(3, 1, '2021-12-01'),
(3, 2, '2021-12-01'),
(3, 3, '2021-12-01'),
(3, 4, '2021-12-01'),
(3, 5, '2021-12-01'),
(3, 6, '2021-12-01'),
(3, 7, '2021-12-01'),
(3, 8, '2021-12-01'),
(3, 9, '2021-12-01');

INSERT INTO `photo_tags` (`photo_id`, `tag_id`) VALUES
(1, 1);
INSERT INTO `photo_tags` (`photo_id`, `tag_id`) VALUES
(2, 1);
INSERT INTO `photo_tags` (`photo_id`, `tag_id`) VALUES
(3, 1);
INSERT INTO `photo_tags` (`photo_id`, `tag_id`) VALUES
(4, 1),
(5, 1),
(8, 1),
(1, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(6, 5),
(1, 6),
(2, 6),
(3, 6),
(5, 6);

INSERT INTO `photos` (`id`, `image_url`, `user_id`, `created_at`) VALUES
(1, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 1, '2021-08-21');
INSERT INTO `photos` (`id`, `image_url`, `user_id`, `created_at`) VALUES
(2, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 1, '2021-09-22');
INSERT INTO `photos` (`id`, `image_url`, `user_id`, `created_at`) VALUES
(3, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 2, '2021-09-14');
INSERT INTO `photos` (`id`, `image_url`, `user_id`, `created_at`) VALUES
(4, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 2, '2021-09-17'),
(5, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 3, '2021-09-18'),
(6, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 3, '2021-08-15'),
(7, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 4, '2021-10-13'),
(8, 'https://assets.imgix.net/unsplash/transport.jpg?auto=compress&w=900&h=600&fit=crop', 5, '2021-09-14');

INSERT INTO `tags` (`id`, `tag_name`, `created_at`) VALUES
(1, 'like', '2022-11-22');
INSERT INTO `tags` (`id`, `tag_name`, `created_at`) VALUES
(2, 'like', '2022-11-23');
INSERT INTO `tags` (`id`, `tag_name`, `created_at`) VALUES
(3, 'like', '2022-01-26');
INSERT INTO `tags` (`id`, `tag_name`, `created_at`) VALUES
(4, 'like', '2022-12-22'),
(5, 'like', '2022-02-15'),
(6, 'hate', '2022-07-19'),
(7, 'hate', '2022-05-28'),
(8, 'hate', '2022-06-12'),
(9, 'normal', '2022-07-02'),
(10, 'normal', '2022-08-21');

INSERT INTO `users` (`id`, `username`, `created_at`) VALUES
(1, 'Nguyen Minh Hoang', '2021-08-21');
INSERT INTO `users` (`id`, `username`, `created_at`) VALUES
(2, 'Ngo Tan Hy', '2021-09-22');
INSERT INTO `users` (`id`, `username`, `created_at`) VALUES
(3, 'Tran Cuong', '2021-09-14');
INSERT INTO `users` (`id`, `username`, `created_at`) VALUES
(4, 'Tran Van An', '2021-10-12'),
(5, 'Le Di An', '2021-11-10'),
(6, 'Nguyen Thi Lan Phuong', '2021-12-11'),
(7, 'Do Duy Manh', '2022-01-12'),
(8, 'Do Hung Dung', '2022-02-12'),
(9, 'Nguyen Cong Phuong', '2022-03-12'),
(10, 'Nguyen Hung Ba', '2022-04-11'),
(11, 'Doan Van Hau', '2022-09-13'),
(12, 'Nguyen Huy Hoang', '2022-08-15'),
(13, 'Le Ngo Nguyen Khang', '2022-10-11');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;