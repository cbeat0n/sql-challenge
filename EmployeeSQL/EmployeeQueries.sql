-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT "Salaries".emp_no , last_name , first_name , sex , salary
FROM "Employees"
INNER JOIN "Salaries"
ON "Salaries".emp_no = "Employees".emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name , last_name , hire_date
FROM "Employees"
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.

-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.


-- List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B.
SELECT first_name , last_name , sex 
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their 
-- employee number, last name, and first name.
SELECT "Dept_Emp".emp_no , "Employees".last_name , "Employees".first_name
FROM "Employees"
INNER JOIN "Dept_Emp"
ON "Employees".emp_no = "Dept_Emp".emp_no
WHERE "Dept_Emp".dept_no = 'd007';

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT "Dept_Emp".emp_no , "Employees".last_name , "Employees".first_name , "Departments".dept_name
FROM ( ("Employees" INNER JOIN "Dept_Emp" ON "Employees".emp_no = "Dept_Emp".emp_no) 
		LEFT JOIN "Departments" ON "Dept_Emp".dept_no = "Departments".dept_no)
WHERE "Dept_Emp".dept_no = 'd005' OR "Dept_Emp".dept_no = 'd007';

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name , COUNT(last_name) AS "Frequency"
FROM "Employees"
GROUP BY last_name
ORDER BY "Frequency" DESC;