<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크인 안내를 확인하는 방법</title>

<!-- 에어비앤비 -->

<!-- 부트스트랩 -->




<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 제이쿼리? -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- 모달 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<!-- 프로젝트4 -->
<link rel="stylesheet" href="../../CSS/main_style.css">
<script src="../JS/main_java2.js"> </script>

<link rel="stylesheet" href="../../CSS/top.css">
<script src="../JS/main_java2.js"> </script>

<style type="text/css">
	#position {
		top: 300px;
		margin-left: 300px;
		line-height: 2em;
		
		width: 700px;
	}
	
	.cgcsmnv {
		margin-top: 100px;
	}
	
	.nav {
		margin-right: 10px;
	}
	
	.nav-link {
		color: gray;
	}
	
	#main-title {
		font-size: 24px;
		font-weight: bold;
	}
	
	#middle-title {
		font-size: 18px;
		font-weight: bold;
	}
	
	#body_100 {
       color: black;
       margin:0;
       padding: 0;
       box-sizing: border-box;
     }


     h1 {
         padding: 50px 0;
         font-weight: 400;
         text-align: center;}

     p {
         margin: 0 0 20px;
         line-height: 1.5;}

     .main {
         size: 10px;
         background: #ffffff;
     }
     
     section {
            display: none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;
      }

     /*라디오버튼 숨김*/
     .in {
           display: none;
      }

     .lab {
         display: inline-block;
         margin: 0 0 -1px;
         padding: 15px 25px;
         font-weight: 600;
         text-align: center;
         color: #bbb;
         border: 1px solid transparent;
     }

     .lab:hover {
         color: #2e9cdf;
         cursor: pointer;
     }

     /*input 클릭시, label 스타일*/
     .in:checked + .lab {
           color: #555;
           border: 1px solid #ddd;
           border-top: 2px solid #2e9cdf;
           border-bottom: 1px solid #ffffff;
     }

     #tab1:checked ~ .desktop,
     #tab2:checked ~ .ios,
     #tab3:checked ~ .android,
     #tab4:checked ~ .mobile {
      display: block;
     }
