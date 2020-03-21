--PROGRESSION 0:
--You will have two files create-tables.sql and insert-queries.sql.
--Copy the content of create-tables.sql and execute it in sql developer to create tables in oracle.
--Copy the code from insert-queries.sql and execute it in sql developer to insert data into tables created.
--The insert-queries.sql contains two records for every table as a sample.
--Use it as a reference and add 10 more such records to every table.
--PROGRESSION 1:
----Joins --
--Write a query to return all the rows from user_new table and role tables where there is matching user_new.role_id value in both the usernew and role tables. Display role.name and user_new.name in ascending order.
SELECT role.name,user_new.name
FROM role
INNER JOIN user_new
ON role.id=user_new.id;


--Write a query to return all rows from the user_new table and only those rows from the role table where the joined fields are equal. Display role.name and user_new in ascending order.

SELECT * FROM role JOIN user_new
ON role.id=user_new.id;

--Write a query to return all names from the user_new table where there is matching user_new.role_id value in both the user_new and role tables.

SELECT user_new.name
FROM user_new
INNER JOIN role
ON role.id=user_new.id;

--Write a query to return all user_new.phonenumber, user_new.emailid, profile.batch, department.name, profile.designation, experience.company_name from user_new table where there is matching
SELECT user_new.phonenumber, user_new.emailid, profile.batch, department.name, profile.designation, experience.company_name
FROM user_new
INNER JOIN (
profile INNER JOIN user_new
ON user_new.id=profile.id)
INNER JOIN (
profile INNER JOIN degree
ON degree.id=profile.degree_id)
INNER JOIN (
degree INNER JOIN department
ON department_id=degree.id)
INNER JOIN (
profile INNER JOIN experience
ON experience.profile_id=profile.id)
WHERE user_new.name='abcd' AND experience.currentvalue=1;


SELECT user_new.phonenumber, user_new.emailid, profile.batch, department.name, profile.designation, experience.company_name
from user_new  ,profile ,department ,experience 

where user_new.id=profile.id and profile.degree_id =degree.id and  profile.id=experience.profile_id and user_new.name = 'abcd' and experience.currentValue=1

--profile id in both user_new and profile table,
--profile.degree_id and degree.id from profile and degree table,
--degree.department_id and department.id in degree and department
--profile.id and experience.profile_id in experience and profile table
--where user_name.name = "ProGrad" and experience.currentValue=3


--Write a query to return all user_new.name, skill.name from user_new table where there are matching ids in the tables in the order with constraints given below
SELECT user_new.name, skill.name
from user_new
JOIN skill,role,profile,profile_skills
WHERE user_new.id=role_id AND user_new.id=profile_id AND user_new.id=profile.skill_id AND role.name='Alumini'; 
 
 
--role
--profile
--profile_skills
--where role.name="Alumini"
--Display by user_new.name and skill.name

--Write a query to return all user_new.name, experience.company_name from user_new where there are matching ids in the tables
--role
--profile
--experience
--where role.name = "Alumini"
--Display in the order user_name.name followed by experience.company_name
--Write a query to return all user_new.name, experience.company_name from user_new where there are matching ids in the tables
--role
--profile
--experience
--where role.name = "Alumini"
--Display in the order user_name.name followed by experience.company_name
--Write a query to return all user_new.name, experience.company_name from user_new where there are matching ids in the tables
--role
--profile
--experience
--where role.name='Alumni' and experience.currentValue=1
--Display in the order of user_new.name;
--Write a query to return all user_new.name, experience.company_name from user_new where there are matching ids in the tables
--role
--profile
--experience
--where role.name='Alumni' and experience.currentValue=1 and profile.batch='2008'
--Display in the order of user_new.name;

--Write a query to return all user_new.name, user_new.emailid, user_new.phonenumber, profile.address from user_new where there are matching ids in the tables
--role
--profile
--where role.name='Alumni' and user_new.profile_id is not null
--Display in the order of user_new.name;
--Write a query to return all user_new.name, user_new.emailid, user_new.phonenumber, profile.address from user_new where there are matching ids in the tables
--role
--profile
--where role.name='Alumni' and profile.batch='2008'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, user_new.emailid, user_new.phonenumber, profile.address from user_new where there are matching ids in the tables
--role
--profile
--degree
--where role.name='Alumni' and degree.name='BSC_CT'
--Display in the order of user_new.name;
--Write a query to return alluser_new.name, user_new.emailid, user_new.phonenumber, profile.address from user_new where there are matching ids in the tables
--role
--profile
--degree
--department
--where role.name='Alumni' and department.name='CSE'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, higher_degree.university_name from user_new where there are matching ids in the tables
--role
--profile
--higher_degree
--department
--where role.name='Alumni' and higher_degree.degree_name is not null
--Display in the order of user_new.name,higher_degree.university_name
--Write a query to return all user_new.name, higher_degree.university_name from user_new where there are matching ids in the tables
--role
--profile
--higher_degree
--department
--where role.name='Alumni' and higher_degree.degree_name is not null
--Display in the order of user_new.name,higher_degree.university_name
--Write a query to return all user_new.name, user_new.emailid, user_new.phonenumber, profile.address from user_new where there are matching ids in the tables
--role
--profile
--degree
--department
--higher_degree
--where role.name='Alumni' and higher_degree.university_name='Texas University'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, profile.batch from user_new where there are matching ids in the tables
--role
--profile
--where role.name='Alumni' and profile.gender='female'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, profile.batch, degree.name from user_new where there are matching ids in the tables
--role
--profile
--degree
--where role.name='Alumni' and profile.gender='female'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, profile.batch, degree.name, department.name from user_new where there are matching ids in the tables
--role
--profile
--degree
--department
--where role.name='Alumni' and profile.gender='female'
--Display in the order of user_new.name;
--Write a query to return all degree.name, department.name from degree where there are matching ids in the tables
--department
--Display in the order of degree.name;
--Write a query to return all user_new.name, profile.designation from user_new where there are matching ids in the tables
--role
--profile
--where role.name='Alumni' and profile.gender='male'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, profile.designation from user_new where there are matching ids in the tables
--role
--profile
--experience
--where role.name='Alumni' and experience.currentValue=1 and experience.company_name='TCS'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, querytable.content from user_new where there are matching ids in the tables
--querytable
--Display in the order of user_new.name;
--Write a query to return all user_new.name, querytable.content from user_new where there are matching ids in the tables
--querytable
--where parent_id is not null
--Display in the order of user_new.name;
--Write a query to return all user_new.name, post.content from user_new where there are matching ids in the tables
--post
--Display in the order of user_new.name;
--Write a query to return all user_new.name, post.content from user_new where there are matching ids in the tables
--post
--where post_type.name='Technology'
--Display in the order of user_new.name,post.dateof;
--Write a query to return all user_new.name, post.content from user_new where there are matching ids in the tables
--post
--where post.dateof='2013'
--Display in the order of user_new.name, post.dateof, post.content;
--Write a query to return all user_new.name, department.name from user_new where there are matching ids in the tables
--role
--profile
--degree
--department
--profile_skills
--skill
--where skill.name='Programming'
--Display in the order of user_new.name;
--Write a query to return all user_new.name, event.name from user_new where there are matching ids in the tables
--event
--where role.name='Alumni'
--Display in the order of user_new.name,event.dateof
--Display event in descending order.
--Write a query to return all user_new.name, event.name from user_new where there are a matching ids in the tables
--event
--role
--where role.name='Alumni'
--Display in the order of user_new.name,event.dateof