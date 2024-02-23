CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `roles_id` integer,
  `firstname` varchar(255),
  `lastname` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `image` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `roles` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `events` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `image` varchar(255),
  `description` text,
  `start_date` datetime,
  `ended_date` datetime,
  `duration` time,
  `price` decimal,
  `available_tickets` integer,
  `reserved_tickets` integer,
  `created_at` timestamp
);

CREATE TABLE `booking` (
  `id` integer,
  `user_id` integer,
  `event_id` integer,
  `created_at` timestamp
);

CREATE TABLE `event_tag` (
  `event_id` integer,
  `tag_id` integer
);

CREATE TABLE `tags` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `event_location` (
  `id` integer,
  `event_id` integer,
  `location_id` integer
);

CREATE TABLE `locations` (
  `id` integer PRIMARY KEY,
  `name` varchar(255),
  `address` varchar(255),
  `description` text,
  `created_at` timestamp
);

ALTER TABLE `users` ADD FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`);

ALTER TABLE `booking` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `booking` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

ALTER TABLE `event_tag` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

ALTER TABLE `event_tag` ADD FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

ALTER TABLE `event_location` ADD FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

ALTER TABLE `event_location` ADD FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);
