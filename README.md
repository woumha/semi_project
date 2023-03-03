
----수정중--


숙소 예약 사이트

개발기간 : 22.10.18 ~ 22.11.14

개발목표 : 이메일을 통한 회원가입, 로그인을 통해 사용자에게 숙소 정보들과 예약, 결제, 리뷰, 편의기능을 제공하는 사이트가 목표입니다.

개발환경 : 

사용언어 및 도구 : Html, CSS, JavaScript, JSP

개발툴 : eclipse

DBMS: OracleDB

협업툴: Github

-----------------------------------------------------------------------

프로젝트 담당역할 : 메인 페이지, 상단 메뉴, Github 통합 및 관리


구현한 기능 :

- DB에 저장된 숙소 데이터들을 메인화면에 대표사진, 숙소정보, 별점들을 리스트 형식으로 사용자에게 보여주는 메인 페이지를 구현하였습니다.

- 상단의 카테고리와 필터기능으로 원하는 숙소종류 및 순서로 숙소를 확인할 수 있으며, 옵션별로 숙소를 확인 할 수 있습니다.

&nbsp;![1_1](https://user-images.githubusercontent.com/93087571/222812744-848363e9-a910-4b13-8695-1257a7420c49.png)

<br/>
<br/>
<br/>
<br/>
<br/>




- 화면 오른쪽 상단 필터 버튼을 클릭하게 되면 숙소 종류, 인원, 가격을 옵션에 맞춰 선택해
  조건에 맞는 숙소 리스트를 화면에 띄울 수 있습니다.
  
- 선택하지 않은 옵션은 굳이 클릭하지 않고 놔둬도 알아서 전체로 검색하게 기능이 작동합니다. 

&nbsp;![1_5](https://user-images.githubusercontent.com/93087571/222813054-0b34c054-bd90-408f-abcf-ed7d05d3ec06.png)


<br/>
<br/>
<br/>
<br/>
<br/>




- 항상 화면 최상단에 있는 '숙소 호스팅하기' 버튼을 클릭 시, 로그인 중이 아니라면 로그인 모달창이 뜨고,
  로그인 중이라면 현재 로그인 되어있는 회원이 등록한 숙소가 나오는 호스팅 페이지로 이동하게 됩니다.
  
&nbsp;![1_3](https://user-images.githubusercontent.com/93087571/222813029-bc95d4ea-0aea-48ce-a4fb-091ec29bbf12.png)


<br/>
<br/>
<br/>
<br/>
<br/>



  
- 호스팅 페이지에서는 로그인 한 사용자가 등록한 숙소목록을 확인 할 수 있으며, 새로운 숙소 등록, 수정, 삭제도 가능합니다.
- 
- 지도api를 이용하여 숙소 등록 시 숙소의 위치를 시각적으로 고객들에게 보여줄 수 있게 하였으며,
  수정 시에도 간단한 클릭만으로 지도위치를 수정할 수 있습니다.
  
&nbsp;![1_2](https://user-images.githubusercontent.com/93087571/222812843-e1f891b5-9f2a-4bda-96e4-ba62b1a9f241.png)
  

  
<br/>
<br/>
<br/>
<br/>
<br/>

