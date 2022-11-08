CREATE TABLE esp_synonyms (id_esp_syn INTEGER AUTOINCREMENT, esp_syn_name VARCHAR(50), PRIMARY KEY (id_esp_syn));




CREATE TABLE spanish (id_esp INTEGER AUTOINCREMENT, esp_name VARCHAR(50), id_esp_syn INTEGER, PRIMARY KEY (id_esp), FOREIGN KEY (id_esp_syn) REFERENCES esp_synonyms(id_esp_syn));

INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (1,"Pizarra",1);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (2,"Mesa",2);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (3,"Silla",3);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (4,"Armario",4);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (5,"Ordenador",5);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (6,"Portátil",6);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (7,"Papelera",7);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (8,"Rollo de Papel",8);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (9,"Mochila",9);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (10,"Rotulador",10);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (11,"Borrador",11);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (12,"Ventana",12);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (13,"Radiador",13);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (14,"Sofá",14);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (15,"Pantalla",15);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (16,"Enchufe",16);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (17,"Puerta",17);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (18,"Extintor",18);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (19,"Escalera",19);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (20,"Barandilla",20);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (21,"Baño",21);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (22,"Perchero",22);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (23,"Impresora",23);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (24,"Proyector",24);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (25,"Lámpara",25);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (26,"Ascensor",26);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (27,"Libro",27);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (28,"Cuaderno",28);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (29,"Banco",29);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (30,"Instituto",30);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (31,"Fuente",31);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (32,"Monitor",32);
INSERT INTO spanish (id_esp,esp_name,id_esp_syn) VALUES (33,"Clase",33);


CREATE TABLE engl_synonyms (id_engl_syn INTEGER AUTOINCREMENT, engl_syn_name VARCHAR(50), PRIMARY KEY (id_engl_syn));




CREATE TABLE english (id_engl INTEGER AUTOINCREMENT, engl_name VARCHAR(50), id_engl_syn INTEGER, PRIMARY KEY (id_engl), FOREIGN KEY (id_engl_syn) REFERENCES engl_synonyms(id_engl_syn));

INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (1,"Board",1);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (2,"Table",2);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (3,"Chair",3);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (4,"Wardrobe",4);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (5,"Computer",5);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (6,"Laptop",6);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (7,"Garbage Can",7);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (8,"Paper Roll",8);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (9,"Backpack",9);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (10,"Marker",10);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (11,"Eraser",11);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (12,"Window",12);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (13,"Radiator",13);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (14,"Sofa",14);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (15,"Screen",15);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (16,"Socket",16);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (17,"Door",17);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (18,"Fire extinguisher",18);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (19,"Stairs",19);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (20,"Handrail",20);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (21,"Bathroom",21);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (22,"Coat Stand",22);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (23,"Printer",23);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (24,"Projector",24);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (25,"Lamp",25);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (26,"Elevator",26);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (27,"Book",27);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (28,"Notebook",28);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (29,"Bench",29);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (30,"School",30);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (31,"Fountain",31);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (32,"Monitor",32);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (33,"Class",33);




CREATE TABLE Main (id_main INTEGER AUTOINCREMENT, id_engl INTEGER, id_esp INTEGER, phrase VARCHAR (255), picture_path VARCHAR (255), soundfile_path VARCHAR (255), PRIMARY KEY (id_main), FOREIGN KEY (id_engl) REFERENCES english(id_engl));

INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (1,1,1,"The Teacher writes on the %s",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (2,2,2,"Anna puts the book on the %s",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (3,3,3,"Anna sits on the %s",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (4,4,4,"The clothes are in the %s",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (5,5,5,"The %s is on",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (6,6,6,"The %s is in your bag",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (7,7,7,"Put the paper in the %s",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (8,8,8,"There are some %s in the bathroom",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (9,9,9,"I have an apple in my %s",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (10,10,10,"Use the %s to ",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (11,11,11,%s,%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (12,12,12,%s,%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (13,13,13,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (14,14,14,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (15,15,15,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (16,16,16,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (17,17,17,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (18,18,18,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (19,19,19,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (20,20,20,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (21,21,21,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (22,22,22,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (23,23,23,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (24,24,24,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (25,25,25,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (26,26,26,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (27,27,27,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (28,28,28,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (29,29,29,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (30,30,30,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (31,31,31,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (32,32,32,
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (33,33,33,
