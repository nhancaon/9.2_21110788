<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Murach's Java Servlets and JSP</title>
<link rel="stylesheet" href="styles/main.css" type="text/css" />
</head>
<body>

	<h1>CD list</h1>
	<table class="styled-table">
		<tr>
			<th>Description</th>
			<th class="right">Price</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr>
				<td><c:out value='${product.description}' /></td>
				<td class="right">${product.priceCurrencyFormat}</td>
				<td><form action="cart" method="post">
						<input type="hidden" name="productCode"
							value="<c:out value='${product.code}'/>"> <input
							type="submit" value="Add To Cart" class="button">
					</form></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>