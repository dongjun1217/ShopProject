<%@page import="com.dto.OrderDTO"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script>
$(document).ready(function(){
	
		
});
</script>
<center>
<table width="70%" cellspacing="0" cellpadding="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td><b>주문정보</b></td>
	</tr>

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center"><b>${oDTO.get(0).userid}</b> 님의 주문 정보입니다.</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b>상품 및 배송정보</b>
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 받으시는 분</td>
					<td class="td_default" height="35"> ${oDTO.get(0).orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 주소</td>
					<td class="td_default" height="35"> (${oDTO.get(0).post})<br>
						${oDTO.get(0).addr1}&nbsp;${oDTO.get(0).addr2}
					</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 휴대전화</td>
					<td class="td_default" height="35"> ${oDTO.get(0).phone}</td>
				</tr>
			</table>
	</tr>
	</td>

	<tr>
		<td height="20">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td width="250" class="td_default" height="35" align="center"><strong>상품명</strong></td>
					<td width="100" class="td_default" height="35" align="center"><strong>판매가</strong></td>
					<td class="td_default" width="50" height="35" align="center"><strong>수량</strong></td>
					<td class="td_default" width="100" height="35" align="center"><strong>합계</strong></td>
				</tr>

				
				
				<tr>
					<td height="35" class="td_default">
						<span class="a_default">${oDTO.get(0).gName}</span>
					</td>
					<td height="35" class="td_default" align="center">
						<span  id = "price1">${oDTO.get(0).gPrice}</span>원
					</td>
					<td height="35" class="td_default" align="center">
						<span id = "num1">${oDTO.get(0).gAmount}</span>
					</td>
					<td height="35" class="td_default" align="center">
						<span>${oDTO.get(0).gPrice*oDTO.get(0).gAmount}</span>원
					</td>
				</tr>
				
				

			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b>결제정보</b></td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 결제금액</td>
					<td class="td_default" height="35" align = 'right'> 
					<input type = 'text' id = 'total' value = '${oDTO.get(0).gPrice*oDTO.get(0).gAmount}' readonly>원
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35"> 결제수단</td>
					<td class="td_default" height="35" align = 'right'> 
					<span>${oDTO.get(0).payMethod}</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	

	<tr>
	<td class="td_default" align="center"><a class="a_default"
			href="main">메인으로이동</a><br><br>
		<a class="a_default"
			href="orderListDetail">주문조회 페이지로 이동</a></td>
	</tr>

	<tr>
		<td height="30">
	</tr>

</table>
</center>