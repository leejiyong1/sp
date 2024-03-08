springproject
==================
## project environment
JDK jdk-11.0.18 <br>
sts-3.9.17.RELEASE <br>
apache-tomcat-9.0.83 (port 9090)<br>
oracleDB 11.2.0.2.0 (port 1521)<br>

백엔드 최종 프로젝트
==============

프로젝트 계획(31일간)
==============
    기획+툴 숙련	  7±1
    코딩		    15±5
    테스트 	    2±1
    PPT,문서작성    3±1

Util
===========
## 워크플로우 
	Github Projects
## 커뮤니티
	Slack
## 형상관리
	Git,Github,Gitkraken		
## API 관리
	Gitbook,(Swagger)
## DB ERD
	dbiagram.io
## 아키텍쳐	
	draw.io
## HTTP
	Postman
## DBMS
	DBeaver

# Back-end
	Spring legacy jdk11
	JSP
	OracleDB
	Mybatis
	Maven	

# Front-end
	HTML,CSS,BootStrap,(Figma)

# 프로젝트기획 (게시판+@)
	고양이 자랑 페이지(@동영상을 추가?등등)
	가격비교사이트

API
=============
	https://dev-coco.tistory.com/111
	로그인
	Security
	페이징
	게시판 CRUD기능
	유효성체크,중복체크
	댓글
	조회수(오늘의 핫이슈)
	메뉴바
	관리자창
	+@ 실시간알림
	+@ OAhth
	+@ 공공API
	+@ 세션JWT
	+@ 검색

Dev컨벤션
==============
	패키지명 :전부 소문자로 되도록 짧게 작성
	클래스명 :맨앞글자는 대문자로, 하이픈은 사용하지않음,ex)newForm
	컨트롤러 :view와 model을 이어주는 역할만, 비즈니스로직은 전부 서비스패키지로 옮기기
	컨트롤러 :수동으로 등록한다
	테스트코드작성 : 각자 재량
	DI : 생성자
	
도메인작성법
===============
	열람테이블명 + function
	https://velog.io/@somday/RESTful-API-%EC%9D%B4%EB%9E%80

0118 오늘 해볼것들
===================
	git 사용해보기(add,commit,push,fetch,pull,merge,branch)
	github 계정생성(아이디 알려주기)
	gitkraken 사용해보기
	프로젝트 뭐할지 구상해보기
	보완,변경,추천할 부분 생각해보기

내일할것들?
================
	툴들 각자 하나씩 맡아서 기능들 알아보기
	프로젝트 구체화
	사용해볼 공공API 찾아보기
	이슈해결 기록


주요 기능정의
==============
## 계정기능
	마이페이지, 개인설정, 로그인, 회원가입, 관리자
## 메인
	카테고리, 컴포넌트 정리, 화장품관련 정보들(핫아이템? 등등)
## 게시판,검색기능
	상품, 검색, 댓글대댓글, 
## 얼굴인식 
	얼굴인식을 한다음에 나에게 맞는 추천상품을 보려면 가입,
## (얼굴인식 기반) 화장품추천
	화장품 데이터 수집, 조회수기반,
파트분배
=============
지용
+ 카테고리, 검색

호연
+ 게시판, 대댓글

현민
+ 관리자페이지

용재
+ 얼굴인식, 추천

경재
+ 로그인,회원가입

	
