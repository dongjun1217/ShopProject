<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${! empty mesg}">
		<script type="text/javascript"> alert("${mesg}") </script>
	</c:if> 
	<style>
#input2 {
  width:60px;
  height:28px;
  font-size:11px;
}
#email {
  width:100px;
  height:28px;
  font-size:11px;
}
#email2 {
  width:100px;
  height:28px;
  font-size:11px;
}
#submit{ 
display: block;
    width: 270px;
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
<center>
	<table border="1">
<form action="idSearch2" method="get">
<h3>아이디찾기</h3>
 <tr> 
 <th>
 <input type="text" name="username" placeholder="이름">
 </th>
  </tr>
  <tr><th>
 휴대폰<select name="phone1">
       <option value="011">011</option>
       <option value="010">010</option>
     </select>-
      <input type="text" name="phone2" maxlength="4" width=60 height=28 id="input2">-
      <input type="text" name="phone3" maxlength="4" id="input2">
      </th>
      </tr>
      <tr>
      <th>
이메일<input type="text"  name="email1"id="email" >@
     <input type="text"  name="email2" id="email2" placeholder="직접 입력" >
     </th>
     </tr>
     </table>
   <input type="submit" value="찾기" id="submit">  
</center>
</form>

