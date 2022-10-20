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

-- 문자를 조건절에 사용할??
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
UNION ALL -- 합집합 (중복될 때에는 한번만 출력한다, 중복해도 상관이 없을?? 뒤에 ALL을 붙힌다)
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

-- 함수
-- 문자함수 : upper, lower, substr, instr, replace, lpad, rpad, concat
-- 숫자함수
-- 날짜함수


-- 문자함수
select 'Welcome',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp 
where ename = 'FORD';

select *
from emp
where lower(ename) = 'scott';

select ename,length(ename)
from emp;

-- substr('글씨', 시작위치, 끝나는위치)
select 'Welcome to Oracle', substr('Welcome to Oracle',1,3)
from dual;

select 'Welcome to Oracle', substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;

select 'Welcome to Oracle', substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)
from dual;

-- 첫번째 o 번호 찾기
select instr('Welcome to Oracle','o')
from dual;

-- 6번째이후 o 번호 찾기
select instr('Welcome to Oracle','o',6)
from dual;

-- 6번째이후 두번째 o 찾기
select instr('Welcome to Oracle','o',6,2)
from dual;

-- 3번째이후 두번째 e 찾기
select instr('Welcome to Oracle','e',3,2)
from dual;

-- replace 글씨 바꾸기
select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual;


