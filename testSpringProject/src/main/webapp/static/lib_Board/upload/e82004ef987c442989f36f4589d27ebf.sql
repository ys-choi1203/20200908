-- 20.06.02 연습문제

-- 1. 사원테이블에서 직무에 'MAN'를 포함하고 급여가 10000이상인 사원을
-- 사원번호와 성과 직무 그리고 급여를 출력
select employee_id, last_name, job_id, salary
from HR.employees
where job_id like '%MAN%'
AND salary >=10000;

--2. 직무가 SA_REP와 AD_PRES 이면서 급여가 15000을 초과하는 
-- 사원을 출력하시오. 단, 성, 직무, 급여만 출력 or와 and만 사용
select last_name, job_id, salary
from HR.employees
where (job_id = 'SA_REP' or job_id = 'AD_PRES')
and salary > 15000;

-- 부서번호 , 급여, 입사일, 성
--3. 직원테이블에서 부서를 오름차순으로 정렬하여 출력하시오.
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id;

--4. 부서는 내림차순으로 정렬하고 입사일도 내림차순으로 정렬
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id, hire_date desc;

--5. 부서는 내림차순으로 정렬하고 입사일은 오름차순으로 정렬하여 출력
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id desc, hire_date asc;

--6. 부서는 내림차순으로 정렬하고 입사일은 오름차순으로 정렬하여 
--   급여를 내림차순으로 정렬하여 출력
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id desc, hire_date asc, salary desc;

--Lower, Upper, initcap, concat, substr
select last_name, lower(last_name) , hire_date
from hr.employees
where lower(last_name) = 'grant';

--7. 모두 소문자인 grant와 모두 대문자인 'GRANT'로 직원서 해당 사원을 찾으려 한다.  (Grant) 
select last_name, lower(last_name), upper(last_name)
from HR.employees
where lower(last_name)='grant'
and upper(last_name)='GRANT';

--8. 'GranT'로 입력했을때 사원테이블에서 'Grant'를 찾으시오.
select INITCAP('GranT')
from HR.employees;

--9. 성은 모두 대문자로 변환하고 이름 모두 소문자 변환하여
-- 성과 이름을 붇여 출력할 때 ' 나는 GRANT douglas 입니다'로 출력되게 하시오.
select '나는 ' || upper(last_name) ||' '||lower(first_name) ||' 입니다'
from HR.employees;

--10. 성과 이름을 붙여 출력
select concat(last_name, first_name)
from HR.employees;

--11. 성은 모두 대문자로 변환하고 이름 모두 소문자 변환하여
-- 성과 이름을 붇여 출려할 때 ' 나는 GRANT douglas 입니다'로 출력되게 하시오. concat을 이용
select concat('나는 ',last_name, first_name,'입니다.')
from HR.employees;

--12. 성이 Davies에서 av만 출력하시오.
select substr('Davies',2,2) from HR.employees
where last_name='Davies';

--13. 성이 두번째 글짜부터 모두 출력하시오.
select last_name, substr(last_name , 2)
from HR.employees;

--14. 성의 마직막 글자에서 두글짜만 가져오시오.
select last_name, substr(last_name,-2)
from HR.employees;

--15. 성의 뒤에 on으로 끝나는 사람을 찾으시오.
select last_name, substr(last_name,-2)
from HR.employees
where substr(last_name,-2)='on';

--16. 성의 뒤에 세번째 글자가 so인 사람을 출력하시오.
select last_name, substr(last_name,-3,2)
from HR.employees
where substr(last_name,-3,2)='so';

-- 직원번호, 성, 급여, 직무
--17. 직원 정보를 출력하는데 이메일은 왼쪽에서 3글자만 출력하시오.
select employee_id, last_name, salary, job_id,email, substr(email,1,3)
from HR.employees;

--18. 직원 정보를 출력하는데 이메일은 오른쪽에서 3글자만 출력하시오.
select employee_id, last_name, salary, job_id, email,substr(email,-3,3)
from HR.employees;

