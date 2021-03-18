<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.textbox {position: relative; }
.textbox label {
  position: absolute;
  padding: .8em .5em;  /* input 요소의 padding 값 만큼 */
  color: #999;
  cursor: text;
  text-align: center;
}
.textbox input[type="text"] {
 width: 25%;
  line-height : normal;  /* line-height 초기화 */
  padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
  font-family: inherit;  /* 폰트 상속 */
  border: 1px solid #999;
  border-radius: 0;  /* iSO 둥근모서리 제거 */
  outline-style: none;  /* 포커스시 발생하는 효과 제거를 원한다면 */
  -webkit-appearance: none;  /* 브라우저별 기본 스타일링 제거 */
  -moz-appearance: none;
  appearance: none;
}
#submit{ 
display: block;
    width: 25%;
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 18px;
    text-align: center;
    line-height: 60px;
    cursor: pointer;
    color: #fff;
    background-color:#272525;
    }
    #reset{ 
display: block;
    width: 25%;
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 18px;
    text-align: center;
    line-height: 60px;
    cursor: pointer;
    color: #fff;
    background-color:#272525;
    }
</style>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
   
    	 $("form").on("submit",function(event){		
    		 var userid = $("#userid").val();
    		 var passwd = $("#passwd").val();
    	    		if(userid.length==0){
    	    			alert("userid 필수")
    	    			$("#userid").focus();
    	    			event.preventDefault();
    	    		}else if(passwd.length==0){
    	    			alert("passwd 필수")
    	    			$("#passwd").focus();
    	    			event.preventDefault();
    	    		}
    	    	});
   });
</script> 
<c:if test="${! empty mesg}">
		<script type="text/javascript"> alert("${mesg}") </script>
	</c:if>
<center>
<h3>회원 로그인</h3>

<form action="login" method="get">
<div class="textbox">
<label class="id" title="아이디" for="userid" ></label><input type="text" name="userid" id="userid"  placeholder="아이디"></div>
<br>
<div class="textbox">
<label class="id" title="비밀번호" for="passwd"></label><input type="text" name="passwd" id="passwd" placeholder="비밀번호"></div> 
<input type="submit" value="로그인" id=submit><br>
<input type="reset" value="취소" id=reset>
<a href="idSearch">아이디찾기</a>
<a href="passSearch">비밀번호찾기</a>

</form>
</center>



	
