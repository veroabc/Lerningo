CREATE TABLE esp_synonyms (id_esp_syn INTEGER AUTOINCREMENT, esp_syn_name VARCHAR(50), PRIMARY KEY (id_esp_syn));




CREATE TABLE spanish (id_esp INTEGER AUTOINCREMENT, esp_name VARCHAR(50), id_esp_syn INTEGER, PRIMARY KEY (id_esp), FOREIGN KEY (id_esp_syn) REFERENCES esp_synonyms(id_esp_syn));

INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (1,"Pizarra",1);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (2,"Mesa",2);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (3,"Silla",3);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (4,"Armario",4);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (5,"Pizarra",5);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (6,"Pizarra",6);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (7,"Pizarra",7);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (8,"Pizarra",8);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (9,"Pizarra",9);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (10,"Pizarra",10);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (11,"Pizarra",11);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (12,"Pizarra",12);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (13,"Pizarra",13);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (14,"Pizarra",14);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (15,"Pizarra",15);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (16,"Pizarra",16);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (17,"Pizarra",17);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (18,"Pizarra",18);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (19,"Pizarra",19);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (20,"Pizarra",20);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (21,"Pizarra",21);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (22,"Pizarra",22);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (23,"Pizarra",23);


CREATE TABLE engl_synonyms (id_engl_syn INTEGER AUTOINCREMENT, engl_syn_name VARCHAR(50), PRIMARY KEY (id_engl_syn));




CREATE TABLE english (id_engl INTEGER AUTOINCREMENT, engl_name VARCHAR(50), id_engl_syn INTEGER, PRIMARY KEY (id_engl), FOREIGN KEY (id_engl_syn) REFERENCES engl_synonyms(id_engl_syn));

INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (1,"Board",1);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (2,"Table",2);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (3,"Chair",3);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (4,"Wardrobe",4);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (5,"Board",5);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (6,"Board",6);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (7,"Board",7);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (8,"Board",8);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (9,"Board",9);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (10,"Board",10);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (11,"Board",11);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (12,"Board",12);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (13,"Board",13);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (14,"Board",14);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (15,"Board",15);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (16,"Board",16);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (17,"Board",17);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (18,"Board",18);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (19,"Board",19);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (20,"Board",20);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (21,"Board",21);



CREATE TABLE Main (id_main INTEGER AUTOINCREMENT, id_engl INTEGER, id_esp INTEGER, phrase VARCHAR (255), picture_path VARCHAR (255), soundfile_path VARCHAR (255), PRIMARY KEY (id_main), FOREIGN KEY (id_engl) REFERENCES english(id_engl));

INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (1,1,1,"The Teacher writes on the _____",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (2,2,2,"Anna puts the book on the _____",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (3,3,3,"Anna sits on the _____",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (4,4,"Armario","The clothes are in the wardrobe",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (5,"Computer","Ordenador",%,%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (6,"Laptop","Portátil",%,%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (7,"Garbage Can","Papelera",%,%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (8,"Paper Roll","Rollo de Papel",%,%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (9,"Backpack","Mochila",%,%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (
