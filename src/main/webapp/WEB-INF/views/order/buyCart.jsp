<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//수정버튼
		$(".updateBtn").on("click", function() {
			var num = $(this).attr("data-xxx");//클릭된 버튼
			var gAmount = $("#cartAmount" + num).val();
			var gPrice = $(this).attr("data-price");
			$.ajax({
				url : 'cartUpdate',
				type : 'get',
				dataType : 'text',
				data : {
					num : num,
					gAmount : gAmount
				},
				success : function(data, status, xhr) {
					var sum = gAmount * gPrice;
					$("#sum" + num).text(sum);
				},
				error : function(xhr, status, error) {

				}
			
			});
		});



		//주문버튼
		$(".orderBtn").on("click", function() {
			var num = $(this).attr("data-xxx");
			location.href = "cartOrderConfirm?num=" + num;
		});
		
	
		
	});
</script>
<style>
#submit{ 
display: block;
    width: 15%;
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
<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>- 구매확정-</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>

		<td class="td_default" align="center"  width="80" colspan="1"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>



	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>



	<form name="myForm">

	
<c:forEach var="dto" items="${cartList}" varStatus="status">

		<!-- <input type="text" name="num81" value="81" id="num81"> <input
			type="text" name="gImage81" value="bottom1" id="gImage81"> <input
			type="text" name="gName81" value="제나 레이스 스커트" id="gName81"> <input
			type="text" name="gSize81" value="L" id="gSize81">
		<inputsp type="text" name="gColor81" value="navy" id="gColor81">
		<input type="text" name="gPrice81" value="9800" id="gPrice81"> -->
	<c:set var="dtonum" value="${dto.num}" />
	<c:set var="dtogImage" value="${dto.gImage}" />
	<c:set var="dtogName" value="${dto.gName}" />
	<c:set var="dtogSize" value="${dto.gSize}" />
	<c:set var="dtogColor" value="${dtogColor}"/>
	<c:set var="dtogPrice" value="${dto.gPrice}" />
	<c:set var="dtogAmount" value="${dto.gAmount}"/>
</c:forEach>
		<tr>
			<td class="td_default" width="80" colspan="1"><c:out value="${dtonum}"/></td>
			<td class="td_default" width="80"><img
				src="images/items/<c:out value="${dtogImage}"/>.gif" border="0" align="center"
				width="80" /></td>
			<td class="td_default" width="300" style='padding-left: 30px'><c:out value="${dtogName}"/>
				<br> <font size="2" color="#665b5f">[옵션 : 사이즈(<c:out value="${dtogSize}"/>)
					, 색상(<c:out value="${dtogColor}"/>)]
			</font></td>
			<td class="td_default" align="center" width="110"><c:out value="${dtogPrice}"/>
			</td>
			<td class="td_default" align="center" width="90"><input
				class="input_default" type="text" name="cartAmount"
				id="cartAmount<c:out value="${dtonum}"/>" style="text-align: right" maxlength="3"
				size="2" value="<c:out value="${dtogAmount}"/>"></input></td>
			<td><input type="button" value="수정" class="updateBtn"
				data-xxx="<c:out value="${dtonum}"/>" data-price="<c:out value="${dtogPrice}"/>"></td>
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum<c:out value="${dtonum}"/>"> <c:out value="${dtogPrice*dtogAmount}"/>
			</span></td>
			<td height="10"></td>
		</tr>

		
		
	</form>
	</table>
	<br>
	<center>
		<input type="button" value="구매" class="orderBtn" id="submit"
				data-xxx="<c:out value="${dtonum}"/>">
	</center>