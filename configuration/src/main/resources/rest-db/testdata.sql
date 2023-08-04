INSERT INTO commessa (key, description, color, img) VALUES ('SMW', 'Smart Working', 'red', 'home.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('SED', 'Lavoro in sede', 'blue', 'ags-italia.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('CLI', 'Lavoro dal cliente', 'yellow', 'mobilize-fs.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('PAR', 'Permesso annuo retribuito', 'green', 'permesso.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('FER', 'Giornata di ferie', 'white', 'ferie.jpeg');
INSERT INTO commessa (key, description, color, img) VALUES ('MAL', 'Malattia', 'black', 'malattia.jpeg');

INSERT INTO event (event_id, all_day, start_date, end_date, editable, user_id, commessa_key) VALUES (1, false, '2020-06-21T09:00:00+02:00', '2020-06-21T18:00:00+02:00', true, '54eb2f58-9503-4b29-8920-722d571026a4', 'SMW');

-- Event used for testing event deletion
INSERT INTO event (event_id, all_day, start_date, end_date, editable, user_id, commessa_key) VALUES (2, false, '2020-06-21T09:00:00+02:00', '2020-06-21T18:00:00+02:00', true, '54eb2f58-9503-4b29-8920-722d571026a4', 'SMW');

-- Event used for testing event update
INSERT INTO event (event_id, all_day, start_date, end_date, editable, user_id, commessa_key) VALUES (3, false, '2023-06-21T09:00:00+02:00', '2023-06-21T18:00:00+02:00', true, '54eb2f58-9503-4b29-8920-722d571026a4', 'SMW');

-- Profile used for testing conflict profile when searched
INSERT INTO profile(profile_id, user_id, name, surname, email, fiscal_code, address, city, postal_code, birth_date, age, gender) VALUES (1, '54eb2f58-9503-4b29-8920-722d571026a4', 'Test', 'User', 'test.user@monthly.com', 'TSTUSR03E10H501L', 'Via dei prati fiscali 1', 'Rome', '00166', '10/05/2003', 23, 'M');

-- Profile used for patch /profiles
INSERT INTO profile(profile_id, user_id, name, surname, email, fiscal_code, address, city, postal_code, birth_date, age, gender) VALUES (2, '7cb96f8e-4573-4529-a75a-4362c268f75e', 'Test', 'User', 'test.user.update@monthly.com', 'TSTUSR03E10H501L', 'Via dei prati fiscali 1', 'Rome', '00166', '10/05/2003', 23, 'M');