</style>
</head>
<body id="body_100">
	<jsp:include page="/include/top.jsp" />
	<div id="position">
		<div class="cgcsmnv">
			<div class="t9s5w55 su0g9gz dir dir-ltr">이용 방법</div>
			<div class="t9s5w55 su0g9gz dir dir-ltr">•</div>
			<div class="t9s5w55 dir dir-ltr">게스트</div>
		</div>
		<div id="main-title">
			<p>체크인 안내를 확인하는 방법<p>
		</div>
		<div>
			<p>체크인 정보를 찾고 계시나요? 체크인 정보는 체크인 48시간 전부터 표시됩니다. 다른 사람의 에어비앤비 계정을 통해 예약한 경우에는 예약을 진행한 사람의 계정에 체크인 정보가 표시된다는 점에 유의하세요.<p>
		</div>
		<div id="middle-title">
			<p>체크인 정보 확인 방법:</p>
		</div>
		<div class="main">	
				<input id="tab1" class="in" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
			    <label class="lab" for="tab1">데스크톱 컴퓨터</label>
			
			    <input id="tab2" class="in" type="radio" name="tabs">
			    <label class="lab" for="tab2">iOS앱</label>
			
			    <input id="tab3" class="in" type="radio" name="tabs">
			    <label class="lab" for="tab3">안드로이드 앱</label>
			
			    <input id="tab4" class="in" type="radio" name="tabs">
			    <label class="lab" for="tab4">모바일 브라우저</label>
		<section class="desktop">
			<ol>
				<li>여행으로 가서 여행 계획 더 보기를 클릭하세요.</li>
				<li>세부정보 보기를 클릭하세요.</li>
				<li>체크인 및 체크아웃으로 가서 체크인 지침을 확인하세요.</li>
			</ol>
		</section>
		
		<section class="ios">
			<ol>
				<li><strong>여행</strong>(<img src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAABYAAAAYCAYAAAD+vg1LAAACA0lEQVR4Xp2VPWtUQRSGjyAYLExCQKKowZCIhVFEQdQfYGNlTCGKvyEgWIhiYQQJKQJB0EIFP2JjYRVIY21nF00TAoKo8QNLP0DfZ2fu5szZu3GzLzww9z0fe2fuzKxZZ9otJjMjIda1Lou/4oV4mMfjRUYXOi9WxQHn7Re/cqwrbRfvxekYsOQRI2fTuimeRNOJGDmb0qD4KoZiwIkYOeR2rDkxHc0akUNuRxoWX8RADNSIHHKp+a8eievB6xP7LE2/N8TIpWZDjYo1scN5By3tgA/iYx6fcHFyqaG2rfjla+6Z/cuBOOa849nb6zxq2r410/xm5VRnLZ22qBmx6J6pobZ2F/F1bwWPY1x3wibEy+BR27JD+Djfxa7gPxcXg4cuiWfBYz/To9+bV6x+yjRYiKalZbgQTUs96NXUW3HSG1k9ltZuj/PYdpy4bc6rdEosVQ+HxMp6rEWcrsfumTvijnuOohc9Gxt8vowV4q2XxTlLH/Kd1b9tJdb+BgMa3y5jLeKa/JmpWzIvejUanxGvyliLtlhqysFgvJHoRc/GRfJHHC7CpVjX1+KHuBdiXkfFJ3MX2FlLfzdHKiOL9X1g6Qbbaukf4424n2NeY+K3pcNTCINLhqlMiafis7hr6QBVYoxHjBxyqeHFeMFa7bS0PnzQq5b+ONuJGDnkUkNtU/8AZV9fm1ljMFIAAAAASUVORK5CYII=" alt="" style="max-width:16px; max-height:18px; width:auto; height:auto; padding-top:2px;">)으로 가세요.</li>
				<li>예정된 여행을 누르세요.</li>
				<li><strong>체크인 및 체크아웃</strong>으로 가서 체크인 지침을 확인하세요.</li>
			</ol>
		</section>
		
		<section class="android">
			<ol>
				<li><strong>여행</strong>(<img src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAABYAAAAYCAYAAAD+vg1LAAACA0lEQVR4Xp2VPWtUQRSGjyAYLExCQKKowZCIhVFEQdQfYGNlTCGKvyEgWIhiYQQJKQJB0EIFP2JjYRVIY21nF00TAoKo8QNLP0DfZ2fu5szZu3GzLzww9z0fe2fuzKxZZ9otJjMjIda1Lou/4oV4mMfjRUYXOi9WxQHn7Re/cqwrbRfvxekYsOQRI2fTuimeRNOJGDmb0qD4KoZiwIkYOeR2rDkxHc0akUNuRxoWX8RADNSIHHKp+a8eievB6xP7LE2/N8TIpWZDjYo1scN5By3tgA/iYx6fcHFyqaG2rfjla+6Z/cuBOOa849nb6zxq2r410/xm5VRnLZ22qBmx6J6pobZ2F/F1bwWPY1x3wibEy+BR27JD+Djfxa7gPxcXg4cuiWfBYz/To9+bV6x+yjRYiKalZbgQTUs96NXUW3HSG1k9ltZuj/PYdpy4bc6rdEosVQ+HxMp6rEWcrsfumTvijnuOohc9Gxt8vowV4q2XxTlLH/Kd1b9tJdb+BgMa3y5jLeKa/JmpWzIvejUanxGvyliLtlhqysFgvJHoRc/GRfJHHC7CpVjX1+KHuBdiXkfFJ3MX2FlLfzdHKiOL9X1g6Qbbaukf4424n2NeY+K3pcNTCINLhqlMiafis7hr6QBVYoxHjBxyqeHFeMFa7bS0PnzQq5b+ONuJGDnkUkNtU/8AZV9fm1ljMFIAAAAASUVORK5CYII=" alt="" style="max-width:16px; max-height:18px; width:auto; height:auto; padding-top:2px;">)으로 가세요.</li>
				<li>예정된 여행을 누르세요.</li>
				<li><strong>체크인 및 체크아웃</strong>으로 가서 체크인 지침을 확인하세요.</li>
			</ol>
		</section>
		
		<section class="mobile">
			<ol>
				<li><strong>여행</strong>(<img src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAABYAAAAYCAYAAAD+vg1LAAACA0lEQVR4Xp2VPWtUQRSGjyAYLExCQKKowZCIhVFEQdQfYGNlTCGKvyEgWIhiYQQJKQJB0EIFP2JjYRVIY21nF00TAoKo8QNLP0DfZ2fu5szZu3GzLzww9z0fe2fuzKxZZ9otJjMjIda1Lou/4oV4mMfjRUYXOi9WxQHn7Re/cqwrbRfvxekYsOQRI2fTuimeRNOJGDmb0qD4KoZiwIkYOeR2rDkxHc0akUNuRxoWX8RADNSIHHKp+a8eievB6xP7LE2/N8TIpWZDjYo1scN5By3tgA/iYx6fcHFyqaG2rfjla+6Z/cuBOOa849nb6zxq2r410/xm5VRnLZ22qBmx6J6pobZ2F/F1bwWPY1x3wibEy+BR27JD+Djfxa7gPxcXg4cuiWfBYz/To9+bV6x+yjRYiKalZbgQTUs96NXUW3HSG1k9ltZuj/PYdpy4bc6rdEosVQ+HxMp6rEWcrsfumTvijnuOohc9Gxt8vowV4q2XxTlLH/Kd1b9tJdb+BgMa3y5jLeKa/JmpWzIvejUanxGvyliLtlhqysFgvJHoRc/GRfJHHC7CpVjX1+KHuBdiXkfFJ3MX2FlLfzdHKiOL9X1g6Qbbaukf4424n2NeY+K3pcNTCINLhqlMiafis7hr6QBVYoxHjBxyqeHFeMFa7bS0PnzQq5b+ONuJGDnkUkNtU/8AZV9fm1ljMFIAAAAASUVORK5CYII=" alt="" style="max-width:16px; max-height:18px; width:auto; height:auto; padding-top:2px;">)으로 가세요.</li>
				<li>예정된 여행을 누르세요.</li>
				<li><strong>체크인 및 체크아웃</strong>으로 가서 체크인 지침을 확인하세요.</li>
			</ol>
		</section>
		</div>
		<br>
		<p>체크인 안내가 포함된 메시지를 보내드리니 이메일과 에어비앤비 메시지함을 꼭 확인하세요.</p>
		<br>
		<p>체크인까지 48시간이 채 남지 않은 상태에서 체크인 정보를 확인할 수 없다면 호스트에게 메시지를 보내 정보를 요청하세요.<p>
	</div>
	
	
	<jsp:include page="/include/bottom.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" crossorigin="anonymous" href="https://a0.muscache.com/airbnb/static/packages/web/common/72f46196c8.css" media="all">
</body>
</html>