-- 연습2

-- 1. 급여가 12000를 넘는 사원의 이름과 급여를 출력
select last_name, salary
from HR.employees
where salary >=12000;

-- 2. 사원 번호가 176인 사원의 이름과 부서번호 출력
select last_name, department_id
from HR.employees
where employee_id=176;

-- 3. 급여가 5000에서 12000사이에 포함되지 않는 사원의 이름과 급여 출력
select last_name, salary 
from HR.employees
where salary not between 5000 and 12000;

-- 4. 1998년 2월 20일과 1998년 5월 1일 사이에 입사한 사원의
-- 이름 업무id  시작일 출력
select last_name, job_id, hire_date
from HR.employees
where hire_date between '02/02/20' and '03/05/01';

-- 5. 부서 20및 50에 속하는 사원의 이름과 부서번호 출력, 이름의 오름차순
select last_name, department_id
from HR.employees
order by last_name;

-- 6. 급여가 5000과 12000사이고 부서번호가 20또는 50인 사원의 이름과 급여를 출력
-- 레이블을 Employee와 Monthl Salary로 지정
select last_name employee, salary monthlysalary
from HR.employees
where salary between 5000 and 12000 
and department_id in(20,50);

-- 7. 1994년에 입사한 모든 사원의 이름과 입사일을 출력
select last_name, hire_date 
from HR.employees
where to_char(hire_date,'yyyy') = '2002';

-- 8. 관리자가 없는 모든 사원의 이름과 업무를 출력
select last_name,job_id
from HR.employees
where manager_id is null;

-- 9. 커미션을 받는 모든 사원의 이름, 급여, 커미션을 급여 및 커미션을 기준으로 내림차순 출력
select last_name, salary, commission_pct
from HR.employees
where commission_pct is not null
order by salary desc;

-- 10. 이름의 세번째 문자가 'a'인 모든 사원이 이름 출력
select last_name
from HR.employees
where last_name like '__a%';

--11. 이름에 'a'와 'e'가 있는 모든 사원의 이름을 출력
select last_name
from HR.employees
where last_name like '%a%' and last_name like '%e%';

-- 12. 직무가 'ST_CLERK' 또는 'SA_REP'이면서 
-- 급여가 2500,3500 또는 7000이 아닌 모든 사원의 이름 직무 급여 출력
select last_name, job_id, salary
from HR.employees
where job_id in('ST_CLERK','SA_REP')
AND SALARY NOT IN(2500,3500,7000);

-- 13. 커미션 비율이 20%인 모든 사원의 이름 급여 커미션 출력
select last_name, salary, commission_pct
from HR.employees
where commission_pct = 0.20;













