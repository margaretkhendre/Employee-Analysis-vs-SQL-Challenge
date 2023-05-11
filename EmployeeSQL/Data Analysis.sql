-- List the employee numbers, last name, first name, sex, and salary of each employee.
SELECT EMPLOYEES.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, EMPLOYEES.Sex, SALARIES.Salary 
FROM EMPLOYEES
LEFT JOIN SALARIES 
ON EMPLOYEES.Emp_no = SALARIES.Emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT First_name, Last_name, Hire_date
FROM EMPLOYEES
WHERE Hire_date LIKE '%1986%'
ORDER BY Hire_date;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT DEPT_MANAGER.Dept_no, DEPT_MANAGER.Emp_no, DEPARTMENTS.Dept_name, EMPLOYEES.Last_name, EMPLOYEES.First_name
FROM DEPT_MANAGER
JOIN DEPARTMENTS
ON DEPT_MANAGER.Dept_no = DEPARTMENTS.Dept_no
JOIN  EMPLOYEES
ON DEPT_MANAGER.Emp_no = EMPLOYEES.Emp_no
ORDER BY Dept_no ASC;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT DEPT_EMP.Dept_no, DEPT_EMP.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, DEPARTMENTS.Dept_name
FROM DEPT_EMP
JOIN EMPLOYEES
ON DEPT_EMP.Emp_no = EMPLOYEES.Emp_no
JOIN DEPARTMENTS
ON DEPT_EMP.Dept_no = DEPARTMENTS.Dept_no
ORDER BY Dept_no ASC;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT First_name, Last_name, Sex
FROM EMPLOYEES
WHERE First_name LIKE '%Hercules%' AND Last_name LIKE 'B%'
ORDER BY First_name;


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT DEPT_EMP.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, DEPARTMENTS.Dept_name
FROM EMPLOYEES
JOIN DEPT_EMP
ON EMPLOYEES.EMP_no = DEPT_EMP.Emp_no 
JOIN DEPARTMENTS
ON DEPT_EMP.Dept_no = DEPARTMENTS.Dept_no
WHERE Dept_name LIKE '%Sales%'
ORDER BY Emp_no ASC;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT DEPT_EMP.Emp_no, EMPLOYEES.Last_name, EMPLOYEES.First_name, DEPARTMENTS.Dept_name
FROM EMPLOYEES
JOIN DEPT_EMP
ON EMPLOYEES.EMP_no = DEPT_EMP.Emp_no 
JOIN DEPARTMENTS
ON DEPT_EMP.Dept_no = DEPARTMENTS.Dept_no
WHERE Dept_name LIKE '%Sales%' OR Dept_name LIKE '%Development%'
ORDER BY Emp_no ASC;


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT Last_name, COUNT(Last_name) 
FROM EMPLOYEES
GROUP BY Last_name
ORDER BY COUNT(Last_name) Desc;

