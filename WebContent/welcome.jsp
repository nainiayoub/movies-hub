<%@page import="metier.Visitor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movies Hub</title>
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
<body style="height:1200px">
<% Visitor visitor = (Visitor)request.getAttribute("visitor");
	String user = visitor.getLogin();
	if(user == null){
		user = request.getParameter("user");
	}
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
      <li><a href=<%="movies.jsp?user="+user %>>Movies</a></li>
      <li><a href=<%="directors.jsp?user="+user %>>Directors</a></li>
      <li><a href=<%="actors.jsp?user="+user %>>Actors</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 
      		<% if(visitor != null){%>
      		<%=user %>
      		<%}else{ %>
      		Profile
      		<%} %>
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
 <h2 class="logo" style="text-align: center">MVS <span style="color: yellow; font-weight: bold">-</span> Hub 
 	<svg class="bi bi-film" width="0.6em" height="0.6em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 1a1 1 0 011-1h14a1 1 0 011 1v14a1 1 0 01-1 1H1a1 1 0 01-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z" clip-rule="evenodd"/>
</svg>
 </h2>
 &nbsp
  <h4 style="margin-bottom: 30px">Utilisez le Menu en haut pour voir et chercher vos 
  	<a href=<%="movies.jsp?user="+user %>>Films</a>,
  	<a href="actors.jsp">Acteurs</a> et 
  	<a href="directors.jsp">Directeurs</a> préférés.
  </h4>
  
  <div class="row">
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
         <img src="https://images-na.ssl-images-amazon.com/images/I/81NuuGhiNmL._SL1500_.jpg"/>
          <div class="caption">
            <p>GoodFellas (1990)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
           <img src="https://images-na.ssl-images-amazon.com/images/I/51J5V86vqiL._SY445_.jpg"/>
          <div class="caption">
            <p>The Departed (2007)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="https://cdn.shopify.com/s/files/1/1416/8662/products/taxi_driver_1976_original_film_art_f_50a2b193-29c6-442b-ac7b-e7b26b6fdff6_2000x.jpg?v=1575083709"/>
          <div class="caption">
            <p>Taxi Driver (1974)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"/>
          <div class="caption">
            <p>Fight Club (1999)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRz_2nKTNlxhVtzbh29kgL3m2ebLv3TlYyzrbyqBtEUxt6mBuZ-"/>
          <div class="caption">
            <p>Pulp Fiction (1994)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"/>
          <div class="caption">
            <p>The GodFather (1972)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="https://m.media-amazon.com/images/M/MV5BMjIyNTQ5NjQ1OV5BMl5BanBnXkFtZTcwODg1MDU4OA@@._V1_UY1200_CR90,0,630,1200_AL_.jpg"/>
          <div class="caption">
            <p>Django Unchained (2012)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="https://i.pinimg.com/736x/3b/c2/ea/3bc2ea7935876f39e5ce8d8c96d48212.jpg"/>
          <div class="caption">
            <p>Once Upon A Time In Hollywood (2019)</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-2" id="divs">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="https://m.media-amazon.com/images/M/MV5BMTM4NjY1MDQwMl5BMl5BanBnXkFtZTcwNTI3Njg3NA@@._V1_UY1200_CR91,0,630,1200_AL_.jpg"/>
          <div class="caption">
            <p>Midnight In Paris (2011)</p>
          </div>
        </a>
      </div>
    </div>
    
  </div>
</div>	
<%@include file="footer.jsp" %>
</body>
</html>