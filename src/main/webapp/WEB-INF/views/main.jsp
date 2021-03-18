<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAPPYSHOP</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script>
/* $(document).ready(function(){
	$('.btn li').click(function(){
	$('.slide li').css({'display':'none'});		
	});
}); */
</script>

<style>
ul,li{padding:0;margin:0;}
li,lo{list-style:none;}
/*슬라이드*/
#slide{position:relative; top:0px; width:100%; height:490px; padding:0; margin:0; }
.a2{position:absolute; width:100%; height:490px; overflow:hidden;}   
.slide{position:relative; width:6400px;}
.slide li{float:left; width:1600px; background-repeat:no-repeat; height:490px; }
.slide li:nth-of-type(1){background-image:url('images/001.png');background-size:1600px 490px;}

.ap2{;}


</style>
<body>
	<c:if test="${! empty mesg}">
		<script type="text/javascript"> alert("${mesg}") </script>
	</c:if>
	<p>
	
	<div class="topArea">
        <h1>               
                <center>&nbsp;<span style="font-size: 19pt">
                <font face="Bell MT"><sup><b>H A P P Y S H O P</b></sup></font>
                </span>
                </center>
        </h1>            
    </div>
	<jsp:include page="common/top.jsp" flush="true" />
	
	<div id="slide">
      <div class="a2">
         <ul class="slide">
            <li></li>
            <li></li>
            <li></li>
         </ul>
    <!--      <ul class="btn">
         <li></li>
         <li></li>
         <li></li>
         </ul> -->
      </div>
   </div>
	<%-- <jsp:include page="common/menu.jsp" flush="true" /> --%>
	<hr>
	<jsp:include page="goods/goodsList.jsp" flush="true" />
	

 
</body>
</html>