select 'Oracle',lpad('Oracle',10,'#'),rpad('Oracle',10,'*'),lpad('Oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual;

select concat(empno,ename), empno || '' || ename
from emp;


-- 숫자함수

-- 반올림 위치 선택
select round(1234.5678), round(1234.56789,0), round(1234.56789,1), round(1234.56789,2),round(1234.56789,-1)
from dual;

-- 버리는 위치 선택
select trunc(1234.5678), trunc(1234.5678,0), trunc(1234.5678,1),trunc(1234.5678,2),trunc(1234.5678,-1)
from dual;

-- ceil(자신보다 큰 가장 가까운 정수) / floor(자신보다 작은 가장 가까운 정수)
select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
from dual;

-- mod 나눈 나머지값 구하기
select mod(5,2), mod(10,4)
from dual;

-- 사원이 홀수인 인원 구하기
select *
from emp
where mod(empno,2) = 1;


-- 2022.10.19


-- 날짜함수
-- sysdate : 현재 날짜
select sysdate
from dual;

-- 날짜 데이터는 연산이 가능하다
-- sysdate-1 어제, sysdate 오늘, sysdate+1 내일
select sysdate-1,sysdate,sysdate+1
from dual;

-- 근무일수
select sysdate - hiredate as 근무일수
from emp;

-- 근속년수
select trunc((sysdate-hiredate)/365) as 근속년수
from emp;

-- 날짜 데이터는 round, trunc함수 적용이 가능하다.
select sysdate,
    round(sysdate, 'CC') as format_cc,
    round(sysdate, 'YYYY') as format_yyy,
    round(sysdate, 'Q') as format_q,
    round(sysdate, 'DDD') as format_ddd,
    round(sysdate, 'HH') as format_hh
from dual;

-- 변환함수(p.158 그림 참고)
-- to_char : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- to_number : 문자 데이터를 순자 데이터로 변환
-- to_date : 문자 데이터를 날짜 데이터로 변환

-- 날짜를 문자로 변환
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as 입사일자
from emp;

-- 숫자를 문자로 변환(화폐단위를 붙일 때 많이 사용)
select to_char(123456,'L999,999') -- L : 현재 지역의 화폐를 붙여줌
-- 9: 숫자의 한 자리를 의미(빈 자리를 채우지 않음)
-- 0: 숫자의 빈칸 자리를 0으로 채움
from dual;

select to_char(sal,'L999,999')
from emp;

-- 문자를 숫자로 변환
-- ** 반드시 문자가 숫자형식으로 구성이 되어있어야함
-- 문자로 구성되어있으면 오류발생

select '20000'-10000 -- 문자에서 숫자빼기 가능(자동형변환)
from dual;

select '20000'-'5000' -- 문자에서 문자빼기 가능(자동형변환)
from dual;

select '20,000'-'5,000' -- 숫자 사이에 쉼표가 있어서 자동형변환이 되지 않아 연산불가
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999') 
--> 숫자를 문자로 바꿨기 때문에 연산이 가능해짐
from dual;

-- 문자를 날짜로 변환
-- ** 문자가 반드시 날짜 형식으로 되어있어야 변환이 가능하다.
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < 19820101;  -- 19820101은 숫자이기 때문에 날짜 데이터와 연산 불가

select *
from emp
where hiredate < to_date('19820101', 'YYYY-MM-DD');

-- NULL데이터 처리
-- NVL(null이 있는 컬럼이름, 바꾸고싶은 데이터)
-- 바꾸고싶은 데이터는 NULL 데이터의 타입과 같은 타입으로 변경해야한다.
--> NVL(숫자,숫자) / NVL(문자,문자)
select ename 사원명, sal, sal * 12 + nvl(comm,0) as 연봉, comm
from emp;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(mgr,'CEO') --> mgr은 숫자타입으로 되어있기 때문에 문자로 바꿀 수 없다.
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') --> mgr을 문자타입으로 변환했기 때문에 데이터 변경이 가능하다.
from emp
where mgr is null;

-- nvl2
-- NVL(null이 있는 컬럼이름, 원하는 값, 원하는 값)
-- null인 경우 뒤에 값 출력, null이 아닌경우 앞에 값 출력
-- 타입일치하지 않아도 됨
select comm, nvl2(comm,'O','X')
from emp;

-- 조건문을 표현하는 함수
-- decode() -> 자바의 switch구문
-- case() -> 자바의 if 문

-- decode(컬럼값,데이터값,바꾸길 원하는값,데이터값,바꾸길 원하는값,...,일치한 경우가 없을 때 반환할 값)
select ename,job,deptno,
    decode(deptno,10,'AAA',20,'BBB',30,'CCC','기타')as 부서명
from emp;

-- case : 범위를 조건으로 설정할 수 있다.
-- case
--    when 조건식 then 실행문
--    when 조건식 then 실행문
--    when 조건식 then 실행문
--    else 조건에 맞지 않을 경우 실행할 실행문
-- end as 별칭

select ename,job,deptno,
    case
    when deptno = 10 then 'AAA'
    when deptno = 20 then 'BBB'
    when deptno = 30 then 'CCC'
    else '기타'
    end as 부서명
from emp;

select ename,job,sal,
    case
    when sal between 3000 and 5000 then '임원'
    when sal >= 2000 and sal < 3000 then '관리자'
    when sal >= 500 and sal < 2000 then '사원'
    else '기타'
    end as 직무
from emp;


-- 2022.10.20


-- 조인(Join)
-- 2개 이상의 테이블에서 데이터를 조회
-- from절에 두개 이상의 테이블을 작성한다
-- where절에 조인 조건을 작성해야한다.
-- 종류
-- cross join(잘 사용하지 않음) : where절 없이 조인
-- equi join : 등가조인. where절에 등가연산자(=)를 사용. 비교할 대상이 없으면 그 데이터는 조회가 안 됨.
-- non equi join : where절에 범위연산자(and,or)를 사용
-- self join : where절에 하나의 테이블을 사용
-- out join : where절에 누락되는 데이터를 같이 조회하기 위해 사용 -> 데이터가 없는 쪽에 (+)를 붙임

-- equi join
select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc --> 어느 테이블에 있는 데이터를 가져오는지 앞에 적어줘야함/컬럼이름이 동일하지 않으면 굳이 적지 않아도 되긴 함.
from emp,dept
where emp.deptno = dept.deptno; --> deptno는 emp,dept테이블에 모두 있기 때문에 꼭 소속을 밝혀줘야함.

select ename,job,e.deptno,dname,loc --> select절에서도 deptno는 두 테이블에 다 있기 때문에 소속을 밝혀야한다.
from emp e,dept d --> 테이블에 별칭을 줘서 테이블 이름을 간략하게 사용할 수 있다. 별칭을 붙이면 테이블의 원래 이름은 사용할 수 없다.
where e.deptno = d.deptno and sal >= 3000;  --> 추가로 다른 조건을 사용할 수 있다. join조건에 해당하는 데이터 중에 추가 조건까지 해당하는 데이터를 조회한다.

-- non equi join
select ename,sal,grade,losal,hisal
from emp e,salgrade s
--where e.sal >= s.losal and e.sal <= s.hisal;
where e.sal between s.losal and s.hisal; --> between을 사용하면 더 간략해진다.

-- 사번, 이름, 급여, 부서번호, 부서명, 급여등급 조회
select empno,ename,sal,d.deptno,dname,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal; --> equi 조인과 non equi조인을 함께 쓸 수 있다.

-- self join
select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m -- 같은 테이블을 가상의 두 데이블로 만든다고 생각. 따라서 반드시 별칭을 부여해야함.
where e.mgr = m.empno;
--> 사원이 14명인데 13명만 조회된 이유 : king은 mgr이 없기 때문에 비교대상에서 제외가 된다.

-- scott과 같은 부서에 근무하는 사원 조회
select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno 
and work.ename = 'SCOTT'    -- scott과 같은 사람만 조회
and friend.ename != 'SCOTT'; -- 본인제외
    
-- 외부조인(out join)
-- 등가시 누락되는 데이터를 같이 조회하기 위해서 사용
select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m -- 반드시 별칭부여
where e.mgr =  m.empno(+); -- 데이터가 없는 테이블 쪽에 (+)를 붙인다.

select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;

-- ANSI join(표준 조인 방식)
-- 종류
-- cross join
-- natural join
-- inner join(equi, non equi,self)
-- outer join --> left, right, full 사용(데이터가 있는 쪽을 지정함)
-- full은 양쪽 모든 누락된 데이터를 조회해준다.
select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno); -- 양쪽 테이블의 컬럼명이 동일하다는 조건에서 사용가능

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno)
where ename = 'SCOTT'; -- 추가조건을 붙일 때 where를 사용한다

