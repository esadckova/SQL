-- Таблицы заполнены

USE vk;

SHOW TABLES;
DROP TABLE posts;

CREATE TABLE posts (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
 user_id INT UNSIGNED COMMENT "Отправил", 
 community_id INT UNSIGNED COMMENT "",
 head VARCHAR(255) COMMENT "Заголовок",
 body TEXT NOT NULL COMMENT "Тело поста",
 is_public BOOLEAN DEFAULT TRUE COMMENT "Опубликовано",
 created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Посты";

DROP TABLE post_media;

CREATE TABLE post_media (
  post_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пост",
  media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на медиа",
  PRIMARY KEY (post_id, media_id) COMMENT 'Составной первичный ключ',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиа посты";

ALTER TABLE posts ADD CONSTRAINT post_user_id FOREIGN KEY (user_id) REFERENCES users(id); 
ALTER TABLE posts ADD CONSTRAINT posts_community_id FOREIGN KEY (community_id) REFERENCES communities(id); 
ALTER TABLE post_media ADD CONSTRAINT post_media_post_id FOREIGN KEY (post_id) REFERENCES posts(id); 
ALTER TABLE post_media ADD CONSTRAINT post_media_media_id FOREIGN KEY (media_id) REFERENCES media(id); 

DROP TABLE likes;

CREATE TABLE likes (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
 user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на поставившего лайк",
 target_id INT UNSIGNED NOT NULL COMMENT 'Ссылка объект с лайком',
 target_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип объекта с лайком",
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
 updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
 ) COMMENT "Таблица лайков";
 
 ALTER TABLE likes ADD CONSTRAINT likes_user_id FOREIGN KEY (user_id) REFERENCES users(id); 
 
 DROP TABLE target_types;
 
 CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы лайков";

  ALTER TABLE target_types ADD CONSTRAINT likes_target_type_id FOREIGN KEY (target_type_id) REFERENCES target_types(id); 


-- Курсовая работа - интернет-аптека