-- 19. 틀린 곳을 찾고 이유를 말하시오


-- 직원번호 성, 성의 위치, 직무
--20. o가 있는 성중 o가 몇번째에 있는 위치를 출력하시오.
select employee_id, last_name, instr(last_name, 'o'), job_id
from HR.employees;

--21. oc가 있는 성 중 oc가 몇번째에 있는 위치를 출력하시오.
select employee_id, last_name, instr(last_name, 'oc'), job_id
from HR.employees;

--22. 직무에 RE가 있는 경우 RE부터 3글자만 출력하시오.
-- 직원번호 성 직무 가공된 직무
select employee_id, last_name, job_id, substr(job_id,instr(job_id, 'RE'),3)
from HR.employees;

--23. 직원번호, 성, 입사일 , 급여, 급여앞에 * 표시가 되게 하자.
select employee_id, last_name, hire_date,concat('*',salary)
from HR.employees;

--24. 직원번호, 성, 입사일 , 급여, 급여뒤에 * 표시가 되게 하자.
select employee_id, last_name, hire_date,concat(salary,'*')
from HR.employees;

--25. 직원번호, 성, 입사일, 직무를 출력하는데 직무에 RE가 있다면 
-- RE를 AB로 변경하여 출력
select employee_id, last_name, hire_date, job_id,
replace(job_id,'RE','AB')
FROM HR.employees;

--26. 직원번호, 연락처, 커미션, 부서번호,급여
-- 급여를 3000으로 나누었을 때의 나머지를 출력하시오.
select employee_id, phone_number, commission_pct, salary,
mod(salary,3000)
from HR.employees;

--27. 2002년도에 입사한 직원들을 출력하시오
select * from HR.employees
where hire_date > TO_DATE('2002','yyyy');

--28. 올해는 오늘까지 몇주가 지났는지 확인하시오
select (sysdate-to_date('02/01/01','yy/mm/dd'))/7 from dual;

--29. 직원마다 몇년 근무해는지 출력
-- 직원번호, 성, 연락처, 부서, 근무년수
select employee_id, last_name, phone_number, department_id,
(sysdate-hire_date)/365 year
from HR.employees;

--30. 근속년수 8년 이상인 사원들만 출력
select * from HR.employees
where (sysdate-hire_date)/365 >=8;

-- 2번
--31. 직원이 오늘날짜로 입사한지 몇개월 되었는지 출력
-- 직원번호 직무 입사일 입사개월(MONTH_BETWEEN)
select employee_id, job_id, hire_date, 
months_between(sysdate, hire_date)
from HR.employees;

--32. 직원이 입사한 날로부터 6개월후는 몇일입니까?
-- 직원번호 성 입사일 6개월후(ADD_MONTHS)
select employee_id, last_name, hire_date,
add_months(hire_date,6)
from HR.employees;

--33. 직원이 입사한지 36개월이 넘은 사원을 출력
-- 직원번호 성 입사일
select employee_id, last_name, hire_date
from HR.employees
where months_between(sysdate,hire_date)>=36;

--34. 직원이 입사한지 36개월 미만인 사원을 출력하시오
-- 직원번호 성 입사일
select employee_id, last_name, hire_date
from HR.employees
where months_between(sysdate,hire_date)<36;

--35. 오늘부터 다음 금요일은 몇일 입니까?(NEXT_DATE);
select next_day(sysdate,'금요일')from dual;

--36. 게시판 리스트에서 제목을 5글자*****
-- 직원의 성을 3글자만 출력 뒤에 *을 세번찍어서 출력
-- 직원번호 입사일 성
select employee_id, hire_date,concat(last_name,'***')
from HR.employees;

--37. 홍길동은 몇글자입니까?
select length('홍길동')from dual;

--38. "홍길동\n"으로 되어 있는 것을 html에서 행바꿈이 되도록 
-- "홍길동 <br>"변경하시오

