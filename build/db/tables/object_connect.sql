/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: object_connect                                        */
/*==============================================================*/
create table object_connect (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null,
   agent_id             bigint               not null,
   user_connection_id   bigint               not null,
   pass                 varchar(100)         null,
   url                  varchar(100)         null,
   task_object_id       bigint               not null
);

comment on table object_connect is
'object_connect';

comment on column object_connect.id is
'id';

comment on column object_connect.createdate is
'createdate';

comment on column object_connect.createby is
'createby';

comment on column object_connect.updatedate is
'updatedate';

comment on column object_connect.updateby is
'updateby';

comment on column object_connect.code is
'code';

comment on column object_connect.text is
'text';

comment on column object_connect.agent_id is
'agent_id';

comment on column object_connect.user_connection_id is
'user_connection_id';

comment on column object_connect.pass is
'pass';

comment on column object_connect.url is
'url';

comment on column object_connect.connect_type is
'Тип поединения: ORA, PG, HTTP';

comment on column object_connect.task_object_id is
'task_object_id';

alter table object_connect
   add constraint pk_object_connect primary key (id);

/*==============================================================*/
/* Index: i_obj_conn_code                                       */
/*==============================================================*/
create unique index i_obj_conn_code on object_connect (
code
);

/*==============================================================*/
/* Index: i_obj_conn_agent_id                                   */
/*==============================================================*/
create  index i_obj_conn_agent_id on object_connect (
agent_id
);

/*==============================================================*/
/* Index: i_obj_conn_user_conn_id                               */
/*==============================================================*/
create  index i_obj_conn_user_conn_id on object_connect (
user_connection_id
);

/*==============================================================*/
/* Index: i_obj_conn_connect_type                               */
/*==============================================================*/
create  index i_obj_conn_connect_type on object_connect (
connect_type
);

/*==============================================================*/
/* Index: i_obj_conn_task_obj_id                                */
/*==============================================================*/
create  index i_obj_conn_task_obj_id on object_connect (
task_object_id
);

alter table object_connect
   add constraint fk_obj_connect_agent foreign key (agent_id)
      references agent (id)
      on delete restrict on update restrict;

alter table object_connect
   add constraint fk_obj_connect_task_obj foreign key (task_object_id)
      references task_object (id)
      on delete restrict on update restrict;

alter table object_connect
   add constraint fk_obj_connect_user_conn foreign key (user_connection_id)
      references user_connection (id)
      on delete restrict on update restrict;

