/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: user_group                                            */
/*==============================================================*/
create table user_group (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   user_id              bigint               not null,
   group_id             bigint               not null
);

comment on table user_group is
'user_group';

comment on column user_group.id is
'id';

comment on column user_group.createdate is
'createdate';

comment on column user_group.createby is
'createby';

comment on column user_group.updatedate is
'updatedate';

comment on column user_group.updateby is
'updateby';

comment on column user_group.user_id is
'user_id';

comment on column user_group.group_id is
'group_id';

alter table user_group
   add constraint pk_user_group primary key (id);

/*==============================================================*/
/* Index: i_user_group_user_id                                  */
/*==============================================================*/
create  index i_user_group_user_id on user_group (
user_id
);

/*==============================================================*/
/* Index: i_user_group_group_id                                 */
/*==============================================================*/
create  index i_user_group_group_id on user_group (
group_id
);

alter table user_group
   add constraint fk_user_group_grp foreign key (group_id)
      references grp (id)
      on delete cascade;

alter table user_group
   add constraint fk_user_group_to_usr foreign key (user_id)
      references usr (id)
      on delete cascade;

