/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: organization_group                                    */
/*==============================================================*/
create table organization_group (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   organization_id      bigint               not null,
   group_id             bigint               not null
);

comment on table organization_group is
'organization_group';

comment on column organization_group.id is
'id';

comment on column organization_group.createdate is
'createdate';

comment on column organization_group.createby is
'createby';

comment on column organization_group.updatedate is
'updatedate';

comment on column organization_group.updateby is
'updateby';

comment on column organization_group.organization_id is
'organization_id';

comment on column organization_group.group_id is
'group_id';

alter table organization_group
   add constraint pk_organization_group primary key (id);

/*==============================================================*/
/* Index: i_org_group_org_id                                    */
/*==============================================================*/
create  index i_org_group_org_id on organization_group (
organization_id
);

/*==============================================================*/
/* Index: i_org_group_group_id                                  */
/*==============================================================*/
create  index i_org_group_group_id on organization_group (
group_id
);

alter table organization_group
   add constraint fk_org_group_grp foreign key (group_id)
      references grp (id)
      on delete cascade;

alter table organization_group
   add constraint fk_org_group_org foreign key (organization_id)
      references organization (id)
      on delete restrict on update restrict;

