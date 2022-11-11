<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움말</title>
</head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="../CSS/main_style.css">
<script src="/project4/JS/main_java2.js"> </script>
<link rel="stylesheet" href="//project4CSS/main_style.css">
<script src="//project4JS/main_java2.js"> </script>

<link rel="stylesheet" href="/project4/CSS/top.css">
<script src="/project4/JS/main_java2.js"> </script>
<link rel="stylesheet" href="/project4/CSS/top.css">
<script src="/project4JS/main_java2.js"> </script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style type="text/css">
	._131n1yh {
		text-decoration: none;
		color: black;
	}
	
</style>
<body>
<jsp:include page="/include/top.jsp"/>
<br>
<h2 class="fw-bold" align="center">도움말</h2>
<br> <br>
<div class="container text-center">
  <div class="row g-2">
    <div class="col-6">
      <div class="p-3 border bg-light">
	      	<a href="<%=request.getContextPath() %>/311.do" class="_131n1yh">
			<div>
				<div class="t1imbvyv dir dir-ltr"><ins><strong>환불 금액 파악하기</strong></ins></div>
				<div class="QnAStory">대부분의 경우 환불금은 해당 예약에 적용되는 환불 정책과 예약 취소 시점에 따라 결정됩니다. 
				내 예약에 적용되는 환불 정책과 환불금은 숙박 또는 체험 취소 절차를 시작하여 확인하실 수 있습니다. 
				또한, 예약 확정 이메일을 살펴보거나 여행 페이지로 가서…
				</div>
			</div>
		</a>
      </div>
    </div>
    <div class="col-6">
      <div class="p-3 border bg-light">
		<a href="<%=request.getContextPath() %>/1967.do" class="_131n1yh"><div>
			<div class="t1imbvyv dir dir-ltr"><ins><strong>환불액 수령까지 걸리는 시간</strong></ins></div>
				<div class="QnAStory">환불 요건을 충족할 경우, 영업일 기준 10~15일 이내 또는 그보다 더 이른 시일 내에 환불액을 자동으로 수령하실 수 있습니다.</div>
			</div>
		</a>
	</div>
    </div>
    <div class="col-6">
      <div class="p-3 border bg-light">
		<a href="<%=request.getContextPath() %>/3218.do" class="_131n1yh"><div>
			<div class="t1imbvyv dir dir-ltr"><ins><strong>에어커버를 통해 보호받기</strong></ins></div>
				<div class="QnAStory">에어커버는 에어비앤비 게스트를 위한 포괄적인 보호 장치로, 모든 예약에 무료로 적용됩니다. 
				에어커버에는 호스트가 예약을 취소하거나, 숙소 정보가 정확하지 않거나, 
				체크인에 문제가 있을 경우 등에 대비한 보호 장치와 24시간 안전 지원 라인이 포함됩니다…</div>
			</div>
		</a>
	  </div>
    </div>
    <div class="col-6">
      <div class="p-3 border bg-light">
		<a href="<%=request.getContextPath() %>/234.do" class="_131n1yh"><div>
			<div class="t1imbvyv dir dir-ltr"><ins><strong>예약 상태 확인하기</strong></ins></div>
				<div class="QnAStory">예약 상태는 예약 확정 여부 또는 본인 인증 및 후기 작성 필요 여부 등 모든 종류의 최신 정보를 알려줍니다. 
				예약 상태를 확인하려면, 메시지함에서 호스트와 주고받은 메시지를 확인하거나 여행으로 이동해서 여행 계획 더 보기를 클릭하거나 누른 다음 세부…</div>
			</div>
		</a>
	  </div>
    </div>
    <div class="col-6">
      <div class="p-3 border bg-light">
		<a href="<%=request.getContextPath() %>/1370.do" class="_131n1yh"><div>
		<div class="t1imbvyv dir dir-ltr"><ins><strong>환불 요청하기</strong></ins></div>
			<div class="QnAStory">환불 절차가 복잡해선 안 되겠죠. 
			에어비앤비에서는 해결 센터를 통해 간단히 환불을 요청하실 수 있습니다. 
			요청을 보내기 전에 호스트와 메시지를 주고받으며 미리 환불에 대해 합의하시기 바랍니다. 
			때로 호스트와 게스트가 환불과 관련해 합의에 이르지 못하는…</div>
		</div>
		</a>
	  </div>
    </div>
    <div class="col-6">
      <div class="p-3 border bg-light">
      	<a href="<%=request.getContextPath() %>/100.do" class="_131n1yh"><div>
			<div class="t1imbvyv dir dir-ltr"><ins><strong>체크인 안내를 확인하는 방법</strong></ins></div>
				<div class="QnAStory">체크인 정보를 찾고 계시나요? 체크인 정보는 체크인 48시간 전부터 표시됩니다. 
				다른 사람의 에어비앤비 계정을 통해 예약한 경우에는 예약을 진행한 사람의 계정에 체크인 정보가 표시된다는 점에 유의하세요.</div>
			</div>
		</a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/include/bottom.jsp"/>
<script async="" crossorigin="anonymous" src="https://a0.muscache.com/airbnb/static/packages/web/common/frontend/simple-footer/variants/base/FooterBorderless.d93c733a12.js"></script>
<script async="" crossorigin="anonymous" src="https://a0.muscache.com/airbnb/static/packages/web/ko/3b32.f4ccf7537d.js"></script>
<script async="" crossorigin="anonymous" src="https://a0.muscache.com/airbnb/static/packages/web/common/frontend/niobe/minimalist/index.3a334d5b72.js"></script>
<script async="" crossorigin="anonymous" src="https://a0.muscache.com/airbnb/static/packages/web/common/2201.9a01c956e0.js"><script async="" crossorigin="anonymous" src="https://a0.muscache.com/airbnb/static/packages/web/common/frontend/niobe/minimalist/index.3a334d5b72.js"></script>
</body>
</html>