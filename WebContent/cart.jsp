<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/cart.css">
<jsp:include page="includeHead.jsp" />
<title>カート</title>

<script>
	$(function() {

		$(document).keydown(function(event) {
			var keyCode = event.keyCode;
			if (keyCode == 123 // F12キーの制御
			) {
				return false;
			}
		});
	});
</script>

<script src="https://sindresorhus.com/devtools-detect/index.js"></script>

<script>
	window.addEventListener('devtoolschange', function() {
		alert("検証画面を閉じて再度サイトを開きなおしてください");


if(true){

		while (true) {
			debugger



		}

		}

		})
</script>

</head>
<body oncontextmenu="return false;">
	<jsp:include page="header.jsp" />
	<div id="main" class="cf">
		<jsp:include page="navigation.jsp" />
		<div id="contents">
			<s:if test="#session.cartInfoDtoList.size()>0">
				<h1>商品カート</h1>
			</s:if>
			<s:if test="#session.checkListErrorMessageList!=null">
				<div class="error">
					<div class="error-message">
						<s:iterator value="#session.checkListErrorMessageList">
							<s:property />
						</s:iterator>
					</div>
				</div>
			</s:if>

			<s:if test="#session.cartInfoDtoList.size()>0">
				<s:form id="form" action="SettlementConfirmAction">

					<s:iterator value="#session.cartInfoDtoList">
						<div class="checkbox">
							<s:checkbox name="checkList" value="checked"
								fieldValue="%{productId}" id="checkbox" />
						</div>
						<div class="Side-by-side">
							<img
								src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>'
								width="326px" height="218px" />

							<table class="horizontal-list-table">

								<tr>
									<td colspan="2"><div id="productNameKana">
											<s:property value="productNameKana" />
										</div></td>
								</tr>
								<tr>
									<td colspan="2"><div class="nameAndSubtotal">
											<s:property value="productName" />
										</div></td>
								</tr>
								<tr align="center">
									<th><div class="productInfo">料金：</div></th>
									<td><div class="productInfo">
											<s:property value="price" />
											円
										</div></td>
								</tr>
								<tr align="center">
									<th><div class="productInfo">枚数：</div></th>
									<td><div class="productInfo">
											<s:property value="productCount" />
											枚
										</div></td>
								</tr>
								<tr align="center">
									<th><div class="productInfo">発売会社：</div></th>
									<td><div class="productInfo">
											<s:property value="releaseCompany" />
										</div></td>
								</tr>
								<tr align="center">
									<th><div class="productInfo">発売日：</div></th>
									<td><div class="productInfo">
											<s:property value="releaseDateString" />
										</div></td>
								</tr>
								<tr>
									<td colspan="2"><div class="nameAndSubtotal">合計</div></td>
								</tr>
								<tr>
									<td colspan="2"><div id="subtotal">
											<s:property value="subtotal" />
											円
										</div></td>
								</tr>
							</table>

							<s:hidden name="productId" value="%{productId}" />

							<s:hidden name="productName" value="%{productName}" />
							<s:hidden name="productNameKana" value="%{productNameKana}" />
							<s:hidden name="imageFilePath" value="%{imageFilePath}" />
							<s:hidden name="imageFileName" value="%{imageFileName}" />
							<s:hidden name="price" value="%{price}" />
							<s:hidden name="releaseCompany" value="%{releaseCompany}" />
							<s:hidden name="releaseDate" value="%{releaseDate}" />
							<s:hidden name="productCount" value="%{productCount}" />
							<s:hidden name="subtotal" value="%{subtotal}" />
						</div>
					</s:iterator>

					<br>
					<h2>
						<s:label value="商品合計 :" />
						<span class="totalPrice"> <s:property
								value="#session.totalPrice" /> 円
						</span>
					</h2>
					<br>

					<div class="submit_btn_box">
						<div id="contents-btn-set">
							<s:hidden name="srcPage" value="cart" />
							<s:submit value="決済" class="submit_btn" />
						</div>
					</div>

					<div class="submit_btn_box">
						<div id="contents-btn-set">
							<s:submit value="選択した商品を削除" class="submit_btn"
								onclick="this.form.action='DeleteCartAction';" />
						</div>
					</div>

				</s:form>
			</s:if>
			<s:else>
				<div class="infoBox">
					<div class="info">カート情報はありません</div>
					<div class="info">
						<s:form action="HomeAction">
							<s:submit value="HOME" class="submit_btn" id="HomeAction" />
						</s:form>
					</div>
				</div>
			</s:else>
		</div>
	</div>
	<footer class="footer">
		<s:include value="footer.jsp" />
	</footer>
</body>
</html>

