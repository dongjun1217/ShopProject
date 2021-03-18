<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery  시작 -->    
	<style>
#input2 {
  width:60px;
  height:28px;
  font-size:11px;
}
#input3 {
  width:60px;
  height:28px;
  font-size:11px;
}
#email1 {
  width:100px;
  height:28px;
  font-size:11px;
}
#email2 {
  width:100px;
  height:28px;
  font-size:11px;
}
input {
  width:200px;
  height:28px;
  font-size:12px;
}
#submit{ 
display: block;
    width: 270px;
    height:60px;
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
    	 $("#userid").on("keyup",function(){
    		 /////입력 데이터를 서버에 전송해서 중복인지 체크하고 결과 받는다.///////
    		 // http://localhost:8090/aaa/idCheck?id=깂 형식과 비슷한기능
			 $.ajax({
				 url:'idCheck',
				 type:'get',
				 data:{
					 id:$("#userid").val(),
					 pw:'1234'
				 },
				 dataType:'text',  // responseData의 데이터 타입
				 success:function(responseData,status, xhr){
					 console.log("응답:",responseData);
					 $("#result").text(responseData);
				 },
				 error:function(xhr,status,error){}
			 });	    		 
    		 
    		 ///////////
    	 });
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){
   
    	 $("form").on("submit",function(event){		
    		 var userid = $("#userid").val();
    		 var passwd = $("#passwd").val();
    		 var username = $("#username").val();
    		 var post = $("#sample4_postcode").val();
    		 var addr1 = $("#sample4_roadAddress").val();
    		 var addr2 = $("#sample4_jibunAddress").val();
    		 var phone1 = $("#phone1").val();
    		 var phone2 = $("#input2").val();
    		 var phone3 = $("#input3").val();
    		 var email1 = $("#email1").val();
    		 var email2 = $("#email2").val();
    	    		if(userid.length==0){
    	    			alert("아이디를 입력해주세요")
    	    			$("#userid").focus();
    	    			event.preventDefault();
    	    		}else if(passwd.length==0){
    	    			alert("패스워드를 입력해주세요")
    	    			$("#passwd").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(username.length==0){
    	    			alert("이름을 입력해주세요")
    	    			$("#username").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(post.length==0){
    	    			alert("주소를 입력해주세요")
    	    			$("#post").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(addr1.length==0){
    	    			alert("주소를 입력해주세요")
    	    			$("#addr1").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(addr2.length==0){
    	    			alert("주소를 입력해주세요")
    	    			$("#addr2").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(phone1.length==0){
    	    			alert("번호를 입력해주세요")
    	    			$("#phone1").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(phone2.length==0){
    	    			alert("번호를 입력해주세요")
    	    			$("#phone2").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(phone3.length==0){
    	    			alert("번호를 입력해주세요")
    	    			$("#phone3").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(email1.length==0){
    	    			alert("email를 입력해주세요")
    	    			$("#email1").focus();
    	    			event.preventDefault();
    	    		}
    	    		else if(email2.length==0){
    	    			alert("email를 입력해주세요")
    	    			$("#email2").focus();
    	    			event.preventDefault();
    	    		}
    	    	});
   });
</script> 
<!-- jQuery  끝 -->  

<center>
<table border="1" summary="">

<H3>회원 기본정보</h3>
<form action="MemberAdd" method="get">
<tr>
<th >
*아이디:
<input type="text" name="userid" id="userid"><span id="result"></span>
</th>
</tr>
<tr>
<th>*비밀번호:
<input type="text" name="passwd" id="passwd">
</th>
</tr>
<th >
이름:

<input type="text" name="username" id="username">
</th>
</tr>
<tr>
<th>
<input type="text" name="post" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
</th>
</tr>
<tr>
<th>
<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소">

<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소"><span id="guide" style="color:#999"></span>
</th>
</tr>
<tr>
<th >
전화번호:<select name="phone1" id="phone1">
  <option value="010">010</option>
  <option value="011">011</option>
</select>-
<input type="text" name="phone2" id="input2" maxlength="4">-<input type="text" name="phone3" id="input3" maxlength="4">
</th>
</tr>
<tr>
<th >
이메일:<input type="text" name="email1" id="email1" >@
       <input type="text" name="email2" id="email2" placeholder="직접입력">
</th>
</tr>
</table>
<input type="submit" value="회원가입" id="submit">
</center>
</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>