--ANSI join으로 self join도 표현 가능
select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

--non equi 표현가능
select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

--out join표현
select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m  -- 데이터가 있는 쪽을 지정한다.
on e.mgr = m.empno;

-- 조건 여러개일 때
select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

-- 일반 조인을 ansi 조인으로 바꾸기
select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;
---->
select ename,sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;

-------------------------------------------------------------------------------
-- p.239~240(ansi join방식으로 풀기)
--1.
select e.deptno,dname,empno,ename,sal
from emp e inner join dept d
on e.deptno = d.deptno
where sal > 2000  --> 추가조건을 붙일 땐 inner join아니고 where
order by deptno;

select d.deptno,d.dname,e.empno,e.ename,e.sal
from emp e inner join dept d
on e.deptno = d.deptno
where e.sal > 2000
order by d.deptno;

--2.
select e.deptno,dname,trunc(avg(sal))as avg_sal,max(sal)as max_sal,min(sal)as min_sal,count(sal)as cnt
from emp e inner join dept d
on e.deptno = d.deptno
group by e.deptno,dname
order by deptno;

select e.deptno,d.dname,trunc(avg(sal))as avg_sal,max(sal)as max_sal,min(sal)as min_sal,count(*)as cnt
from emp e inner join dept d
on e.deptno = d.deptno -- using() : 별칭 사용시 적용이 제한된다.
group by e.deptno,d.dname; --> e.deptno와 d.dname은 일반컬럼이기 때문에 다중행 함수와 사용할 수 없어서 그룹으로 묶어줘야 사용이 가능해진다.

--3.
select d.deptno,dname,empno,ename,job,sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by deptno,dname;

select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno,e.ename;  --> 정렬하는 컬럼 잘 보기!

--4.
select d.deptno,dname,e.empno,e.ename,e.mgr,e.sal,e.deptno,losal,hisal,grade,e.mgr as mgr_empno,e.ename as mgr_ename
from emp e right outer join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by e.deptno,empno;

select d.deptno,d.dname,e.empno,e.ename,e.mgr,e.sal,e.deptno,s.losal,s.hisal,s.grade,m.empno,m.ename
from emp e right outer join dept d
on e.deptno = d.deptno
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by d.deptno, e.empno;

--------------------------------------------------------------------------------
-- 서브쿼리 : sql문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql문 내부에서 사용하는 select 문이다.
-- where절에 select문을 중첩해서 사용

-- 단일행 서브쿼리 : 실행결과가 하나
-- scott사원의 근무지 부서명을 조회
select deptno
from emp
where enmae = 'SCOTT';  -- 20

select dname
from dept
where deptno = 20;
---> 두 문장을 합쳐서 서브쿼리를 만든다.
select dname
from dept
where deptno = (
select deptno
from emp
where ename = 'SCOTT'
);  --> 숫자 20대신 20이 나오는 서브쿼리문을 그대로 작성한다.
                
-- 급여를 가장많이 받는 사원의 이름 조회
-- select ename, max(sal)
-- from emp;
--> 이렇게 표현할 수 없어서 서브쿼리를 사용하여 아래처럼 작성한다.

select ename,sal
from emp
where sal = (select max(sal)
            from emp);

-- DALLAS에서 근무하는 사람의 이름과 부서번호 조회
select ename,deptno
from emp
where deptno = (
select deptno
from dept
where loc = 'DALLAS'
);
                
-- 자신의 직속상관이 KING인 사원의 이름과 급여를 조회
select ename,sal
from emp
where mgr = (
select empno
from emp
where ename = 'KING'
);
            
-- 다중행 서브쿼리 : 실행결과가 여러개
-- 일반 비교연산자 사용안됨
-- in : 결과 중에 하나만 만족하면 된다.
-- >any : 결과 중에 가장 작은값 보다 크면 된다
-- >all : 결과중에 가장 큰값 보다 크면 된다

--in() : 실행결과와 하나라도 일치하면 조회
select *
from emp
where sal in(5000,3000,2850);
--> 서브쿼리문으로 바꾸기

select *
from emp
where sal in(select max(sal)
                from emp
                group by deptno);
                
--any()
select *
from emp
where sal = any(select max(sal)   -- any는 단독으로 쓸 수 없고 부등호를 붙여야한다.
                from emp
                group by deptno);
    
-- all()      
select ename,sal
from emp
where sal > all(select sal      -- 가장 큰 값보다 크면 조회
                from emp
                where deptno = 30);

-- 다중열 서브쿼리 : 서브쿼리의 select절에 비교할 데이터를 여러개 지정하는 방식
select *
from emp
where (deptno,sal) in(select deptno,max(sal)
                        from emp
                        group by deptno);
























