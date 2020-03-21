create table role(Id NUMBER(20), name varchar2(255) NOT NULL,primary key(Id));
create table skillss(Id NUMBER(20)primary key, description varchar2(255) NULL, name varchar(255) NOT NULL);
create table post_type(Id NUMBER(20)primary key,name varchar2(255) NOT NULL);
create table department(Id NUMBER(20)primary key, name varchar2(255) NOT NULL);

create table degree
(
  Id NUMBER(20)primary key,
  department_id NUMBER(20) NOT NULL,
  name varchar2(255) NOT NULL,
  FOREIGN KEY(department_id) REFERENCES department(Id)
);

create table profile
(
  Id NUMBER(20)primary key,
  address varchar2(255) NOT NULL,
  batch varchar2(255) NOT NULL,
  degree_id NUMBER(20) NOT NULL,
  designation varchar2(255) NULL,
  gender varchar2(255) NOT NULL,
  FOREIGN KEY(degree_id) REFERENCES degree(Id)
);

create table higher_degree
(
  Id NUMBER(20)primary key,
  degree_name varchar2(255) NULL,
  university_name varchar2(255) NULL,
  profile_id NUMBER(20) NOT NULL,
  FOREIGN KEY(profile_id) REFERENCES profile(Id)
);

create table experience
(
  Id NUMBER(20)primary key,
  company_name varchar2(255) NOT NULL,
  currentvalue NUMBER(2) NOT NULL,
  enddate DATE NULL,
  startdate DATE NOT NULL,
  profile_id NUMBER(20) NOT NULL,
  FOREIGN KEY(profile_id) REFERENCES profile(Id)
);

Alter table experience 
RENAME COLUMN current TO currentvalue;

desc experience;
create table project
(
  Id NUMBER(20)primary key,
  name varchar(255) NOT NULL,
  number_of_members NUMBER(11) NOT NULL,
  profile_id NUMBER(20) NOT NULL,
  short_description varchar(255) NULL,
  FOREIGN KEY(profile_id) REFERENCES profile(Id)
);

create table profile_skills
(
  skill_id NUMBER(20),
  profile_id NUMBER(20),
  PRIMARY KEY(skill_id,profile_id)
);

create table user_new
(
  Id NUMBER(20) primary key,
  emailid varchar2(255) NOT NULL,
  name varchar2(255) NOT NULL,
  password varchar2(255) NOT NULL,
  phonenumber varchar2(255) NOT NULL,
  profile_id NUMBER(20) NULL,
  role_id NUMBER(20) NOT NULL,
  username varchar2(255) NOT NULL,
 FOREIGN KEY(profile_id) REFERENCES profile(Id),
FOREIGN KEY(role_id) REFERENCES role(Id)
);


desc user_new;

CREATE table querytable
(
  Id NUMBER(20) NOT NULL  Primary Key,
  content varchar2(255) NOT NULL,
  dateof DATE NOT NULL,
  parent_id NUMBER(20) NULL,
  user_id NUMBER(20)NOT NULL,
  FOREIGN KEY(parent_id) REFERENCES querytable(Id),
  FOREIGN KEY(user_id) REFERENCES user_new(Id)
);

desc querytable;
create table event
(
  Id NUMBER(20) primary key,
  dateof DATE NOT NULL,
  descriptionValue varchar2(255) NULL,
  invitation varchar2(255) NOT NULL,
  name varchar2(255) NOT NULL,
  organiser_id Number(20)NOT NULL,
  FOREIGN KEY(organiser_id) REFERENCES user_new(Id)
);

create table post
(
  Id NUMBER(20)primary key,
  content varchar2(255) NOT NULL,
  dateof DATE NOT NULL,
  type_id NUMBER(20) NOT NULL,
  user_id NUMBER(20)NOT NULL,
  FOREIGN KEY(type_id) REFERENCES post_type(Id),
  FOREIGN KEY(user_id) REFERENCES user_new(Id)
);
