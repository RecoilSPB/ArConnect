/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: task                                                  */
/*==============================================================*/
create table task (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 null,
   type                 varchar(50)          null,
   task_list_id         bigint               not null,
   command              text                 null,
   user_connection_id   bigint               not null
);

comment on table task is
'task';

comment on column task.id is
'id';

comment on column task.createdate is
'createdate';

comment on column task.createby is
'createby';

comment on column task.updatedate is
'updatedate';

comment on column task.updateby is
'updateby';

comment on column task.code is
'code';

comment on column task.text is
'text';

comment on column task.type is
'select/scripts/object';

comment on column task.task_list_id is
'task_list_id';

comment on column task.command is
'command';

comment on column task.user_connection_id is
'user_connection_id';

alter table task
   add constraint pk_task primary key (id);

/*==============================================================*/
/* Index: i_task_code                                           */
/*==============================================================*/
create unique index i_task_code on task (
code
);

/*==============================================================*/
/* Index: i_task_type                                           */
/*==============================================================*/
create  index i_task_type on task (
type
);

/*==============================================================*/
/* Index: i_task_tl_id                                          */
/*==============================================================*/
create  index i_task_tl_id on task (
task_list_id
);

/*==============================================================*/
/* Index: l_task_user_conn_id                                   */
/*==============================================================*/
create  index l_task_user_conn_id on task (
user_connection_id
);

alter table task
   add constraint fk_task_task_list foreign key (task_list_id)
      references task_list (id)
      on delete restrict on update restrict;

alter table task
   add constraint fk_task_user_connect foreign key (user_connection_id)
      references user_connection (id)
      on delete restrict on update restrict;

