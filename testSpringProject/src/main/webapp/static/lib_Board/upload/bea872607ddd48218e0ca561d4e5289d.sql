select * from HR.employees;

select * from HR.departments;

select department_id, location_id from HR.departments;

select employee_id, first_name, email from HR.employees;

select job_id, department_id
from HR.employees;

SELECT
last_name, phone_number from HR.employees;

select departement_id, manager_id from HR.departments;

select
commission_pct, salary, employee_id from HR.employees;

select * from HR.employees;

desc HR.employees;

select last_name, salary, salary+300 from HR.employees;
--주석이다--

select last_name, salary, salary*12+300 from HR.employees;

--문제--
--모든 사원에게 매달 100만큼씩 지급이 더 된다고 한다.--
--first_name과 급여 그리고 년봉을 구하시오--
select first_name, salary, (salary+100)*12 from HR.employees;

select last_name, job_id, salary, commission_pct
from HR.employees;

select last_name, 12*salary*commission_pct
from HR.employees;

--컬럼네임 변경하기--
select last_name as name, commission_pct comm
from HR.employees;

--대소문자 구분--
select last_name as "Name", commission_pct "comm pct"
from HR.employees;
--jsp에서는 ""를 사용을 하지말아라--

--문제) first_name이 '숭무'이고 last_name이 '이일때--
--'이숭무'로 출력되도록하시오.--
select last_name ||' ' || first_name name, 25 literal --리터널
from HR.employees;

--문제) 이숭무의 직무는 강사입니다. 처럼 출력하시오
select last_name||first_name||'의 직무는 '||job_id||'입니다.' job
from HR.employees;

select department_name ||
q'[, it's assigned Manager Id: ]'|| manager_id
as "Department and Manager"
from HR.departments;

select department_id from HR.employees;

--반복적으로 출력되는 부서를 한번만 출력--
select DISTINCT department_id from HR.employees;

--부서별 직무를 출력하시오.--
select distinct job_id, department_id from HR.employees;

select employee_id, last_name, job_id, department_id
from HR.employees
where department_id=90;

--직무가 ST_MAN인 사원을 찾아라--
select employee_id, last_name, job_id, department_id
from HR.employees
where job_id='ST_MAN';

--데이터를 비교할때 대소문자 구분--
select last_name, job_id, department_id
from HR.employees
where last_name='Whalen';

SELECT * FROM HR.employees
WHERE LAST_NAME='King';

select * from member where user_id='highland' and user_pw='1234';

select * from HR.employees
where salary < 3000;

select * from HR.employees
where hire_date < '05/12/01';

select * from HR.employees
where first_name< 'Neena';

--문제) 입사일이 02/01/01부터 04/12/31사이에 입사한 직원 출력
select * from HR.employees
where hire_date >= '02/01/01' and hire_date <= '04/12/31';

select * from HR.employees
where hire_date between'02/01/01' and '04/12/31';

--급여가 5000 ~ 10000사이에 있는 사원을 출력
select * from HR.employees
where salary >= 5000 and salary <= 10000;

select * from HR.employees
where salary between 5000 and 10000;

-- 이름이 'Lex'이고 직무가 'AD_VP'인 사원을 출력하시오--
select *from HR.employees
where first_name ='Lex' and job_id='AD_VP';

-- 부서가 10이거나 30이거나 50인 사원들을 출력하시오--
SELECT *from HR.employees
where department_id = 10 or department_id=30 or department_id=50;

-- 관리자가 100이거나 120이거나 110인 사원을 출력하시오
select * from HR.employees
where manager_id=100 or manager_id=120 or manager_id=110;

select * from HR.employees
where manager_id in(100,120,110);


-- 연습문제 1
select last_name, job_id, salary as sal from HR.employees;]

select * from hr.job_grades;

select employee_id, last_name,
salary * 12 
from HR.employees;
-- 5. sal이라는 컬럼이 없고 annual salary는 안됨

select department_id, department_name, manager_id, location_id
from HR.departments;

select employee_id,last_name, job_id, hire_date startdate
from HR.employees;

select distinct job_id
from HR.employees;

select employee_id "Emp#",last_name "Employee", job_id "Job", hire_date "Hire Date"
from HR.employees;

select last_name||', '||job_id "Employee and Title"
from HR.employees;

select employee_id ||', '|| first_name||', '|| last_name||', '|| email||', '||
phone_number||', '||hire_date||', '|| job_id||', '|| salary||', '||
commission_pct||', '|| manager_id||', '|| department_id THE_OUTPUT
from HR.employees;

-- 포함하는 
select * from hr.employees
where last_name like '%o%' or email like '%o%';
-- % 모든이라는 뜻 

-- Strubg val = "o";
--String sql = "select * from hr.emplyees" + "where last_name like '%" + val + "%'" + "or email like '%" + val + "%'";

