USE vk;

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

-- Тема интернет аптека
 
