# sql-challenge
This challenge will display data modeling, data engineering, and data analysis of a fictional company, Pewlett Hackard.

Pewlett Hackard's employee and department files are to be examined to aid their hiring process. 


## Data Modeling 
QuickDBD has been used to sketch an Entity Relationship Diagram for Pewlett Hackard.

![Data Modeling ](https://user-images.githubusercontent.com/121995835/228045206-e0fa6b98-1c31-425c-9127-f1cf99c88e9b.png)


## Data Engineering 
Tables have been created for each of the 6 CSV files from Pewlett Hackard in this Table Schema. (Also located in the EmployeeSQL folder.) 


Titles  

	CREATE TABLE TITLES(
	Title_ID VARCHAR(20) NOT NULL,
	Title VARCHAR(30) NOT NULL,
	PRIMARY KEY (Title_ID)
	);
	SELECT * FROM TITLES

Employees 

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

Departments 

	CREATE TABLE DEPARTMENTS(
	Dept_no VARCHAR(15) NOT NULL,
	Dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (Dept_no)
	);

	SELECT * FROM DEPARTMENTS

Department Managers

	CREATE TABLE DEPT_MANAGER(
	Dept_no VARCHAR(15) NOT NULL,
	Emp_no INT NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES EMPLOYEES(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES DEPARTMENTS(Dept_no),
	PRIMARY KEY (Dept_no, Emp_no)
	);

	SELECT * FROM DEPT_MANAGER

Department Employees

	CREATE TABLE DEPT_EMP(
	Emp_no INT NOT NULL,
	Dept_no VARCHAR(15) NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES EMPLOYEES(Emp_no),
	FOREIGN KEY (Dept_no) REFERENCES DEPARTMENTS(Dept_no),
	PRIMARY KEY (Emp_no, Dept_no)
	);

	SELECT * FROM DEPT_EMP

Salaries 

	CREATE TABLE SALARIES(
	Emp_no INT NOT NULL PRIMARY KEY,
	Salary INT NOT NULL,
	FOREIGN KEY (Emp_no) REFERENCES EMPLOYEES(Emp_no)
	);

	SELECT * FROM SALARIES
	

## Data Analysis
List the employee number, last name, first name, sex, and salary of each employee.

	SELECT EMPLOYEES.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, EMPLOYEES.Sex, SALARIES.Salary 
	FROM EMPLOYEES
	LEFT JOIN SALARIES 
	ON EMPLOYEES.Emp_no = SALARIES.Emp_no;
	
List the first name, last name, and hire date for the employees who were hired in 1986.

	SELECT First_name, Last_name, Hire_date
	FROM EMPLOYEES
	WHERE Hire_date LIKE '%1986%'
	ORDER BY Hire_date;

List the manager of each department along with their department number, department name, employee number, last name, and first name.

	SELECT DEPT_MANAGER.Dept_no, DEPT_MANAGER.Emp_no, DEPARTMENTS.Dept_name, EMPLOYEES.Last_name, EMPLOYEES.First_name
	FROM DEPT_MANAGER
	JOIN DEPARTMENTS
	ON DEPT_MANAGER.Dept_no = DEPARTMENTS.Dept_no
	JOIN  EMPLOYEES
	ON DEPT_MANAGER.Emp_no = EMPLOYEES.Emp_no
	ORDER BY Dept_no ASC;

List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

	SELECT DEPT_EMP.Dept_no, DEPT_EMP.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, DEPARTMENTS.Dept_name
	FROM DEPT_EMP
	JOIN EMPLOYEES
	ON DEPT_EMP.Emp_no = EMPLOYEES.Emp_no
	JOIN DEPARTMENTS
	ON DEPT_EMP.Dept_no = DEPARTMENTS.Dept_no
	ORDER BY Dept_no ASC;

List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

	SELECT First_name, Last_name, Sex
	FROM EMPLOYEES
	WHERE First_name LIKE '%Hercules%' AND Last_name LIKE 'B%'
	ORDER BY First_name;

List each employee in the Sales department, including their employee number, last name, and first name.

	SELECT DEPT_EMP.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, DEPARTMENTS.Dept_name
	FROM EMPLOYEES
	JOIN DEPT_EMP
	ON EMPLOYEES.EMP_no = DEPT_EMP.Emp_no 
	JOIN DEPARTMENTS
	ON DEPT_EMP.Dept_no = DEPARTMENTS.Dept_no
	WHERE Dept_name LIKE '%Sales%'
	ORDER BY Emp_no ASC;

List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

	SELECT DEPT_EMP.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, DEPARTMENTS.Dept_name
	FROM EMPLOYEES
	JOIN DEPT_EMP
	ON EMPLOYEES.EMP_no = DEPT_EMP.Emp_no 
	JOIN DEPARTMENTS
	ON DEPT_EMP.Dept_no = DEPARTMENTS.Dept_no
	WHERE Dept_name LIKE '%Sales%' OR Dept_name LIKE '%Development%'
	ORDER BY Emp_no ASC;

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

	SELECT Last_name, COUNT(Last_name) 
	FROM EMPLOYEES
	GROUP BY Last_name
	ORDER BY COUNT(Last_name) Desc;
