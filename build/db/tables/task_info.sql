/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: task_info                                             */
/*==============================================================*/
create table task_info (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 null,
   type                 varchar(50)          null,
   task_list_info_id    bigint               not null,
   command              text                 null,
   user_connection_id   bigint               not null,
   task_id              bigint               not null
);

comment on table task_info is
'task_info';

comment on column task_info.id is
'id';

comment on column task_info.createdate is
'createdate';

comment on column task_info.createby is
'createby';

comment on column task_info.updatedate is
'updatedate';

comment on column task_info.updateby is
'updateby';

comment on column task_info.code is
'code';

comment on column task_info.text is
'text';

comment on column task_info.type is
'select/scripts/object';

comment on column task_info.task_list_info_id is
'task_list_info_id';

comment on column task_info.command is
'command';

comment on column task_info.user_connection_id is
'user_connection_id';

comment on column task_info.task_id is
'task_id';

alter table task_info
   add constraint pk_task_info primary key (id);

/*==============================================================*/
/* Index: i_task_info_code                                      */
/*==============================================================*/
create unique index i_task_info_code on task_info (
code
);

/*==============================================================*/
/* Index: i_task_info_type                                      */
/*==============================================================*/
create  index i_task_info_type on task_info (
type
);

/*==============================================================*/
/* Index: i_task_info_tl_info_id                                */
/*==============================================================*/
create  index i_task_info_tl_info_id on task_info (
task_list_info_id
);

/*==============================================================*/
/* Index: i_task_info_task_id                                   */
/*==============================================================*/
create  index i_task_info_task_id on task_info (
task_id
);

/*==============================================================*/
/* Index: i_task_info_user_conn                                 */
/*==============================================================*/
create  index i_task_info_user_conn on task_info (
user_connection_id
);

alter table task_info
   add constraint fk_task_info_task foreign key (task_id)
      references task (id)
      on delete restrict on update restrict;

alter table task_info
   add constraint fk_task_info_task_list_info foreign key (task_list_info_id)
      references task_list_info (id)
      on delete restrict on update restrict;

alter table task_info
   add constraint fk_task_inf_fk_task_i_user_con foreign key (user_connection_id)
      references user_connection (id)
      on delete restrict on update restrict;

