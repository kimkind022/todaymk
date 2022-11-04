<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  response.setContentType("text/html; charset=utf-8");
  response.setCharacterEncoding("utf-8");
  request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="common.jsp"></jsp:include>

<style type="text/css">
section {
	width: 1200px;
	margin: 0px auto;
	padding: 40px 0;
}
</style>

<script type="text/javascript" src="script/priceComparison.js"></script>

</head>

<body>
  <!--헤더-->
  <jsp:include page="header.jsp"></jsp:include>
  <div class="wrap0">
    <section>
      <div>
        <div>
          <div>대분류</div>
          <select name="p_itemcategorycode">
            <option value="all">선택</option>
            <option value="100">식량작물</option>
            <option value="200">채소류</option>
            <option value="300">특용작물</option>
            <option value="400">과일류</option>
            <option value="500">축산물</option>
            <option value="600">수산물</option>
          </select>
        </div>
        <div>
          <div>소분류</div>
          <select name="p_itemcode">
            <option value=all>선택</option>
          </select>
        </div>
      </div>
      <div>
        <div>기간선택</div>
        <input type="date" name="p_startday">
        <div>~</div>
        <input type="date" name="p_endday">
        <input type="button" value="1개월" name="oneMonth" class="dateButton">
        <input type="button" value="3개월" name="threeMonth" class="dateButton">
        <input type="button" value="6개월" name="sixMonth" class="dateButton">
        <input type="button" value="1년" name="oneYear" class="dateButton">
      </div>
      <div>
        <input type="button" value="검색" name="priceSearch">
      </div>











      <%-- <c:choose>
        <c:when test="${empty dto}">
        정보가 없습니다
        </c:when>
        <c:otherwise>
          <c:set var="priceItem" value="${dto.getData().getItem()}" />
          <div>쌀(1kg) 평균</div>
          <c:forEach var="priceItem" items="${priceItem}" varStatus="status">
            <div style="display: flex; flex-direction: column;">
              <c:if test="${priceItem.getCountyname() eq '평균'}">
                <c:set var="regday" value="${fn:replace(priceItem.getRegday(),'/','월 ') }" />
                <div>${priceItem.getYyyy()}년${regday}일</div>
                <div>${priceItem.getPrice()}원</div>
                <div>----------</div>
              </c:if>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose> --%>


    </section>
  </div>
  <!--풋터-->
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>