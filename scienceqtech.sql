use scienceqtech;

select * from data_science_team;

select * from emp_record_table;

select * from proj_table;

# Maximun salary of the employee
select max(salary) as Max_salary from emp_record_table;

# All jobs meet the organization profile standards

select emp_id,first_name,last_name,role,dept,salary from emp_record_table where
(DEPT = 'Data Science' and role not in ('Data Scientist', 'ML Engineer', 'AI Engineer'))
OR (DEPT = 'IT' and role not in ('Software Engineer', 'System Analyst', 'DevOps Engineer'))
OR (DEPT = 'HR' and role not in ('HR Manager', 'Recruiter'))
OR (DEPT = 'Finance' and role not in ('Financial Analyst', 'Accountant'))
OR (DEPT = 'Operations' and role not in ('Operations Manager', 'Supply Chain Analyst'));

# Calculate bonuses to find extra cost for expenses

# Assuming 15% bonus
select emp_id,first_name,last_name,salary,(salary * 0.15) as Bonus_Amount from emp_record_table;

select sum(salary*0.15) as Total_Bonus_Expenses from emp_record_table;

#Assuming rating <3 or less exp < 1 year may need training

select emp_id,first_name,last_name,role,dept,exp,emp_rating,
case 
when emp_rating < 3 or exp < 2 then 'Yes'
else 'No'
end as Training_Required from emp_record_table order by emp_rating asc, exp asc;

# Calculate Total Employees Needing Training

select count(*) as Total_Employees__need_training from emp_record_table where emp_rating <3 or exp <2 ;

# idenfiying by department

select dept, count(*) as emp_need_training from emp_record_table where emp_rating < 3 or exp <2 group by dept order by emp_need_training;

# if training cost is 400 pounds per employee

select count(*) * 400 as total_training_cost from emp_record_table where emp_rating < 3 or exp <2;