--시작하는
--문제 대문자 A로 시작하는 
SELECT * FROM hr.employees where first_name like 'A%';

--끝나는 
SELECT * FROM hr.employees where first_name like '%a';

--2002년도에 입사한 사원들을 출력하시오 02로 시작하눈 
SELECT * FROM hr.employees where hire_date like '02%';

--두번째 글자에 'o'가 이름에 포함된 사원을 출력하시오. _표시!!
SELECT * FROM hr.employees where first_name like '_o%';

--세번째 글자에 'o'가 포함되어 있는 사원ㅇ르 출력
select * from hr.employees where first_name like '__o%';

--뒤에서 이름에 두번쨰 'o'가 포함되는 사원
select * from hr.employees where first_name like 'o_';

--이름에 sa가 포함된 사원을 출력하시오.
select * from hr.employees where first_name like '%sa%' or email like '%sa%';

--where은 조건 
SELECT last_name, job_id, commission_pct FROM hr.employees;

--커미션을 받지 못하는 사원 출력하시오.
-- null 은 = 불가능 값을 모르니까 is사용  
SELECT * FROM hr.employees where commission_pct is null;

--커미션을 받고 있는 사원 
select * from hr.employees where commission_pct is not null;

--부서가 없는 사원을 출력하시오.
select * from hr.employees where department_id is null;

--and | or
--급여가 10000이거나 직무가 MAN을 포함하고 잇는 사원을 출력
SELECT * FROM hr.employees where salary = 10000 or job_id like '%MAN%';

--급여가 15000이상이면서 직무가 'SA_REP'이거나 'AD_PRES'인 사원을 출력
--select * from hr.employees where salary >= 15000 and job_id like '%SA_REP%' or salary >= 15000 and job_id like '%ad_PRES%'
select * from hr.employees where salary >= 15000 and (job_id = 'SA_REP' or job_id = 'Ad_PRES');

SELECT
    *
FROM hr.employees where salary >= 15000 and job_id in ('SA_REP','AD_PRES');

--부서가 30이고 60인 부서에서 rmqdurk 10000이상인 사원들을 출력
select * from employees where (department_id = 30 or department_id = 60) and salary >= 10000; 


--정렬
--이름을 오름차순으로 정렬하여 출력
--오름차순 asc 내림차순 desc
select * from hr.employees
order by first_name;

--입사일이 빠른 사원부터 출력 하시오.
select * from hr.employees ORDER BY hire_date asc;
--최근에 입사한 사원부터 출력하시오.
select * from hr.employees ORDER BY hire_date desc;

desc hr.employees; --이건 테이블 정보 확인

--사원번호, 성, 급여의 연봉을 출력하는데 연봉을 ansal로 출력
SELECT employee_id, last_name, salary * 12 ansal FROM hr.employees;

--위 내용에서 연봉을 오름으로 출력하시오.
--정렬시에 별칭을 사용할 수 있다. 또는 순서 적어도 됨. 
SELECT employee_id, last_name, salary * 12 ansal from hr.employees order by ansal;

--부서를 오름차순으로 정렬 하는데 부서의 사원들의 급여를 내림 차순으로 정렬
--부서 오름차순으로 정렬한 거 안에서 사원들의 급여를 내림차순으로 한거
select * from hr.employees ORDER BY department_id asc, salary desc;

-- select
 -- from
 -- where
 -- order by


--50인 부서의 //사원들을 직무를 내림차순으로 정렬하고 직무에 대한 급여를 오름차순으로 정렬
SELECT * FROM hr.employees where department_id = 50 order by job_id desc, salary asc;

--급여가 10000이 아닌 사원들을 출력하시오. ^
SELECT * FROM hr.employees where salary != 10000;
--SELECT * FROM hr.employees where salary ^= 10000;
--SELECT * FROM hr.employees where salary <> 10000;


--직무가 'SA_REP', 'AD_PRES'에 속해있지 않은 사원들을 출력하시오.
SELECT * FROM hr.employees where job_id != 'SA_REP' and  job_id != 'Ad_PRES';
--SELECT * FROM hr.employees where job_id not in ( 'SA_REP','AD_PRES');

--사원의 급여가 3000보다 작고 10000보다는 큰 사원을 출력하시오
SELECT * FROM hr.employees where salary not between 3000 and 10000;

--사원들 중 higgins 라는 사원을 출력하시오.
SELECT * FROM hr.employees where lower(last_name) = 'higgins';

SELECT last_name, lower(last_name) FROM hr.employees; 

--성과 이름을 붙여서 출력하시오. 급여와 직무도 출력
SELECT last_name || first_name name , salary , job_id FROM hr.employees;

SELECT concat(last_name, first_name) name , salary , job_id FROM hr.employees;

