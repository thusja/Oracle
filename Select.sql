-- 2022.10.17

-- DQL(질의어) 데이터 조회

-- select 컬럼명
-- from 테이블명

-- 전체 데이터
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

-- 부분성립 데이터
select empno,ename,mgr
from emp;

select deptno
from emp;

select DISTINCT(deptno)
from emp;

select job
from emp;

select DISTINCT(job)
from emp;

-- +, -, *. / 나머지 연산자는 없다
-- 컬럼을 대상으로 연산한다
-- null 값은 연산이 불가하다
-- 컬럼에 별칭을 사용할 수 있다 as 별칭
select ename as 사원명 ,sal,sal*12+nvl(comm,0)as 연봉,comm
from emp; 


-- 2022.10.18

-- 데이터 정렬
-- select 컬럼명
-- from 테이블명
-- order by 컬럼명(정렬기준이 되는 값) asc(오름차순)/desc(내림차순)

select *
from emp
order by sal asc; -- 오름차순 정렬 (오름차순은 생략 가능하다 order by sal;)

select *
from emp
order by sal desc; -- 내림차순 정렬

-- 숫자(1~10), 날짜(과거날짜~최근날짜), 문자(사전순서)

-- 조건검색
-- select 컬럼명
-- from 테이블명
-- where 조건식(컬럼명 = 값); <, >, =, != / <>, <=, >=, and, or

select *
from emp
where sal >= 3000; -- 급여가 3000이상인 사원

select *
from emp
where deptno = 30; -- 30번에 부서하는 사원

-- and 두가지 이상의 조건이 모두 참인 경우
select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499; -- 문자값은 대소문자 구문

-- 문자를 조건절에 사용할떄
-- 대소문자 구분
-- '' 소따옴표 붙이기
select *
from emp
where ename = 'FORD'; -- 소문자 ford는 없다

-- 날짜를 조건절에 사용할 때
-- ''
-- 날짜도 크기가 있다\
-- 80/12/20 -> 1980 12 20 시간 분 초 요일
select *
from emp
where hiredate < '1982/01/01';

-- or 두개이상의 조건중에 하나이상 참인 경우
select *
from emp
where deptno = 10 or sal >= 2000;

-- not 논리부정 연산자
select *
from emp
where sal != 3000;

select *
from emp
where not sal = 3000;

-- and, or
-- 범위 조건을 표현할때 사용
select *
from emp
where sal >= 1000 and sal <= 3000;

select *
from emp
where sal <= 1000 or sal >= 3000;

-- between and (a와 b사이값)
select *
from emp
where sal between 1000 and 3000;

-- in (or를 여러번 쓸필요 없이 in안에 값만 넣어주면 된다)
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

-- like 연산자
-- 값의 일부만 가지고 데이터를 조회한다
-- 와이드 카드를 사용한다 %, _
-- % 모든 문자를 대체한다
-- _ 한 문자를 대체한다
select *
from emp
where ename = 'FORD';

select *
from emp
where ename like 'F%'; -- F로 시작하는 모든 문자

select *
from emp
where ename like '%D'; -- D로 끝나는 모든 문자

select *
from emp
where ename like '%O%'; -- 앞이건 뒤건 일단 O를 포함하면 출력

select *
from emp
where ename like '___D'; -- D 전에 3글자가 포함되야한다

select *
from emp
where ename like 'S___%'; -- S 시작후 3글자는 포함하고 그후 %로 전체 포함

-- null 연산자
-- is null / is not null
select *
from emp
where comm = null; -- null은 비교 불가

select *
from emp
where comm is null;

select *
from emp
where comm is not null;

-- 집합 연산자
-- 두개의 select 구문을 사용한다
-- 컬럼의 갯수와 타입이 동일해야한다
-- 컬럼의 이름은 상관없다
-- 합집합(UNION), 차집합(MINUS), 교집합(INTERSECT)

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION -- 합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL -- 합집합 (중복될 때에는 한번만 출력한다, 중복해도 상관이 없을떈 뒤에 ALL을 붙힌다)
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
MINUS -- 차집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
INTERSECT -- 교집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

-- where
-- 비교연산자, 논리연산자, like, is null / is not null, 집합연산자
-- <, >, <=, >=, =, !=
-- and, or, not, between and, in
-- like(%,_)
-- is null, is not null
-- UNION, UNION ALL, MINUS, INTERSECT

-- ex01
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where ename like '%S';

-- ex02
select empno,ename,job,sal,deptno
from emp
where deptno = 30 and job = 'SALESMAN';

-- ex03-1
select empno,ename,job,sal,deptno
from emp
where deptno in(20,30)
INTERSECT
select empno,ename,job,sal,deptno
from emp
where sal > 2000;

-- ex03-2
select empno,ename,job,sal,deptno
from emp
where deptno in(20,30) and sal > 2000;

-- ex04
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where sal < 2000 or sal > 3000;

-- ex05
select ename,empno,sal,deptno
from emp
where ename like '%E%' and deptno = 30 and sal not between 2000 and 3000;


--e ex06
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where comm is null and job in('MANAGER','CLERK') and mgr is not null and ename not like '_L%';






































