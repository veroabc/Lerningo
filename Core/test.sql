CREATE TABLE esp_synonyms (id_esp_syn INTEGER AUTOINCREMENT, esp_syn_name VARCHAR(50), PRIMARY KEY (id_esp_syn));

INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (1,"Escritorio");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (2,"Asiento");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (3,"Computadora");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (4,"Basura");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (5,"Cartera");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (6,"Marcador");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (7,"Cristalera");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (8,"Calefactor");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (9,"Pasamanos");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (10,"Servicio");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (11,"Cañón");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (12,"Elevador");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (13,"Libreta");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (14,"Asiento");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (15,"Escuela");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (16,"Aula");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (17,"Sala");
INSERT INTO esp_synonyms (id_esp_syn,esp_syn_name) VALUES (18,"Aseo");

CREATE TABLE connect_syn_esp (id_esp INTEGER NOT NULL, id_esp_syn INTEGER NOT NULL, FOREIGN KEY (id_esp) REFERENCES spanish(id_esp), FOREIGN KEY (id_eps_syn) REFERENCES esp_synonyms(id_esp_syn));

INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (2,1);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (3,2);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (5,3);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (7,4);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (9,5);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (10,6);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (12,7);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (13,8);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (20,9);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (21,10);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (21,18);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (24,11);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (26,12);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (28,13);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (29,14);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (30,15);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (33,16);
INSERT INTO connect_syn_esp (id_esp, id_esp_syn) VALUES (33,17);


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
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (4,"Cupboard",4);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (5,"Computer",5);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (6,"Laptop",6);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (7,"Garbage Can",7);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (8,"Paper Roll",8);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (9,"Backpack",9);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (10,"Marker",10);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (11,"Eraser",11);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (12,"Window",12);
INSERT INTO english (id_engl,engl_name,id_engl_syn) VALUES (13,"Heator",13);
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

INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (1,1,1,"The Teacher writes on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (2,2,2,"Rosi puts the book on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (3,3,3,"Max sits on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (4,4,4,"The pencils are on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (5,5,5,"The %s is on.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (6,6,6,"The %s is in your bag.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (7,7,7,"Put the paper in the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (8,8,8,"There are some %s in the bathroom.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (9,9,9,"I have a sandwich in my %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (10,10,10,"Use the %s to write on the board.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (11,11,11,"Tim uses the %s to clean the board.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (12,12,12,"It is warm, please open the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (13,13,13,"It is warm inside because the %s is on.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (14,14,14,"the %s is soft.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (15,15,15,"The %s of the pc is broken.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (16,16,16,"The cable is plugged to the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (17,17,17,"The %s of the is closed.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (18,18,18,"The firefighters use the %s to put out the fire.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (19,19,19,"Luca is waiting for you on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (20,20,20,"The blind guy uses the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (21,21,21,"Can I go to the %s please?",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (22,22,22,"My hoodie is on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (23,23,23,"The Teacher uses the %s."%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (24,24,24,"We watch a film with the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (25,25,25,"The %s is turned on.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (26,26,26,"The %s goes up.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (27,27,27,"Alejandro is reading the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (28,28,28,"Veronika writes on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (29,29,29,"Daniel sits on the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (30,30,30,"The pupil goes to %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (31,31,31,"Alberto drinks from the %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (32,32,32,"The Computer has a %s.",%,%);
INSERT INTO Main (id_main, id_engl, id_esp, phrase, picture_path, soundfile_path) VALUES (33,33,33,"The door of the %s is open.",%,%);
