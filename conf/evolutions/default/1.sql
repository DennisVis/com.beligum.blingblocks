# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table cms_block (
  type                      varchar(31) not null,
  id                        bigint auto_increment not null,
  created_at                datetime,
  updated_at                datetime,
  created_by                bigint,
  updated_by                bigint,
  url_name                  varchar(255),
  parent_path               varchar(255),
  template_id               bigint,
  html                      TEXT,
  visible                   tinyint(1) default 0,
  master_page               bigint,
  language                  varchar(255),
  title                     varchar(255),
  constraint pk_cms_block primary key (id))
;

create table template (
  id                        bigint auto_increment not null,
  created_at                datetime,
  updated_at                datetime,
  created_by                bigint,
  updated_by                bigint,
  name                      varchar(255),
  template                  varchar(255),
  constraint pk_template primary key (id))
;

create table users (
  id                        bigint auto_increment not null,
  created_at                datetime,
  updated_at                datetime,
  created_by                bigint,
  updated_by                bigint,
  login                     varchar(255),
  password                  varchar(255),
  firstname                 varchar(255),
  lastname                  varchar(255),
  email                     varchar(255),
  role_level                integer,
  constraint pk_users primary key (id))
;

alter table cms_block add constraint fk_cms_block_createdBy_1 foreign key (created_by) references users (id) on delete restrict on update restrict;
create index ix_cms_block_createdBy_1 on cms_block (created_by);
alter table cms_block add constraint fk_cms_block_updatedBy_2 foreign key (updated_by) references users (id) on delete restrict on update restrict;
create index ix_cms_block_updatedBy_2 on cms_block (updated_by);
alter table cms_block add constraint fk_cms_block_template_3 foreign key (template_id) references template (id) on delete restrict on update restrict;
create index ix_cms_block_template_3 on cms_block (template_id);
alter table template add constraint fk_template_createdBy_4 foreign key (created_by) references users (id) on delete restrict on update restrict;
create index ix_template_createdBy_4 on template (created_by);
alter table template add constraint fk_template_updatedBy_5 foreign key (updated_by) references users (id) on delete restrict on update restrict;
create index ix_template_updatedBy_5 on template (updated_by);
alter table users add constraint fk_users_createdBy_6 foreign key (created_by) references users (id) on delete restrict on update restrict;
create index ix_users_createdBy_6 on users (created_by);
alter table users add constraint fk_users_updatedBy_7 foreign key (updated_by) references users (id) on delete restrict on update restrict;
create index ix_users_updatedBy_7 on users (updated_by);



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table cms_block;

drop table template;

drop table users;

SET FOREIGN_KEY_CHECKS=1;

