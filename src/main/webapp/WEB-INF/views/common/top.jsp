<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty login}">
<div class="w3-bar w3-theme-d2 w3-left-align">
 <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>

<a href="loginUI" class="w3-bar-item w3-teal"><i class="fa fa-home w3-margin-right"></i>Logoin</a>
<div style="float: right;">
<a href="memberUI" class="w3-bar-item w3-button w3-hide-small w3-hover-white">회원가입</a>
</div>
<a href="goodsList" class="w3-bar-item w3-button w3-hide-small w3-hover-white">top</a>
      <a href="goodsList?gCategory=dress"  class="w3-bar-item w3-button w3-hide-small w3-hover-white">dress</a>
      <a href="goodsList?gCategory=outer" class="w3-bar-item w3-button w3-hide-small w3-hover-white">outer</a>
      <a href="goodsList?gCategory=bottom" class="w3-bar-item w3-button w3-hide-small w3-hover-white">bottom</a>
</div>


</c:if>

<c:if test="${!empty login}">

<div class="w3-bar w3-theme-d2 w3-left-align">
<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
<a href="logout"class="w3-bar-item w3-teal"><i class="fa fa-home w3-margin-right"></i>Logout</a>


<div style="float: right;">
<a class="w3-bar-item  w3-hide-small w3-hover-white">안녕하세요. ${login.userid}님 </a>
<a href="mypage"class="w3-bar-item w3-button w3-hide-small w3-hover-white"><i class="fa fa-user"></i></a>
<a href="cartList" class="w3-bar-item w3-button w3-hide-small w3-hover-white"><i class="fa fa-shopping-cart"></i></a>
<a href="orderListDetail" class="w3-bar-item w3-button w3-hide-small w3-hover-white"><i class="fa fa-credit-card-alt"></i></a>
</div>
<a href="goodsList" class="w3-bar-item w3-button w3-hide-small w3-hover-white">top</a>
      <a href="goodsList?gCategory=dress"  class="w3-bar-item w3-button w3-hide-small w3-hover-white">dress</a>
      <a href="goodsList?gCategory=outer" class="w3-bar-item w3-button w3-hide-small w3-hover-white">outer</a>
      <a href="goodsList?gCategory=bottom" class="w3-bar-item w3-button w3-hide-small w3-hover-white">bottom</a>
</div>

</c:if>


    