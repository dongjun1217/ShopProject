<%@page import="com.dto.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
button {
	display: block;
	width: 220px;
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 18px;
	text-align: center;
	cursor: pointer;
	color: #FFFFFF;
	background-color: #CCCCCC;
}
</style>
<%-- <%
   String mesg = (String)session.getAttribute("mesg");
  if(mesg!=null){
%>    
   <script>
     alert('<%=mesg %>');
   </script>
<%
  }
  session.removeAttribute("mesg");
%>     --%>
<c:if test="${! empty mesg}">
	<script type="text/javascript">
		alert("${mesg}")
	</script>
</c:if>




<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#cart").on("click", function() {
			var gSize = $("#gSize").val();
			var gColor = $("#gColor").val();
			var gAmount =$("#gAmount").val();
			if (gSize == "사이즈선택") {
				alert("사이즈선택")
				event.preventDefault();
			} else if (gColor == "색상선택") {
				alert("색상필수")
				event.preventDefault();
			} else if(gAmount<1){
				alert("주문수량이 1보다 작을 수 없습니다.")
				event.preventDefault();
			} 
			else {
				$("form").attr("action", "goodsCart");
			}
		});

		$("#buy").on("click", function() {
			var gSize = $("#gSize").val();
			var gColor = $("#gColor").val();
			var gAmount =$("#gAmount").val();
			if (gSize == "사이즈선택") {
				alert("사이즈선택")
				event.preventDefault();
			} else if (gColor == "색상선택") {
				alert("색상필수")
				event.preventDefault();
			} else if(gAmount<1){
				alert("주문수량이 1보다 작을 수 없습니다.")
				event.preventDefault();
			} 
			else {
				$("form").attr("action", "buyCart");
			}
		});
		
	});
	
	
</script>



<form name="goodRetrieveForm" method="GET" action="#">
	<input type="hidden" name="gImage" value="${goodsRetrieve.gImage}">
	<input type="hidden" name="gCode" value="${goodsRetrieve.gCode}">
	<input type="hidden" name="gName" value="${goodsRetrieve.gName}">
	<input type="hidden" name="gPrice" value="${goodsRetrieve.gPrice}">

	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="7"><img
							src="images/items/${goodsRetrieve.gImage}.gif" border="0"
							align="center" width="300" /></td>
						<td class="td_title">제품코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
							${goodsRetrieve.gCode}</td>
					</tr>
					<tr>
						<td class="td_title">상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${goodsRetrieve.gName}</td>
					</tr>
					<tr>
						<td class="td_title">가격</td>

						<td class="td_red" colspan="2" style='padding-left: 30px'>
							${goodsRetrieve.gPrice}</td>
					</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>
					</tr>
					<tr>
						<td class="td_title" rowspan="2">상품옵션</td>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="gSize" id="gSize">
								<option selected value="사이즈선택">사이즈선택</option>
								<option value="L">L</option>
								<option value="M">M</option>
								<option value="S">S</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" style='padding-left: 30px'><select
							class="select_change" size="1" name="gColor" id="gColor">
								<option selected value="색상선택">색상선택</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
						</select></td>
					</tr>

					<tr>
						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px"><input type="text"
							name="gAmount" value="1" id="gAmount"
							style="text-align: right; height: 18px">
					</tr>
				</table>

			</td>
		</tr>
		<tr>
			<th align="center">
				<button id="buy">구매</button> &nbsp;&nbsp;
				<button id="cart">장바구니</button>
			</th>
		</tr>
	</table>

</form>

