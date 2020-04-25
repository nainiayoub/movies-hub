<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supprimer Film</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- bootStrap importation -->
<style type="text/css">
    <%@include file="bootstrap/bootstrap.min.css" %>
    <%@include file="style/wlcmStyle.css" %>
</style>
</head>
<body>

<% String idMovie = request.getParameter("idM");
	String poster = request.getParameter("mvImg");
	String visitor= "admin";
%>
<nav class="navbar navbar-inverse navbar-fixed-top" style="border-bottom: none">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="color: #fff">M O V I E S - H U B
      		<svg class="bi bi-film" width="0.8em" height="0.8em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 1a1 1 0 011-1h14a1 1 0 011 1v14a1 1 0 01-1 1H1a1 1 0 01-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z" clip-rule="evenodd"/>
</svg>
      </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href=<%="movies.jsp?user="+visitor %>>Movies</a></li>
      <li><a href="#">Directors</a></li>
      <li><a href="#">Actors</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 
      		admin
      	  </a>
      </li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-out"></span> Se deconnecter</a></li>
    </ul>
  </div>
  <div class="row"style=" text-align: center; font-family: monospace">
    <div class="col-sm-4" style="background-color:lavender;padding: 4px">Réalisé par: Ayoub NAINIA</div>
    <div class="col-sm-4" style="background-color:lavenderblush;padding: 4px">Encadré par: Pr.Jamal BAKKAS </div>
    <div class="col-sm-4" style="background-color:lavender;padding: 4px">Métiers de l'informatique / ESTS</div>
  </div>
</nav>


	<div class="container" style="margin-top:80px; background-color: #fff">	
		&nbsp
			<!-- Search -->
		<div class="panel panel-default " style="text-align: center">
		
	            <div class="panel-heading " style=" font-weight: bold;">
	            	Recherchez un film
	            </div>
	                <div class="panel-body">
	                    <form method="post" action="myServlet" class="form-inline">
	                        <div class="form-group">
	                            <input type="text" name="movieTitle" placeholder="Titre du film" class="form-control">
	                        </div>
	                       
	                        <button type="submit" class="btn btn-success">
	                        	<span class="glyphicon glyphicon-search"></span> 
	                            Rechercher..
	                        </button>
	                        
	                       &nbsp &nbsp;
	                       
                       	       <a href="ajoutMovie.jsp?"><span class="glyphicon glyphicon-plus"></span> Ajouter un film</a>
	                        
	                    </form>
	                </div>
	        </div>
	        
	        <!-- Movie list -->
	        
	        <div class="panel panel-deafult" style="border: 1px solid #333" >
	            <div class="panel-heading" style="font-weight: bold;color: #fff; font-size: 17px;background-color: #333; text-align: center">
	            		Films Disponibles - <svg class="bi bi-film" width="0.9em" height="0.9em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  					<path fill-rule="evenodd" d="M0 1a1 1 0 011-1h14a1 1 0 011 1v14a1 1 0 01-1 1H1a1 1 0 01-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z" clip-rule="evenodd"/>
						</svg>
	            </div>
			<center>
			<div class="panel panel-danger" style="width: 30%; margin-top: 20px;">
            <div class="panel-heading danger" style="background-color: #d9534f; color: #fff; border: 1px solid #d9534f; font-weight: bold">
            	Supprimer ce Film ?
            </div>
            
            <div class="panel-body">
				<form action="myServlet" method="post">
					<input type="hidden" name="idMovie" value="<%=idMovie%>">
					
					<img src="<% out.println(poster); %>"  class="img-thumbnail"/>
						<br><br>
					
					<input type="submit" name="deleteMovie" class="btn btn-danger"
					style="" value="Supprimer">
						
					
					<a href=<%="movies.jsp?user="+visitor%> class="btn btn-success"
					style="">
						Annuler
					</a><br>
				</form>	
		
			</div>
			</center>
			</div>
			

</div>
	</div>

</body>
</html>