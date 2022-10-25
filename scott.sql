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
where sal = (
select max(sal)
from emp
);

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
where sal in(
select max(sal)
from emp
group by deptno
);
                
--any()
select *
from emp
where sal = any(
select max(sal)   -- any는 단독으로 쓸 수 없고 부등호를 붙여야한다.
from emp
group by deptno
);
    
-- all()      
select ename,sal
from emp
where sal > all(
select sal      -- 가장 큰 값보다 크면 조회
from emp
where deptno = 30
);

-- 다중열 서브쿼리 : 서브쿼리의 select절에 비교할 데이터를 여러개 지정하는 방식
select *
from emp
where (deptno,sal) in(
select deptno,max(sal)
from emp
group by deptno
);


-- 2022.10.21


-- DML(데이터조작어) : insert, update, delete

-- insert : 테이블에 데이터 삽입
-- insert into 테이블명 ( 컬럼명1,컬럼명2,...)
-- values (값1,값2,...)
-- 컬럼과 값의 타입과 갯수가 일치해야 한다
-- 작성 순서대로 1 : 1 매칭해야된다

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp (deptno,dname,loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp -- 컬럼생략
values (70,'HTML','SEOUL');

insert into dept_temp -- 컬럼생략, 명시적 null 데이터 삽입
values (80,'HTTP',null);

insert into dept_temp (deptno,dname)-- 묵시적 null 데이터 삽입
values (60,'JSP');

create table emp_temp -- 데이터를 없애고 컬럼만 가져온다
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (9999,'홍길동','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3111,'심청이','MANAGER',9999,sysdate,4000,null,30);

-- update : 컬럼의 데이터를 변경(수정)
-- update 테이블명
-- set 컬럼명 = 값, 컬럼명 = 값, ...
-- where 조건식
-- 조건절을 사용하지 않으면 해당 컬럼이 모두 변경된다

-- 오타가나서 수정했다
-- update emp_temp
-- set job = 'MANAGER'
-- where ename = '심청이';

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL'; -- where절을 안썼기때문에 모든 loc이 수정된다

drop table dept_temp2; -- 테이블 삭제

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;

-- delete(데이터 삭제)
-- delete from 테이블명
-- where 조건식
-- 조건절을 사용하지 않으면 모든 절이 삭제됨

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2; -- 데이터 전체삭제

delete from emp_temp2
where ename = 'SCOTT'; -- SCOTT이라는 사람의 데이터만 삭제

-- TCL(데이터의 영구저장 또는 취소)
-- 트랜잭션
-- commit, rollback, savepoint
-- commit : 데이터 영구 저장(테이블이 데이터 반영)
--          create구문을 사용해서 객체생성할때(자동)
--          developer 에서는 commit을 해줘야 외부에서도 보인다
-- rollback : 데이터 변경 취소(테이블이 테이터 미반영) 원상복귀
--            천재지변,전기,전쟁(자동)
--            commit 이후에는 롤백이 안된다

create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01;

drop table dept01;

-- commit;
rollback;

create table dept02
as
select * from dept;

select *
from dept02;

drop table dept02;

-- 트랜잭션 적용 유무

delete from dept02;

truncate table dept02; -- truncate 영구삭제(데이터를 삭제하자마자 자동commit이 발생)

-- DDL(데이터 정의어) : table(모든객체)를 생성, 삭제, 변경하는 명령어
-- create(생성), alter(변경), drop(삭제)

-- create table 테이블명( -- table(객체)
-- 컬럼명1 타입,          -- column(속성)
-- 컬럼명2 타입,
-- 컬럼명3 타입
-- );

create table emp_ddl(
-- 사번,이름,직책,관리자,입사일,급여,성과금,부서번호
empno number(4),
ename varchar2(10), -- 크기는 byte
job varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2), -- 7자리중 2자리를 소수점으로 사용 실질적인 정수는 5자리
comm number(7,2),
deptno number(2)
);

select *
from emp_ddl;

insert into emp_ddl
values (9999,'이순신','MANAGER',1111,sysdate,1000,null,10);

create table dept_ddl -- 테이블의 복사(원본보호 및 사본테스트용)
as
select * from dept;

create table dept_30
as
select * from dept
where deptno = 30;

select *
from dept_30;

create table dept_m
as
select dname,loc 
from dept;

select *
from dept_m;

create table dept_d
as
select * from dept
where 1 != 1; -- 테이블의 구조만 복사한다

select *
from dept_d;

-- 테이블 변경(컬럼의 정보수정)
-- 새로운 컬럼추가, 컬럼의 이름변경, 자료형의 변경, 컬럼을 삭제
-- add, rename, modify, drop
-- alter

create table emp_alter
as
select * from emp;

select *
from emp_alter;

alter table emp_alter
add address varchar2(100);

alter table emp_alter
rename column address to addr;

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

-- 테이블삭제 DROP
-- drop table 테이블명


-- ex 01
create table emp_hw (
empno number(4),
ename varchar2(10),
job varchar2(9),
mgr varchar2(4),
hiredate date,
sal number(7,2),
comm number(7,2),
deptno number(2)
);

-- ex 02
alter table emp_hw
add bingo varchar2(20);

-- ex 03
alter table emp_hw
modify bingo varchar2(30);

-- ex 04
alter table emp_hw
rename column bingo to remark;

-- ex 05
insert into emp_hw
select empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

-- ex 06
drop table emp_hw;

-- 데이터 사전
desc user_tables;

select table_name -- 유저의 테이블정리
from user_tables;

select table_name -- 전체 테이블출력
from all_tables;

select owner,table_name -- 테이블의 주인
from all_tables;

-- index(검색속도를 향상하기위해 사용하는 객체)
-- create, drop
-- select 구문의 검속을 향상시킨다
-- 전체 레코드의 3~5%정도일때 index객체를 컬럼에 생성해서 사용한다

-- create index 인덱스명
-- on 테이블명(컬럼명)

create table emp01
as
select * from emp;

select *
from emp01;

insert into emp01
select * from emp01;

drop table emp01;

insert into emp01(empno,ename)
values (1111,'bts');

-- index 객체 생성전
select empno,ename
from emp01
where ename = 'bts';

-- index 객체 생성후
create index idx_emp01_ename
on emp01(ename);

drop index idx_emp01_ename;

-- 테이블 삭제후 원상복구
show recyclebin; -- 삭제한리스트보기(휴지통)

-- flashback table 테이블명_alter 휴지통에서 파일로 복구하기
-- to before drop;

purge recyclebin; -- 휴지통 비우기

-- 제약조건(무결성) : 잘못된 값이 데이터로 사용되는걸 못하게 하는 것
-- not null (null을 혀용하지않음)
-- unique (중복을 허용하지않음 단, null값은 예외)
-- primary key (기본키 - 유일하게 구분을 할 수 있게끔 값을 지정한다 null값과 중복이 불가능함)
-- foreign key (외래키/참조키) (foreign key라 쓰면 안되고 references로 써야만 한다)
-- 1. 부모와 자식의 관계를 가지는 자식쪽 테이블에 컬럼에 설정한다
-- 2. 부모쪽 테이블의 컬럼은 반드시 primary key 또는 unique 해야한다
-- check
-- default

-- emp,dept

-- insert into emp / 무결성 제약조건이 위배(부모키가 없음) 
-- values (1111,'aaa','MANAGE','9999',sysdate,1000,null,50);

drop table emp02;

create table emp02(
empno number(4)constraint emp02_empno_pk primary key, -- not null unique 로 null을 허용도 안하면서 중복을 불가시킨다 - 둘다 합치면 primary key가 된다
ename varchar2(10)not null,
job varchar2(9),
deptno number(2)
);

-- not null 이라는 null값을 허용하지 않기에 null을 넣으면 오류가 생긴다
insert into emp02
values (null,null,'MANAGER',30);

insert into emp02
values (1111,'홍길동','MANAGER',30);

insert into emp02
values (1111,'이순신','MANAGER',20);

insert into emp02
values (null,'김유신','SA:ESMAN',20);

select *
from emp02;


-- 2022.10.24


-- 테이블의 복사는 프라이머리 같은 것들은 따라오지 않으므로 직접 만들어야하는 경우도 있다

create table emp03 (
empno number(4) constraint emp03_empno_pk primary key,
ename varchar2(9) constraint emp03_empno_nn not null,
job varchar2(9),
deptno number(2) constraint emp03_deptno_fk references dept03(deptno) -- 이것만 만들면 부모테이블을 먼저 만들고 자식테이블을 나중에 맞춘다
);

create table dept03(
deptno number(2) constraint dept03_deptno_pk primary key,
dname varchar2(20) constraint dept03_dname_nn not null,
loc varchar2(20) constraint dept03_loc_nn not null
);

drop table dept03;

insert into detp03
select * from dept;

insert into emp03
select empno,ename,job,deptno from emp;

insert into emp03
values (1111,'aaa','MANAGE',50);

create table emp04 (
empno number(4) primary key,
ename varchar2(10)not null,
sal number(7)constraint emp04_sal_ck check(sal between 500 and 5000), -- 500과 5000사이의 값만 넣을 수 있다
gender varchar2(2) constraint emp04_gender_ck check(gender in('M','F')) --  M 과 F만 넣을 수 있게 설정되었다
);
-- constraint 를 쓰는이유는 제약조건 위배에대한 설명이다

select * from emp04;

insert into emp04
values(1111,'hong',1000,'M');

insert into emp04
values(2222,'hong',200,'M');

insert into emp04
values(3333,'hong',1000,'A');

create table dept04(
deptno number(2) primary key,
dname varchar2(10) not null,
loc varchar2(15) default 'SEOUL' -- 기본값이 null로 되는게 아니라 'SEOUL'로 대체되는 디폴트 값을 생성
);

select * from dept04;

insert into dept04(deptno,dname)
values(10,'SALES');

insert into dept04(deptno,dname,loc)
values(20,'SALES','BUSAN');

-- 제약조건 설정방식
-- 컬럼레벨의 설정 (not null은 컬럼 레벨에서만 적용가능하다)
-- 테이블 레벨의 설정 (not null을 적용 할 수 없다)

create table emp05(
empno number(4),
ename varchar2(20) constraint emp05_ename_nn not null,
job varchar2(20),
deptno number(20),

constraint emp05_empno_pk primary key(empno),
constraint emp_05_job_uk unique(job),
constraint emp_05_deptno_fk foreign key(deptno) references dept(deptno)
-- 원래라면 foreign key라 쓰면 안되고 references로 쓰지만
-- 테이블 레벨의 설정에서는 foreign key라 쓰고 그이후에 references로 쓴다)
);