--성과 이름을 출력하는데 이름의 길이를 같이 출력하시오.
SELECT last_name, first_name, length(first_name) FROM hr.employees;

--사원번호와 이름 , 직무, 급여를 출력하는데 직무의 4번째 글자가  REF로 시작하는 사원을 출력하시오.
select employee_id, first_name, job_id, salary from hr.employees where job_id like '___REP';
where substr(job_id,4) = 'REP'; -- %들어 갈 수 없음.

--직무에 4번째 붙 2글자가 pr인 직원을 출력하시ㅗㅇ.
SELECT * FROM hr.employees where substr (Job_id,4,2) = 'PR'; -- < 'pr' 비교해야한느 ㅣㄹ이 

--사원번호의 급여, 직무를 출력하는데 지구므는 5번째부터 3글짬나 추력.
SELECT  * from hr.employees wehre SUBSTR(job_Id,4,3) = 'PRO';
--사원번호의 급여 직무를 출력하는데 직무를 뒤에서3글짜부터 2글자 출력

SELECT employee_id, salary, job_Id, substr(job_id, -3,2)FROM hr.employees;

--직무가 뒤에서 3글짜부터 2글짝 re사원들 출력
select * from hr.employees where SUBSTR(job_id, -3,2) = 'RE';

--이름에 s라는 글짜가 있는 경우 몇번째 인지 출력하시오.(indexof())

SELECT first_name, instr(first_name,'s') FROM hr.employees; --firstName.indexOf('s');

--이름에 's'가 6번째에 있는 사원을 출력하시오.
SELECT * FROM hr.employees where inster(first_name,'s') = 6;

--사원번호 성 이름직무 이름의 길이 그리고 성에 a가 있는 위치를 출력하는데 직무에 4번쨰 글짜부터 3글자가 'REP'인사원만 출력
SELECT employee_id, last_name,instr(last_name,'a') ,length(first_name) FROM hr.employees where SUBSTR(job_id, 4, 3) = 'REP';

--사원번호 성 직무급여를 출력하는데 급여에 1234f를 뺀후 1000으로 나눠
SELECT employee_id, last_name, job_id, (salary-1234)/1000 FROM hr.employees;

--위 내용에서 출력된 급여를 소수점 두자리 까지 출력하게 하시오.
SELECT employee_id, last_name, job_id, (salary-1235)/1000,round((salary-1235)/1000,2),round((salary-1235)/1000,0) FROM hr.employees;

select round(45.923,2),round(45.923,0),round(45.923,-1) from dual;

--절식 trunc
select trunc(45.925,2),trunc(45.923,0),trunc(45.923,-1) from dual;

--성과 급여를 출력하는데 급여를 5000으로 나눈 나머지도 같이 출력하시오.
-- 단 , 직무가 'SA_REP'인 사원만 출력하시오.
SELECT last_name, mod(salary,5000) FROM hr.employees where job_id = 'SA_REP';

