-- EMPLOYEE 테이블에서 '해외영업1부'에 속한 모든 직원의 이름, 직급, 급여를 조회하시오.

        /* select
            dept_id
        from
            department
        where
            dept_title = '해외영업1부';

        select
            emp_name 이름,
            job_code 직급코드,
            salary 급여
        from
            employee
        where
            dept_code = 'D5'; */


        select
            a.emp_name 이름,
            b.job_name 직급,
            a.salary 급여
        from
            employee a
        inner join
                job b using(job_code)
        where
            dept_code = (
                select
                    dept_id
                from
                    department
                where
                    dept_id = 'D5'
                );



-- EMPLOYEE 테이블에서 모든 직원의 평균 급여보다 높은 급여를 받는 직원의 이름과 급여를 조회하시오.


        select
            emp_name,
            salary
        from
            employee
        where
            salary > (
                select
                    avg(salary)
                from
                    employee
            );


        /* select
            avg(salary)
        from
            employee;

        select
            emp_name,
            salary
        from
            employee
        where
            salary > (select avg(salary)
                      from employee) */


-- EMPLOYEE 테이블에서 각 부서의 평균 급여보다 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.


        select
            a.emp_name 이름,
            b.dept_title 부서명,
            a.salary 급여
        from
            employee a
        inner join
                department b
        on
            a.dept_code = b.dept_id
        where
        a.salary in (select avg(a.salary) < a.salary
                        from employee
                        group by b.dept_title);



-- 상관서브쿼리문제
-- EMPLOYEE 테이블에서 각 부서별로 가장 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.

    select
        emp_name
-- EMPLOYEE 테이블에서 각 직급별 평균 급여보다 높은 급여를 받는 직원의 이름, 직급, 급여를 조회하시오.


-- EXISTS 절 문제
-- DEPARTMENT 테이블에서 직원이 있는 부서의 부서명을 조회하시오.

-- EMPLOYEE 테이블에서 급여가 가장 높은 직원의 이름과 급여를 조회하시오. (NOT EXISTS 사용)


-- CTE 문제
-- EMPLOYEE 테이블에서 각 부서별 평균 급여를 계산하고,
-- 평균 급여가 4000000 이상인 부서의 부서명과 평균 급여를 조회하시오.