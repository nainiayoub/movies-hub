<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>

<!-- bootStrap importation -->
<style type="text/css">
    <%@include file="bootstrap/bootstrap.min.css" %>
  	<%@include file="style/style.css" %>
</style>

</head>
<body>



<%
	String msgPanel = (String)request.getAttribute("msgPanel");
	String signed = (String)request.getAttribute("signed");
	String login = (String)request.getAttribute("login");
	String user = request.getParameter("user");
	
	
%>
<div class="container-fluid">

	<div class="row" style="text-align: center; padding: 10px">
		<div class="col-sm-4" style="background-color:lavender; padding: 10px">Realise par: NAINIA AYOUB</div>
	    <div class="col-sm-4" style="background-color:lavenderblush; padding: 10px">Encadre par: Pr.JAMAL BAKKAS</div>
	    <div class="col-sm-4" style="background-color:lavender; padding: 10px">Ecole Superieur de Technologie de Safi 2019/2020</div>
	</div>
	<br><br>
	<div class="container col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3" >
    <div class="panel panel-default margetop">
       <div class="panel panel-default">
           <div class="panel-heading" id="panel-heading">
               <center>
                   <strong style="color: #fff">Movies Hub</strong>
                    </center>
           </div>
           <div class="panel-heading">
               <center>
                   <strong style="font-size: 17px;">Connectez-vous !</strong>
                    </center>
           </div>
            </div>
            <div class="panel-body"> 
				<form action="myServlet" method="post" >
					<% if(msgPanel != null){%>
					<div class="alert alert-danger">
						<% out.println(msgPanel); %>
					</div>
					<%} %>
					<% if(signed != null){%>
					<div class="alert alert-success">
						<% out.println(signed); %>
					</div>
					<%} %>
					
					<div class="form-group">
		                <label for="login">Pseudo : </label>
		            	<input type="text" name="login" class="form-control" placeholder="Votre pseudo nom" value="<% if(login!= null) out.println(login);%>">
		            </div>
					<div class="form-group">
		                <label for="pwd">Password : </label>
		            	<input type="password" name="pwd" class="form-control" placeholder="Votre mot de passe">
		            </div>
					<br>
					<div class="form-group">        
                      <center>
	                     <input type="submit" class="btn btn-success" name="connect" style="width: 49%" value="Submit">
                 		 <input type="reset" class="btn" style="width: 49%"  value="Reset">
                      </center>
                 </div>
                 Vous n'avez pas encore un compte? <a href="signup.jsp">Inscrivez-vous</a>
               </form>
			</div></div>
		</div>
  			</div>


</body>
</html>