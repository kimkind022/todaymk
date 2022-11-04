<%@page import="dto.MembersBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="dto.BasketBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
	//storeBasket에서 가격, 수량 부분 보여줄 때 사용, Basket테이블에서 내가 장바구니에 담은적이 있는 것을 
	//memberId를 조건으로 다 뽑아서 담아온 ArrayList
	ArrayList<BasketBean> addedInBasket = (ArrayList<BasketBean>)request.getAttribute("addedInBasket");
	System.out.println("4. 위치:storeBasket, 상태: addedInBasket: " + addedInBasket);
	/* articleAddedInBasket.get(0).getPrice(); */
%>

<%  
    ArrayList<String> a = new ArrayList<String>();
	List<ProductBean> productList = (ArrayList<ProductBean>)request.getAttribute("productList");
	System.out.println("4. 위치:storeBasket, 상태: productList: " + productList);
	
/* for(int i  =0 ; i <productList.size() ; i++){
	a.add(productList.get(i).getName());
	System.out.println( "a.get(i) : " + a.get(i) );
}
	Collections.sort(a,Collections.reverseOrder())\
	ㅏ 
	for(int i  =0 ; i <productList.size() ; i++){
	
		System.out.println( "a.get(i) : " + a.get(i) );
	}	 */ 
	
%>

<%
	MembersBean memberAddressBean = (MembersBean)request.getAttribute("memberAddress");
	System.out.println("위치:storeBasket, 상태: memberAddressBean: " + memberAddressBean);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
</head>
<jsp:include page="common.jsp"></jsp:include>

<style>

	.section0 {
		width: 1200px;
		min-height: 600px;
		margin: 0 auto;
		background-color: honeydew;
	}
	.section1 {		/* 스토어 글씨 + 채소, 과일, 곡물, 청/잼류 카테고리 아이콘 전체 싸고 있는 div	 */
		width: 1200px;
	}

	.storeTitleBox{ 	/* 스토어글씨 싸고 있는 div */
		background-color: rgb();
		width: 1200px;
		height: 50px;
		margin: 0 auto;
		padding-top: 30px;
		padding-bottom: 20px
	}
	.storeTitle{ 	/* p태그 */
		margin: 0 auto;
	    text-align: center;
	    font-size: 20pt;
	}
	.directory-oderby-box{
		width: 1200px;
		padding-top: 10px;
		padding-bottom: 30px;
		border: 1px;
		border-bottom: solid;
		border-color: grey;
	}
	.directory{
		float:left;
	}
	.orderby{
		float:right;
	}
	.orderby-ul > li {
		float:left;
	}
	
	
	.high-wrapper{
		display: flex;
	    margin-top: 10px;
	    justify-content: space-between;
	}
	.items-wrapper{	
		background-color: rgb(219 219 219);
	    width: 900px;
	}
	.item-td{
		border: 1px;
	}
	
	
	
	.item-thumbnail {
	    width: 100px;
	    height: 100px;
	    border-style: solid;
	}
	.item-name{
		width: 500px;
		height: 100px;
		border-style: solid;
	}
	.item-price-amount{
		width: 150px;
		height: 100px;
		border-style: solid;
	}
	.totalprice{
		font-size: 15pt;
	}
	.1ea-price{
		font-size: 8pt;
	}
	.item-heartDelete{
		width: 150px;
		height: 100px;
		border-style: solid;
	}
	
	
	.order-wrapper{
		border: 1px;
		justify-content: end;
	    width: 270px;
	    height: 600px;
	    margin-left: 20px;
	    background-color: rgb(219 219 219);
	}
	.memberAddress-td{
		width: 270px; 
		height:120px;
	}
	.memberAddress-wrapper{
  	    padding: 20px 20px;
  		background: #f9f9f9;
	}
	
	.orderprice-td{
		width:270px;
		height:200px;
		background-color: skyblue;
	}
	
	.orderprice-wrapper{
		padding: 20px 20px;
  		background: #f9f9f9;
	}

	.orderButton{
		width:100%;
		height:100px;
		background-color: brown;
	}
	
