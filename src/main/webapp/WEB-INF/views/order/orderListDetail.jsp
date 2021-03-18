<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
//삭제버튼

 $(document).ready(function(){
	 $(".delBtn").on("click", function() {
			console.log("delBEn")
			var num = $(this).attr("data-xxx");
			var xxx=$(this);
			$.ajax({
				url : 'cartDelete2',
				type : 'get',
				dataType : 'text',
				data : {
					num : num,
				},
				success : function(data, status, xhr) {
					//현재 선택한 레코드의 부모태그 찾기
					xxx.parents().filter("tr").remove();
				},
				error : function(xhr, status, error) {

				}
			
			}); 
		});
	 
	 
	//주문버튼
		$(".orderBtn").on("click", function() {
			var num = $(this).attr("data-xxx");
			location.href = "orderselect?num=" + num;
		});
	 
 })

</script>


<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>- 주문조회페이지 -</b></font> &nbsp;
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
		<td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="3"><strong>상품정보</strong></td>
		<td class="td_default" align="center" colspan="1"><strong>가격</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>주문날짜</strong></td>
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

	
<c:forEach var="dto" items="${oDTO}" varStatus="status">

		<!-- <input type="text" name="num81" value="81" id="num81"> <input
			type="text" name="gImage81" value="bottom1" id="gImage81"> <input
			type="text" name="gName81" value="제나 레이스 스커트" id="gName81"> <input
			type="text" name="gSize81" value="L" id="gSize81">
		<inputsp type="text" name="gColor81" value="navy" id="gColor81">
		<input type="text" name="gPrice81" value="9800" id="gPrice81"> -->

		<tr>
			
			<td class="td_default" width="80">${dto.num}</td>
			<td class="td_default" width="80"><img
				src="images/items/${dto.gImage}.gif" border="0" align="center"
				width="80" /></td>
			<td class="td_default" width="300" style='padding-left: 30px'>
			${dto.gName}</a>
				<br> <font size="2" color="#665b5f">[옵션 : 사이즈(${dto.gSize})
					, 색상(${dto.gColor})]
			</font></td>
			<td class="td_default" align="center" width="110" colspan="2">${dto.gPrice}
			</td>
			<td class="td_default" align="center">${dto.orderday}</td>
			<td><input type="button" value="주문정보보기" class="orderBtn"
				data-xxx="${dto.num}"></td>
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'>
				<input type="button" value="삭제"
				id="xx${status.index}" class="delBtn" data-xxx="${dto.num}"></td>
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'>
				

			
			<td height="10"></td>
		</tr>
</c:forEach>
		
		
	</form>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td height="20">
	</tr>

</table>
