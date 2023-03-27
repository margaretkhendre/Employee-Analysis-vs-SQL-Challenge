# Module 9- sql-challenge
This challenge will display data modeling, data engineering, and data analysis of a fictional company, Pewlett Hackard.

Pewlett Hackard's employee and department files are to be examined to aid their hiring process. 

## Data Modeling 
QuickDBD is used to sketch an Entity Relationship Diagram for Pewlwtt Hackard.
![Data Modeling ](https://user-images.githubusercontent.com/121995835/228045206-e0fa6b98-1c31-425c-9127-f1cf99c88e9b.png)

## Data Engineering 
Tables have been createed for each of the 6 CSV files from Pewlett Hackard in this Table Schema. (Also located in the EmployeeSQL folder.)

Create tables for each of the 6 CSV files 

	CREATE TABLE TITLES(
	Title_ID VARCHAR(20) NOT NULL,
	Title VARCHAR(30) NOT NULL,
	PRIMARY KEY (Title_ID)
	);
	SELECT * FROM TITLES


	CREATE TABLE EMPLOYEES(
	Emp_no INT NOT NULL PRIMARY KEY,
	Emp_title_ID VARCHAR(30) NOT NULL,
	Birth_date VARCHAR(20) NOT NULL,
	First_name VARCHAR(20) NOT NULL,
	Last_name VARCHAR(20) NOT NULL,
	Sex VARCHAR(10) NOT NULL, 
	Hire_date DATE NOT NULL,
	FOREIGN KEY (Emp_title_ID) REFERENCES TITLES(Title_ID)
	);

	SELECT * FROM EMPLOYEES


	CREATE TABLE DEPARTMENTS(
	Dept_no VARCHAR(15) NOT NULL,
	Dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (Dept_no)
	);

	SELECT * FROM DEPARTMENTS


	CREATE TABLE DEPT_MANAGER(
	Dept_no VARCHAR(15) NOT NULL,
	Emp_no INT NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES EMPLOYEES(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES DEPARTMENTS(Dept_no),
	PRIMARY KEY (Dept_no, Emp_no)
	);

	SELECT * FROM DEPT_MANAGER

	CREATE TABLE DEPT_EMP(
	Emp_no INT NOT NULL,
	Dept_no VARCHAR(15) NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES EMPLOYEES(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES DEPARTMENTS(Dept_no),
	PRIMARY KEY (Emp_no, Dept_no)
	);

	SELECT * FROM DEPT_EMP

	CREATE TABLE SALARIES(
	Emp_no INT NOT NULL PRIMARY KEY,
	Salary INT NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES EMPLOYEES(Emp_no)
	);

	SELECT * FROM SALARIES