insert into emp05
values(3333,'hong','PRESIDENT',80);

-- 복합키(기본키를 두개의 컬럼을 사용하는 경우)
-- 테이블 레벨 방식으로만 적용가능
-- 1. 테이블안에서 정리하는 방식
-- 2. Alter 명령어 사용하는 방식

create table member(
name varchar2(10),
address varchar2(30),
hphone varchar2(10),

constraint member_name_adress_pk primary key(name,address)
);

create table emp06 (
empno number(4),
ename varchar2(20),
job varchar2(20),
deptno number(20)
);

alter table emp06
add constraint emp06_empno_pk primary key(empno);

alter table emp06
add constraint emp06_empno_fk foreign key(deptno) references dept(deptno);

-- not null은 변경의 개념(null -> not null)
-- 컬럼을 주는 위치가 앞이다
alter table emp06
modify job constraint emp06_job_nn not null;

alter table emp06
modify ename constraint emp06_ename_nn not null;

-- drop 제약조건명(constraint) 또는 제약조건(primary key)
-- 제약 조건명을 써주는게 가장 안전하다(제약조건을 할 시에 전체가 삭제가 될 위험이 있다)
alter table emp06
drop constraint emp06_empno_pk;

create table emp07 ( -- 1번
empno number(4),
ename varchar2(20),
job varchar2(20),
deptno number(20)
);

