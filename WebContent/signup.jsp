<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-up</title>
<!-- bootStrap importation -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
    <%@include file="bootstrap/bootstrap.min.css" %>
  	<%@include file="style/style.css" %>
</style>

</head>
<body>
<%String signed = (String)request.getAttribute("signed"); %>
<div class="container-fluid">

	
	<br><br>
	<div class="container col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3" >
    <div class="panel panel-default margetop">
       <div class="panel panel-default">
           <div class="panel-heading" id="panel-heading" style="color: #fff">
               <center>
                   <strong style="">Movies Hub</strong>
                    </center>
           </div>
           <div class="panel-heading">
               <center>
                   <strong style="">Inscrivez-vous!</strong>
                    </center>
           </div>
            </div>
            <div class="panel-body"> 
				<form action="myServlet" method="post" class="form">
					<% if(signed != null){%>
					<div class="alert alert-success">
						<% out.println(signed); %>
					</div>
					<%} %>
					<div class="form-group">
		                <label for="login">Pseudo : </label>
		            	<input type="text" name="login" class="form-control" placeholder="Entrez votre pseudo nom">
		            </div>
		            <div class="form-group">
		                <label for="name">Nom complet : </label>
		            	<input type="text" name="name" class="form-control" placeholder="Entrez votre nom complet">
		            </div>
		            
					<div class="form-group">
		                <label for="pwd">Mot de passe : </label>
		            	<input type="password" name="pwd" class="form-control" placeholder="Entrez votre mot de passe">
		            </div>
		            
		            <div class="form-group">
		                <label for="pwd">Confirmer mot de passe : </label>
		            	<input type="password" name="confirm" class="form-control" placeholder="Confirmez votre mot de passe">
		            </div>
					<br>
					<div class="form-group">        
                      <center>
	                     <input type="submit" class="btn btn-success" name="signup" style="width: 49%" value="Submit">
                 		 <input type="reset" class="btn" style="width: 49%"  value="Reset">
                      </center>
                 	</div>
                 	
                 	Vous avez un déjà compte? <a href="login.jsp">Connectez-vous</a>
               </form>
			</div></div>
		</div>
  			</div>


</body>
</html>