</style>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section class="section0">
		<div class="section1">	
			<div class="storeTitleBox"> <!-- 스토어글씨 싸고 있는 div -->
				<p class="storeTitle">
					 장바구니
				</p>
			</div>
		</div> 
		
		<div class="directory-oderby-box">
			<div class="directory">
				<p> Home > 스토어 > 장바구니 </p>
			</div>			
			<!-- <div class="orderby">
				<ul class="orderby-ul">
					<li>자주구매순&nbsp&nbsp| &nbsp</li>
					<li>최신구매순&nbsp&nbsp</li>
				</ul>	
			</div> -->
		</div>	
		<div class="high-wrapper">
			<div class="items-wrapper">
				<table>
				
				<%
					/* for(int i=0; i<addedInBasket.size(); i++) { */
					for(int i=addedInBasket.size()-1; i>=0; i--) { /* for문을 역순으로 돌아가게  */
				%>
					<tr class="item-tr">
						<td class="item-td item-thumbnail" >
							<div>
								<label for="checking"> 
									<input type="checkbox" class="checkboxChoice" id="checking"  style="position: absolute" checked>
									<img src="images/store/<%=productList.get(i).getImageNo1()%>" width="100px" height="100px" >
								</label>	
							</div>			
						</td>
					
						<td class="item-td item-name">
							<div>
								<a href="storeProductDetail.pd?id=<%= productList.get(i).getId() %> "> <!-- getId 는 상품번호 -->
									<%= productList.get(i).getName() %>
								</a>	
							</div>								
						</td>
						
						<td class="item-td item-price-amount">
							<div>
								<!-- db에서 가져온 개당 가격, totalprice구할때 쓰임  -->
							 	<input type="text" value="<%=addedInBasket.get(i).getPrice()%>" class="price" readonly>
								
								<!-- jquery로 계산한 아이템*갯수 = 총 가격 -->
								<span class="totalprice"> 
								 	<%=(addedInBasket.get(i).getPrice() * addedInBasket.get(i).getAmount()) %>
								</span>	원
								<div class="1ea-price"> 
									(개당가격:<%=addedInBasket.get(i).getPrice()%>원)
								</div>
							</div>
							<div style="text-align: center;">
								<button class="minus" style="font-size: 30px;">-</button>
								<span class="amount"> <%=addedInBasket.get(i).getAmount()%> </span>
								<button class="plus" style="font-size: 30px;">+</button>
							</div>	
						</td>
						<td class="item-td item-heartDelete">
							<img src="images/common/heart.png" style="width:30px; padding:5px;" />
							<a href="basketDeleteAction.pd?productId=<%=addedInBasket.get(i).getProductId()%>">
								<img src="images/common/trashcanIcon.png" style="width:30px; padding:5px;" />
							</a>
						</td>
					</tr>
				<%} %>
				</table>	
			</div>
			
		
			<div class="order-wrapper">
				<table>
					<tr>
						<td class="memberAddress-td">
							<div class="memberAddress-wrapper">
								<strong><span>배송지</span></strong>
								<div>
									<%= memberAddressBean.getAddress1() %>
									<%= memberAddressBean.getAddress2() %>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="orderprice-td">
							<div class="orderprice-wrapper">
								주문금액: <span class="orderprice"></span>
								<!-- 배송비:
								결제금액: -->
							</div>
						</td>
					</tr>
					<tr>
						<td class="orderButton">
							<input type="button" value="주문하기버튼" style="width: 200px; height: 40px;"></input>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>

<script>
	$(document).ready(function(){
		$('.plus').click(function(){ /* alert("plus");  */
			let amount = $(this).closest('td').find('.amount');
			amount.html(   parseInt(   amount.html()   ) + 1   ); 
			/* 총금액 수정*/
			calcSum(this); 
			changeOrderPriceAccordingToButton();
		});
		
		$('.minus').click(function(){ /* alert("minus");  */
			let amount = $(this).closest('td').find('.amount');  /*  find.('.amount) 해서 찾은 것 15900이 아니라. 15900를 담고있는 span 태그  */
			if (amount.html() == 1){    
				alert(amount.html())
			}
			else{
				amount.html(   parseInt(   amount.html()   )  -1 ); 
			}
			calcSum(this);
			changeOrderPriceAccordingToButton();
		});
	
		
		/* -------------- */
		var checkedItem=0;
		var tot=0;
		var checkboxChoice = document.getElementsByClassName("checkboxChoice");
		console.log(checkboxChoice);
		for(var i = 0; i < checkboxChoice.length; i++){
			if( checkboxChoice[i].checked ){
			    checkedItem = $(checkboxChoice[i]).closest('tr').find('.totalprice').html();
				console.log("checkedItem: " + checkedItem);
				tot += parseInt(checkedItem);
			}
			/* var cd = tot.toString(tot); */
			$('.orderprice').text(tot);
		}
		
		$('.checkboxChoice').click(function(){
			var checkedItem=0;
			var tot=0;
			var checkboxChoice = document.getElementsByClassName("checkboxChoice");
			console.log(checkboxChoice);
			for(var i = 0; i < checkboxChoice.length; i++){
				if( checkboxChoice[i].checked ){
				    checkedItem = $(checkboxChoice[i]).closest('tr').find('.totalprice').html();
					console.log("checkedItem: " + checkedItem);
					tot += parseInt(checkedItem);
				}
				/* var cd = tot.toString(tot); */
				$('.orderprice').text(tot);
			}
			
		});
		
	});
	
	
	function calcSum(receivethis) {
		let totalprice = $(receivethis).closest('td').find('.totalprice');
		let price = $(receivethis).closest('td').find('.price');
		let amount = $(receivethis).closest('td').find('.amount');
		/* let price= $('.price').val();
		let amount = $('.amount').html();  */
		let sum = parseInt(  price.val() ) * (   parseInt   (   amount.html()  )  );
		totalprice.html( sum );
	}
	
	function changeOrderPriceAccordingToButton() {
		let totalprice1 = $('.totalprice').get();
		var tot=0;
		for(var i=0 ; i< totalprice1.length ; i++){   //length로 뽑은 갯수 만큼 반복
			tot +=  parseInt(totalprice1[i].innerHTML); //totalprice1 i번째 것의 innerHTML요소의 값을 다 더해서 tot에 저장. 
			/* console.log(totalprice1[i].innerHTML)  */
		}
		var ab= tot.toString(); // 다 더한값을 String으로 바꿔서 ab에 저장
		$('.orderprice').text(ab);
	}
	
	
</script>

</html>