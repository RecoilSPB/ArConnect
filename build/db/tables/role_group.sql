/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: role_group                                            */
/*==============================================================*/
create table role_group (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   group_id             bigint               not null,
   role_id              bigint               not null
);

comment on table role_group is
'role_group';

comment on column role_group.id is
'id';

comment on column role_group.createdate is
'createdate';

comment on column role_group.createby is
'createby';

comment on column role_group.updatedate is
'updatedate';

comment on column role_group.updateby is
'updateby';

comment on column role_group.group_id is
'group_id';

comment on column role_group.role_id is
'role_id';

alter table role_group
   add constraint pk_role_group primary key (id);

/*==============================================================*/
/* Index: i_role_group_role_id                                  */
/*==============================================================*/
create  index i_role_group_role_id on role_group (
role_id
);

/*==============================================================*/
/* Index: i_role_group_group_id                                 */
/*==============================================================*/
create  index i_role_group_group_id on role_group (
group_id
);

alter table role_group
   add constraint fk_role_group_grp foreign key (group_id)
      references grp (id)
      on delete cascade;

alter table role_group
   add constraint fk_role_group_role foreign key (role_id)
      references role (id)
      on delete cascade;

