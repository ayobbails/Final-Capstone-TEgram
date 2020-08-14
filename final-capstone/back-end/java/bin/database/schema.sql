BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_photos;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE user_photos (
id serial NOT NULL,
user_id int4 NOT NULL,
photo_url text NOT NULL,
description text,
date_added TIMESTAMP DEFAULT(CURRENT_TIMESTAMP),
CONSTRAINT pk_user_photos_id PRIMARY KEY (id),
CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('1','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486772/hot-air-balloon_l7xdvx.jpg','Hot Air Balloons are in my dreams','08/05/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('2','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486773/tree_zvsuvv.jpg','This tree is glorious','08/05/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('2','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486773/pier_ovwfhv.jpg','The pier pierces the sea','09/03/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('1','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486773/aeolian-islands_e80grd.jpg','The Aeoilan Island is the place to be','08/05/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('1','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486773/golden-gate-bridge_fdxn1t.jpg','An engineering marvel and a world-wonder','08/05/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('2','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486773/lake-tahoe_h6gpsg.jpg','This lake holds many dark secrets in its depths','08/05/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('2','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486774/wondering_hinonm.jpg','This dog is wondering why the world is the way it is','08/05/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('1','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486775/utopia_hqw3ei.jpg','The antithesis to a dystopia','08/01/2018');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('1','https://res.cloudinary.com/dkhepixjf/image/upload/v1596486776/xingjiang-china_a4e0sx.jpg','China has a long and storied history','08/05/2020');
INSERT INTO user_photos (user_id, photo_url, description, date_added) VALUES ('1','https://res.cloudinary.com/dkhepixjf/image/upload/v1596545087/TeGram-blue-logo_eyhp3k.png','TE-Gram Logo','08/05/2020');









COMMIT TRANSACTION;
