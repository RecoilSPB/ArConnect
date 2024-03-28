/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: user_organization                                     */
/*==============================================================*/
create table user_organization (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   user_id              bigint               not null,
   organization_id      bigint               not null
);

comment on table user_organization is
'user_organization';

comment on column user_organization.id is
'id';

comment on column user_organization.createdate is
'createdate';

comment on column user_organization.createby is
'createby';

comment on column user_organization.updatedate is
'updatedate';

comment on column user_organization.updateby is
'updateby';

comment on column user_organization.user_id is
'user_id';

comment on column user_organization.organization_id is
'organization_id';

alter table user_organization
   add constraint pk_user_organization primary key (id);

/*==============================================================*/
/* Index: i_user_org_organization_id                            */
/*==============================================================*/
create  index i_user_org_organization_id on user_organization (
organization_id
);

/*==============================================================*/
/* Index: i_user_org_user_id                                    */
/*==============================================================*/
create  index i_user_org_user_id on user_organization (
user_id
);

alter table user_organization
   add constraint fk_user_org_org foreign key (organization_id)
      references organization (id)
      on delete restrict on update restrict;

alter table user_organization
   add constraint fk_user_org_usr foreign key (user_id)
      references usr (id)
      on delete cascade;

