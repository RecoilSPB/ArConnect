insert into usr(id, code, text, pass, login, status)
values (nextval('s_usr'), gen_random_uuid(), 'Администратор',
        '$2a$10$32QScbwD/4HuJ75Zhtkw3eqiWW3dVu18m8vQKCe3Zezy3Z3dlvo/C', 'admin', 0);
insert into usr(id, code, text, pass, login, status)
values (nextval('s_usr'), gen_random_uuid(), 'Таст',
        '$2a$10$BcTRMI3YZUzMZaXK5lxCYe/XTgvaaUE3wFzcHDchwEJdkiUq4ZLRG', 'test', 0);


insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_FORM');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_MED');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_EMD');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_EPIC');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_PACS');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'NLAB');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_DIAGNOSTIC');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_ER');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_REG');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_VAC');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_AGRDEP');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_APTEKA');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_DATA');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_DIET');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_REAGENT');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_SOI');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_REQ');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_AKINEO');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_STORAGE');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_REQMAIN');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_OPK');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_DBF');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_LAB');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_LOG');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_STORAGE_BUILD');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_REQLOG');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_EIS');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_OMS');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_SPRAV');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SYS');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_EPID');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_KLADR');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_RIGHTS');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_ROOT');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'SOLUTION_TMP');
insert into user_connection (id, code, text) values (nextval('s_user_connection'), gen_random_uuid(), 'DLI');
