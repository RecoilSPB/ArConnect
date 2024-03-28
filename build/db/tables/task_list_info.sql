/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: task_list_info                                        */
/*==============================================================*/
create table task_list_info (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 null,
   task_list_id         bigint               not null,
   task_object_id       bigint               not null,
   agent_id             bigint               null,
   send_date            timestamp            null,
   result_date          timestamp            null,
   status               smallint             null
);

comment on table task_list_info is
'Запись в данно_ таблице формируется при указании в како_ организации необходимо выполнить пакет задани_.';

comment on column task_list_info.id is
'id';

comment on column task_list_info.createdate is
'createdate';

comment on column task_list_info.createby is
'createby';

comment on column task_list_info.updatedate is
'updatedate';

comment on column task_list_info.updateby is
'updateby';

comment on column task_list_info.code is
'code';

comment on column task_list_info.task_list_id is
'task_list_id';

comment on column task_list_info.task_object_id is
'task_object_id';

comment on column task_list_info.agent_id is
'agent_id';

comment on column task_list_info.send_date is
'send_date';

comment on column task_list_info.result_date is
'result_date';

comment on column task_list_info.status is
'0 - ожидание отправки/поиск агента, 1 - передано агенту/в работе, 2 - выполнено успешно, 3 - ошибка выполнения';

alter table task_list_info
   add constraint pk_task_list_info primary key (id);

/*==============================================================*/
/* Index: i_tl_info_tl_id                                       */
/*==============================================================*/
create  index i_tl_info_tl_id on task_list_info (
task_list_id
);

/*==============================================================*/
/* Index: i_tl_info_to_id                                       */
/*==============================================================*/
create  index i_tl_info_to_id on task_list_info (
task_object_id
);

/*==============================================================*/
/* Index: i_tl_info_agent_id                                    */
/*==============================================================*/
create  index i_tl_info_agent_id on task_list_info (
agent_id
);

/*==============================================================*/
/* Index: i_tl_info_sd                                          */
/*==============================================================*/
create  index i_tl_info_sd on task_list_info (
send_date
);

/*==============================================================*/
/* Index: i_tl_info_rd                                          */
/*==============================================================*/
create  index i_tl_info_rd on task_list_info (
result_date
);

/*==============================================================*/
/* Index: i_tl_info_status                                      */
/*==============================================================*/
create  index i_tl_info_status on task_list_info (
status
);

alter table task_list_info
   add constraint fk_task_list_info_agent foreign key (agent_id)
      references agent (id)
      on delete restrict on update restrict;

alter table task_list_info
   add constraint fk_task_list_info_task_list foreign key (task_list_id)
      references task_list (id)
      on delete restrict on update restrict;

alter table task_list_info
   add constraint fk_task_list_info_task_obj foreign key (task_object_id)
      references task_object (id)
      on delete restrict on update restrict;

