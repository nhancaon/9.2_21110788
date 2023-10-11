<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Murach's Java Servlets and JSP</title>
<link rel="stylesheet" href="styles/main.css" type="text/css" />
</head>
<body>

	<h1>Your cart</h1>

	<table class="styled-table">
		<tr>
			<th>Quantity</th>
			<th>Description</th>
			<th>Price</th>
			<th>Amount</th>
			<th></th>
		</tr>


		<c:forEach var="item" items="${cart.items}">
			<tr>
				<td>
					<form action="" method="post">
						<input type="hidden" name="productCode"
							value="<c:out value='${item.product.code}'/>"> <input
							type=text name="quantity"
							value="<c:out value='${item.quantity}'/>" id="quantity">
						<input type="submit" value="Update" class="button">
					</form>
				</td>
				<td><c:out value='${item.product.description}' /></td>
				<td>${item.product.priceCurrencyFormat}</td>
				<td>${item.totalCurrencyFormat}</td>
				<td>
					<form action="" method="post">
						<input type="hidden" name="productCode"
							value="<c:out value='${item.product.code}'/>"> <input
							type="hidden" name="quantity" value="0"> <input
							type="submit" value="Remove Item" class="button">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<c:choose>
		<c:when test="${cart.count==0}">
			<p>Your cart is empty.</p>
		</c:when>
		<c:when test="${cart.count==1}">
			<p>You have 1 item in your cart.</p>
		</c:when>
		<c:otherwise>
			<p>You have ${cart.count} items in your cart.</p>
		</c:otherwise>
	</c:choose>
	<p>
		<b>To change the quantity</b>, enter the new quantity and click on the
		Update button.
	</p>

	<form action="" method="post">
		<input type="hidden" name="action" value="shop"> <input
			type="submit" value="Continue Shopping" class="button-diff">
	</form>

	<form action="" method="post">
		<input type="hidden" name="action" value="checkout"> <input
			type="submit" value="Checkout" class="button-diff">
	</form>
</body>
</html>