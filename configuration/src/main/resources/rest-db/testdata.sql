INSERT INTO commessa (key, description, color, img) VALUES ('SMW', 'Smart Working', 'red', 'home.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('SED', 'Lavoro in sede', 'blue', 'ags-italia.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('CLI', 'Lavoro dal cliente', 'yellow', 'mobilize-fs.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('PAR', 'Permesso annuo retribuito', 'permesso', 'permesso.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('FER', 'Giornata di ferie', 'white', 'ferie.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('MAL', 'Malattia', 'black', 'malattia.jpeg');

INSERT INTO event (event_id, all_day, start_date, end_date, editable, user_id, commessa_key) VALUES (1, false, '2020-06-21T09:00:00+02:00', '2020-06-21T18:00:00+02:00', true, '54eb2f58-9503-4b29-8920-722d571026a4', 'SMW');