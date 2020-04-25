<%@page import="metier.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metier.Director"%>
<%@page import="dataAccess.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<title>Supprimer Directeur</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- bootStrap importation -->
<style type="text/css">
    <%@include file="bootstrap/bootstrap.min.css" %>
    <%@include file="style/wlcmStyle.css" %>
</style>
<body>

<% String idDirector = request.getParameter("id");
	String visitor= "admin";
	DAO dao = new DAO();
	Director director = dao.getDirector(idDirector);
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
      <li><a href=<%="movies.jsp?user="+visitor %>>Movies</a></li>
      <li class="active"><a href=<%="directors.jsp?user="+visitor %>>Directors</a></li>
      <li><a href=<%="actors.jsp?user="+visitor %>>Actors</a></li>
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

<div class="container" style="margin-top:80px;">
	<div class="panel panel-default">
		<div class="panel-heading" style="font-weight: bold; text-align: center; font: 700 1.7em/1.1 Noe,georgia,serif;">
		<%=director.getDirectorName()%> - <svg class="bi bi-film" width="0.9em" height="0.9em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		<path fill-rule="evenodd" d="M0 1a1 1 0 011-1h14a1 1 0 011 1v14a1 1 0 01-1 1H1a1 1 0 01-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z" clip-rule="evenodd"/>
		</svg> </div>
		
		<div class="panel-body">
		<center>
			<table width="60%">
				<tr>
					<td style="padding-right: ">
					<img alt="<%=director.getDirectorName()%>" src="<%=director.getImage()%>" class="img-thumbnail" width="190px" height="300px" style="float: right;dispaly: inline-block; border: 2px solid #333"/>		
					</td>
				<td width="80%" style="text-align: left; padding-left: 30px">
				
					<h4>Supprimer <strong><%out.println(director.getDirectorName()); %></strong> et ces Films ?</h4>
					<ul>
					<% 
					ArrayList<Movie>mvs = dao.getMovieByDirector(idDirector);
					for(Movie m:mvs){
					%>
					<li><%=m.getTitle() %></li>
					<%} %>
					</ul>
					
			<!-- Delete director -->
			
				<form method="post" action="myServlet">
					<input type="hidden" name="directorID" value="<%=idDirector%>">					
					
					
					<button type="submit" name="deleteDirector" class="btn btn-danger">Supprimer</button>
					
					<a href=<%="dmore.jsp?user="+visitor+"&id="+director.getDirectorId()%> class="btn btn-success"
					style="">
					Annuler
					</a><br>
				</form>
		
				</td>
				</tr>
				</table>
				</center>
	</div></div></div>

</body>
</html>