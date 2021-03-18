<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${! empty mesg}">
	<script type="text/javascript">
		alert("${mesg}")
	</script>
</c:if>
<style>
#submit {
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
	background-color: #272525;
}
</style>
<center>
	<table border="1">
		<form action="memberDelete2" method="get">
			<h3>회원탈퇴</h3>
			<tbody>
				<tr>
					<td align="center">탈퇴 후 회원정보가 모두 삭제됩니다.<br> 메일주소, 핸드폰
						번호/기타 연락처 등 회원정보가 모두삭제되며, 삭제된 데이터는 복구되지 않습니다.<br> (회원 탈퇴 및 자격
						상실 등)<br> ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다. <br>② 회원이 다음
						각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다. <br>1. 가입 신청 시에 허위 내용을
						등록한 경우 <br>2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에
						지급하지 않는 경우<br> 3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
						<br>4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br> ③ “몰”이 회원 자격을
						제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은
						회원자격을 상실시킬 수 있습니다.<br> ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게
						이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
					</td>
				</tr>
			</tbody>
			</table>
		<input type="submit" value="회원 탈퇴" id="submit">	
			<center>
		</form>