--날짜
--현재 날짜 출력(new Date() system.out.println(new Date());
SELECT sysdate FROM dual; 
--입사일이 2007년 01월 01일 보다 이전인 직원들을 출력하시오.
SELECT * FROM hr.employees where hire_date < '07/01/01';

SELECT * FROM hr.employees where hire_date < to_date ('01/01/07', 'DD/MM/YY');

--사원번호 직무 입사일을 출력하는 사원들이 입사일로부터 몇주기가 되었는지 같이 출력하시오.
SELECT employee_id,job_id,hire_date,(sysdate -hire_date)/7 FROM hr.employees;

--위에서 몇년이 되었는지 출력
SELECT employee_id,job_id,hire_date,round((sysdate -hire_date)/365 )
FROM hr.employees;

-- 입사한지 몇달이 되었는지 출력
SELECT employee_id, job_id, hire_date, 
       trunc(months_between(sysdate, hire_date))
FROM hr.employees;

-- 입사이후 6개월이 된 날짜는 언제입니까?
-- 사무번호, 직무, 입사일
SELECT employee_id, job_id, hire_date, add_months(hire_date,6) 
FROM hr.employees;

-- 입사이후 14일이 지난 날짜
SELECT employee_id, job_id, hire_date, hire_date+14
FROM hr.employees;

-- 오늘 날짜에서 14일 전에 입사한 직원
select * from HR.employees
where hire_date = sysdate-14;

-- 입사일로부터 다음 금요일은 몇일입니까
select employee_id, job_id, hire_date,
       next_day(hire_date, '금요일')
from HR.employees;

-- 달의 마지막날을 출력
-- 입사한 달의 마지막 날은 언제
select employee_id, job_id, hire_date, last_day(hire_date)
from HR.employees;

-- 입사일로 부터 36개월이 지난 사원들을 출력하시오
select * from HR.employees
where months_between(sysdate,hire_date) > 36;

-- 일
select * from HR.employees
where sysdate-hire_date > 36;

-- 입사일로부터 몇일이 지났는지 구하오
select sysdate-hire_date from HR.employees;

-- 사원번호, 직무, 입사일출력, 입사일을 4자리로 출력
select employee_id, job_id, hire_date, to_char(hire_date,'yyyy-MM-DD')
from HR.employees;

select employee_id, job_id, hire_date,
to_char(hire_date, 'yyyy-MM-DD HH : MI : SS AM')
from hr.employees;

select sysdate, to_char(sysdate, 'YYYY-MM-DD HH24 : MI : SS AM')
FROM dual;

-- 사원번호, 직무, 급여 출력하는데 급여 앞에 $를 붙이고 세자리마다 ','를 찍는다
select employee_id, job_id, to_char(salary, '$999,999')
from HR.employees;

-- 사원번호 직무 급여를 출력하는데 급여 앞에 지역화폐('L') 단위를 
-- 붙이고 세자리마다 ','를 찍어주자
select employee_id, job_id, to_char(salary, 'L999,999')
from HR.employees;

-- 날짜가 10-10-2002일 이후를 출력
select * from HR.employees
where to_char(hire_date,'mm-dd-yyyy') > '10-10-2002';

select * from HR.employees
where hire_date > to_date('10-10-2002','mm-dd-yyyy');

-- 일반 함수 : NVL NVL2 NULLIF
select employee_id, job_id, salary+salary*nvl(commission_pct,0)
from HR.employees;

select employee_id,job_id, nvl2(commission_pct, salary+salary*commission_pct,salary)
from HR.employees;

-- 사원번호 직무 연봉을 구하시오
select employee_id, job_id,salary*(1+nvl(commission_pct,0))*12
from HR.employees;

----------------------- 많이 사용하는 방법
select employee_id,job_id, nvl2(commission_pct, 'sal+comm','sal')
from HR.employees;

-- 조건 표현식
-- 직무가 'IT_PROG'라면 급여에 1.1배를 하고
--       'ST_CLERK'라면 급여에 1.15배를 하고
--       'SA_REP'라면 급여에 1.2배를 한다.
--       나머지 직원은 급여만 지급한다.
-- 사원번호, 급여, 직무, 조건에 따른 값
select employee_id, salary, job_id, 
       case job_id when 'IT_PROG' then salary*1.10
                   when 'ST_CLERK' then salary*1.15
                   when 'SA_REP' then salary*1.20
       else salary end sal, hire_date
from HR.employees;

-- 급여가 10000이상이면 "이사급입니다."
--          7000이상이면 "부장급입니다."
--          5000이상이면 "과장급입니다."
--          나머지는 사원으로 출력
-- 성과 급여를 같이 출력
select last_name, salary, job_id,
case when salary>=10000 then '이사급입니다.'
     when salary>=7000 then '부장급입니다.'
     when salary>=5000 then '과장급입니다.'
     else '사원입니다.' end
from HR.employees;

-- decode
-- 직무가 'IT_PROG'라면 급여에 1.1배를 하고
--       'ST_CLERK'라면 급여에 1.15배를 하고
--       'SA_REP'라면 급여에 1.2배를 한다.
--       나머지 직원은 급여만 지급한다.
-- 사원번호, 급여, 직무, 조건에 따른 값
select employee_id, salary, job_id, 
       decode(job_id ,'IT_PROG' ,salary*1.10
                   ,'ST_CLERK', salary*1.15
                  , 'SA_REP', salary*1.20
       , salary ) sal, hire_date
from HR.employees;

-- 급여가 10000이상이면 "이사급입니다."
--          7000이상이면 "부장급입니다."
--          5000이상이면 "과장급입니다."
--          나머지는 사원으로 출력
-- 성과 급여를 같이 출력
select last_name, salary, job_id,
    decode(salary>=10000, '이사급입니다.'
          ,salary>=7000, '부장급입니다.'
          ,salary>=5000, '과장급입니다.'
          ,'사원입니다.')
from HR.employees;

-- 문제) 급여를 2000으로 나눈 몫이
--            0이면 0.00
--            1이면 0.09
--            2이면 0.20
--            3이면 0.30
--            4이면 0.40
--            5이면 0.42
--            6이면 0.44
--                 0.45 만큼 세금이 부여된다.
-- 부여되는 세금을 출력
--성과 급여도 같이 출력(단, 부서가 80인 사원만) decode를 사용
select last_name, salary,
decode(trunc(salary/2000, 0),0, salary*0.00
                            ,1,salary*0.09
                            ,2,salary*0.20
                            ,3,salary*0.30
                            ,4,salary*0.40
                            ,5,salary*0.42
                            ,6,salary*0.44
                              ,salary*0.45) tax_rate
from HR.employees
where department_id =80;
                            

            
            
