--39. 입사일이 'YYYY-MM-DD'인 날짜를 31-05-2019 16:25:30 오전인 형태로 출력
select to_char(hire_date,'yyyy-mm-dd'),
to_char(hire_date,'dd-mm-yyyy hh24:mi:ss am') 
from HR.employees;

--40. 숫자(3333333)를 3자리마다 쉼표를 찍어서 출력
select to_char('3333333','999,999') from dual;

--41. 직원테이블에서 급여를 w33,333,333식으로 출력
select salary, to_char(salary,'L999,999')
from HR.employees;

--42. 직원의 2018-10-25까지 근무일수를 계산하시오
-- 직원번호 부서번호 입사일 근무일수
select employee_id, department_id, hire_date,
to_date(to_char(2018-10-25,'yyyy-mm-dd'))-to_date(to_char(hire_date,'yyyy-mm-dd'))
from HR.employees;

--43. '10-25-2002'에 입사한 사원 출력
-- 직원번호 부서번호 입사일 근무일수
select employee_id, department_id, hire_date,
sysdate-hire_date
from HR.employees;

--44. 연말정산을 하려고 합니다. 연봉(급여*12) : 급여는 커미션까지 포함
-- 직원의 연봉을 구하시오
-- 직원번호 부서번호 급여 연봉
select employee_id, department_id, salary,
salary*12+nvl(commission_pct,0)
from HR.employees;

--45. 부서가 90이거나 30인 부서의 직원의 연봉을 구하시오
-- 직원번호 부서번호 급여 연봉
select employee_id, department_id, salary,
salary*12+nvl(commission_pct,0)
from HR.employees
where department_id in(90,30);

--46. nvl2, 직원번호와 성과 급여 그리고 연봉을 출력
select employee_id, last_name, salary,
nvl2(commission_pct, salary*12+commission_pct,salary*12)
from HR.employees;

--47. 급여가 10000이상이면 "이사급입니다"
--             7000이상이면 "부장급입니다"
--             5000이상이면 "과장급입니다"
--             나머지는 사원으로 출력하시오.
--             성과 급여를 같이 출력한다.

--case
select employee_id, salary, job_id,
case  when salary >= 10000 then '이사급입니다'
      when salary >= 7000 then '부장급입니다'
      when salary >= 5000 then '과장급입니다'
      else '사원입니다.'  end
from hr.employees;

--decode
select employee_id, salary, job_id
decode(salary, salary>=10000,'이사급입니다.'
            , salary>=7000,'부장급입니다.'
            , salary>=5000,'과장급입니다.'
            ,'사원입니다.') jo
            from HR.employees;

--48. 급여를 2000으로 나눈 값의 몫이 
--       0이면 0.00
--       1이면 0.09
--       2이면 0.20
--       3이면 0.30
--       4이면 0.40
--       5이면 0.42
--       6이면 0.44
--             0.45 만큼 세금이 부여된다.
-- 부여되는 세금을 출력하시오.
-- 성과 급여도 같이 출력하시오.(단, 부서가 80인 사원만)       
select employee_id, salary, last_name,
 decode (trunc(salary/2000, 0), 0, salary * 0.00
			      , 1, salary * 0.09
                              , 2, salary * 0.20
 			      , 3, salary * 0.30
			      , 4, salary * 0.40
			      , 5, salary * 0.42
			      , 6, salary * 0.44
			      , salary * 0.45) tex
from hr.employees
where department_id = 80;

--49. 직원 전체에서 입사일이 제일 빠른 사람과 최근에 입사한 사원을 출력


--50. 사원의 수를 출력하시오.
select count(employee_id) from HR.employees;

--51. 직원테이블에서 부서가 몇개인지 출력
select count(department_id) from HR.employees;

--52. 사원 테이블에서 각 부서별 급여평균을 구하자
select avg(salary) from HR.employees
where department_id;

--53. 위 문제에서 부서를 오름차순으로 정렬하여 출력

--54. 각 부서별 급여의 평균을 구하는 평균값이 낮은것부터 출력

--55. 각 부서에 있는 사원의 직무별 급여의 평균을 구하시오









