<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<head>
    <title>Products123</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <link rel="stylesheet" href="/bootstrap.min.css" media="screen"/>
    <style>
        .navigation-order{
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-4 col-sm-6 col-lg-offset-3">
            <a href="/products"><img src="/logo.png" style="width:100%;"/></a>
        </div>
    </div>
    <div class="page-header" id="banner">
        <div class="row">
            <div class="col-lg-8 col-md-7 col-sm-6">
                <h1>Products</h1>

                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                    		<th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                    </tr>
                    </thead>
                    <tbody>
					
					<c:forEach items="${products123}" var="product">
                        <tr >
                        			<td><c:out value = "${product.productId}"/> </td>
                        			<td><c:out value = "${product.productName}"/> </td>
                        			<td><c:out value = "${product.productPrice}"/> </td>
                   		 </tr>
					</c:forEach>
					
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-md-7 col-sm-6">
                <form>
                    <div class="form-group">
                        <label for="product_name">Product Name:</label>
                        <input type="text" class="form-control" id="product_name"/>
                    </div>
                    <div class="form-group">
                        <label for="product_price">Price:</label>
                        <input type="text" class="form-control" id="product_price"/>
                    </div>
                    <button type="submit" class="btn btn-default" id="btn_submit">Add New Product</button>
                </form>
            </div>
        </div>
        <br />
        <div class="row navigation-order">
            <div class="col-lg-8 col-md-7 col-sm-6">
                <a href="/orders">Click here to go to Customer Order Management</a>
            </div>
        </div>
    </div>
</div>
<script src="/jquery.js" type="application/javascript"></script>
<script type="application/javascript">
    $(document).ready(function () {
       $('#btn_submit').on("click",function (e) {
           e.preventDefault();
           var productName, productPrice;
           productName = $('#product_name').val();
           productPrice = $('#product_price').val();
           if($.trim(productName) === ""){
               alert("Product name cannot be empty");
           }
           else if(!$.trim($.isNumeric(productPrice))){
               alert("Price must be numeric");
           }
           else {
               var data = {};
               data["productName"] = productName;
               data["productPrice"] = productPrice;
               $.ajax({
                   type: "POST",
                   contentType: "application/json",
                   url: "/saveproduct",
                   data: JSON.stringify(data),
                   dataType: 'json',
                   timeout: 6000,
                   success: function (data) {
                       if (confirm("Product with Id " +data + " Saved")){
                           window.location.reload();
                       }
                   }
               });
           }
       });
    });
</script>
</body>
</html>