alter table emp07
add constraint emp07_empno_pk primary key(empno); -- 2번

alter table emp07
add constraint emp07_empno_fk foreign key(deptno) references dept07(deptno); -- 맨마지막 5번

create table dept07( -- 3번
deptno number(2),
dname varchar2(10),
loc varchar2(15)
);

alter table dept07 -- 4번
add constraint dept07_deptno_pk primary key(deptno);

insert into dept07
select* from dept;

insert into emp07
select empno,ename,job,deptno
from emp;

delete from dept07
where deptno = 10; -- 자식 레코드가 발견이 되었기떄문에 부모 레코드를 지울 수 없다

-- alter table dept07
-- disable primary key cascade; 비활성화를 시켜 부모 레코드를 지울수 있다 

-- alter table dept07
-- drop primary key; -- 자식레코드가 아직 있기때문에 지울 수 없다

-- alter table dept07
-- drop primary key cascade; -- 제약 조건을 삭제 시킨다

--p.394 테이블레벨 설정 방식으로 풀기
-- 1. dept_const 테이블
create table dept_const(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13)
);

alter table dept_const
add constraint deptconst_deptno_pk primary key(deptno);

alter table dept_const
add constraint deptconst_daname_unq unique(dname);

alter table dept_const
modify loc constraint deptconst_loc_nn not null;

