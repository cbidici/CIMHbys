--INSERT USER ROLES--------------------------------------------
TRUNCATE hbys_role RESTART IDENTITY CASCADE;

INSERT INTO hbys_role(id, role,nameI18n) VALUES (1, 'ROLE_ADMIN','user.role.admin');
INSERT INTO hbys_role(id, role,nameI18n) VALUES (2, 'ROLE_DOCTOR','user.role.doctor');
INSERT INTO hbys_role(id, role,nameI18n) VALUES (3, 'ROLE_SECRETARY','user.role.secretary');

ALTER SEQUENCE seq_role_id RESTART WITH 4;


TRUNCATE hbys_user RESTART IDENTITY CASCADE;

---INSERT ADMIN
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (1, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (2, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin1');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (3, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin2');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (4, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin3');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (5, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin4');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (6, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin5');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (7, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin6');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (8, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin7');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (9, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin8');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (10, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin9');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (11, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin10');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (12, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin11');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (13, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin12');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (14, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin13');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (15, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin14');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (16, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin15');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (17, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin16');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (18, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin17');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (19, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin18');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (20, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin19');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (21, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin21');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (22, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin22');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (23, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin23');
INSERT INTO hbys_user(id, address, email, enabled, firstname, lastname, password, phone,username)VALUES (24, 'adress','admin@email',true, 'admin', 'admin','$2a$10$haNKrwGKczxkmc2evr.yde.GY.B5oeF/dso.WVkIQSCJMK9k00xku', '', 'admin24');


ALTER SEQUENCE seq_user_id RESTART WITH 25;
---INSERT ADMIN ROLE 
TRUNCATE hbys_user_hbys_role RESTART IDENTITY CASCADE;
INSERT INTO hbys_user_hbys_role(users_id, roles_id) VALUES (1, 1);

COMMIT;