-- 2. emp_const테이블
create table emp_const(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

alter table emp_const
add constraint empconst_empno_pk primary key(empno);

alter table emp_const
modify ename constraint empconst_empno_nn not null;

alter table emp_const
add constraint empconst_tel_unq unique(tel);

alter table emp_const
add constraint empconst_sal_chk check(sal between 1000 and 9999);

alter table emp_const
add constraint empconst_deptno_fk foreign key(deptno) references dept_const(deptno);

--------------------------------------------------------------------------------
-- 뷰(p.338)--
-- 객체(=create 명령어를 활용하여 만들어서 사용하는 것) : table, index, view
-- create or replace view 뷰테이블명([alias])
-- as
-- 서브쿼리(select)
-- [with chect option]
-- [with read only]
-- 단순뷰 : 서브쿼리에 테이블 한개만 사용
-- 복합뷰 : 서브쿼리에 테이블 여러개 사용

create table dept_copy
as
select * from dept;

create table emp_copy  -- 복사되는 테이블은 제약조건이 넘어오지 않는다
as
select * from emp;

alter table emp_copy  -- 제약조건 추가
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * from emp_copy;  -- 14개의 데이터가 조회됨

-- 30번 부서만 조회
create or replace view emp_view30
as
select empno,ename,sal,deptno from emp_copy
where deptno = 30;
--> "권한이 불충분합니다"가 뜨면 시스템계정에서 scott에 대한 view생성 제한을 풀어줘야함

select * from emp_view30;

insert into emp_view30 -- 데이터 삽입 가능. 그러나 실제 데이터 처리는 원본 테이블에서 일어난다.
values(1111,'hong',1000,30);

select * from emp_copy; 

insert into emp_view30(empno,ename,sal) -- foreign key 제약조건은 null을 허용하기 때문에 데이터 삽입이 가능하다
values(2222,'hong',2000);

insert into emp_view30(empno,ename,sal,deptno) -- 원본테이블의 foreign key 제약조건에 위배되기 때문에 데이터 삽입이 불가능하다
values(2222,'hong',2000,50);

-- 별칭 부여
create or replace view emp_view(사원번호,사원명,급여,부서번호)
as
select empno,ename,sal,deptno from emp_copy;

select * from emp_view;

select * from emp_view
where 부서번호 = 20;  -- 지정한 별칭으로 검색해야함
-- where deptno = 20;  >> error. 원본테이블의 컬럼명은 사용불가

-- 복합뷰
create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

-- 문제 : 부서별 최소 급여와 최대급여를 뷰를 만들어 조회하기
-- dname, min_sal, max_sal
create or replace view sal_view
as
select dname,min(sal) as min_sal,max(sal) as max_sal -- as를 사용하여 별칭을 줘도 됨
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
group by d.dname;

select * from sal_view;


-- 2022.10.25


-- 모든 객체의 이름은 중복될 수 없다

-- [with chect option]
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; -- 조건절의 컬럼을 수정하지 못하게 한다

update view_chk30
set deptno = 10;
-- 뷰의 with check option의 조건에 위배 됩니다

-- [with read only]
create or replace view view_read30
as 
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only; -- 모든 컬럼에 대한 C U D 가 불가능

update view_read30
set deptno = 10;
-- 읽기전용 뷰에서는 DML작업을 수행할 수 없습니다(insert, update, delete)

-- 뷰의 활용
-- TOP - N 조회하기
-- rownum
select * from emp;

-- 입사일이 가장 빠른 5명의 사원을 조회
select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01';

select rownum,empno,ename,hiredate
from emp
where rownum <= 5;

select rownum,empno,ename,hiredate 
from emp
order by hiredate asc;
-- rownum이 먼저 실행이 되고 order by가 맨마지막에 실행이 되기떄문에 숫자가 섞인다(어긋난다)
-- 그러므로 차라리 rownum만 쓰는걸 추천한다

-- 차라리 order by를 쓸거면 view를 쓰는게 낫다
create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select * from view_hiredate;

-- 근데 한번 정렬된 view에 rownum을 쓴다면 번호가 제대로 나온다
select rownum,empno,ename,hiredate
from view_hiredate;

-- rownum으로 인한 숫자 범위
select rownum,empno,ename,hiredate
from view_hiredate
where rownum <= 7;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum between 2 and 5; -- rownum은 조건절에 직접 사용시 1을 포함하는 조건식을 만들어야 한다

-- 그러므로 뷰테이블을 다시 만들어 rownum을 컬럼화해야한다
create or replace view view_hiredate_rm
as
select rownum rm,empno,ename,hiredate -- rownum을 할당시켜줄려면 별칭을 붙여 컬럼화(인식?권한?)를 시켜줘야한다
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm between 2 and 5;

-- 인라인 뷰
select rm,empno,ename,hiredate
from(
select rownum rm, empno,ename,hiredate
from(
select empno,ename,hiredate
from emp
order by hiredate asc
) -- a테이블
)
where rm >=2 and rm <= 5; -- b테이블
-- 위 아래 서로 결과값이 같다
select rm,b.*
from(
select rownum rm,a.*
from(
select empno,ename,hiredate
from emp
order by hiredate asc
)a -- a테이블
)b -- b테이블
where rm >=2 and rm <= 5;

-- 입사일이 가장 빠른 5명을 조회하세요
-- 인라인뷰
select rownum,empno,ename,hiredate 
from(
select empno,ename,hiredate
from emp
order by hiredate asc
)
where rownum <= 5;

-- 시퀀스 객체
-- 자동으로 번호를 증가시키는 기능을 수행한다
-- create, drop

-- create sequence 시퀀스명
-- start with 시작값
-- increment by 증가치
-- maxvalue 최대값 => 10의 1027제곱
-- minvalue 최대값 => 10의 -1027제곱

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.currval -- 확인용
from dual;

select dept_deptno_seq.nextval -- 다음값을 출력
from dual;

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000;

drop table emp01;

create table emp01
as 
select empno,ename,hiredate from emp
where 1 != 1;

select * from emp01;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);























































































