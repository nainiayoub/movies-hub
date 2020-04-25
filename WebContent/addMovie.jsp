<%@page import="metier.Director"%>
<%@page import="metier.Movie"%>
<%@page import="metier.Genre"%>
<%@page import="dataAccess.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metier.Actor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter Film</title>
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

<%
	String visitor = "admin";
	if(visitor == null){
		visitor = (String)request.getAttribute("user");
	}
	
	
	DAO dao = new DAO();
	Movie movie = dao.getLastMovieRow();
%>

<!-- NAVBAR -->
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
      <li><a href=<%="directors.jsp?user="+visitor %>>Directors</a></li>
      <li><a href="#">Actors</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 
      		<% if(visitor != null){%>
      		<%=visitor %>
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

<!-- Formulaire d'Ajout -->
<div class="container" style="margin-top:90px;">
	<div class="panel panel-default">
		<div class="panel-heading" style="font-weight: bold; text-align: center; font: 700 1.7em/1.1 Noe,georgia,serif;">
		Ajouter Film - <svg class="bi bi-film" width="0.9em" height="0.9em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 1a1 1 0 011-1h14a1 1 0 011 1v14a1 1 0 01-1 1H1a1 1 0 01-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z" clip-rule="evenodd"/>
</svg></div>
			
			<!-- Update Message -->
			
			
	         
		<div class="panel-body">
			
			<form method="post" action="myServlet" class="form">
				
				<div class="form-group">
					<label for="idfilm">Id Film : </label>
					<input type="text" name="idfilm" placeholder="ID Film (ID du film precedent <% if(movie != null) out.println(movie.getMovieId());%>)" class="form-control" required>
				</div>
				
				<div class="form-group">
					<label for="mtitle">Titre du Film : </label>
					<input type="text" name="mtitle" placeholder="Titre du Film" class="form-control" required>
				</div>
						
			    <div class="form-group">
			    	<label for="dateSortie">Date de sortie : </label>
					<input type="date" name="dateSortie" placeholder="Date de sortie" class="form-control" required>
				</div>	
				<div class="form-group">
				<label for="genre">Genre :</label>
                <select name="genre" class="form-control" id="genre" required>
                <%ArrayList<Genre>genres = new ArrayList<Genre>();
					genres = dao.listeGenres();
					for(Genre g:genres){
				%>
                    <option value="<%=g.getGenreId() %>"><%=g.getGenreType() %></option>
               <%} %>
               </select>
                </div>
				
				
				
				
				<div class="form-group">
				<label for="director">Directeur :</label>
                <select name="director" class="form-control" id="directeur" required>
                <% 
                	ArrayList<Director>directeurs = new ArrayList<Director>();
					directeurs = dao.listeDirectors();
					for(Director directeur:directeurs){
					
				%>
                    <option value="<%=directeur.getDirectorId()%>"><%=directeur.getDirectorName()%></option>
                <%} %>
                </select>
                </div>				
				
				<div class="form-group">
				<label for="actor">Acteur Principal :</label>
				<!-- Options acteurs -->
                <select name="actor" class="form-control" id="actor" required>
                <%ArrayList<Actor>acteurs = new ArrayList<Actor>();
					acteurs = dao.listeActors();
					for(Actor acteur:acteurs){
					
				%>
                    <option value="<%=acteur.getActorId() %>"><%=acteur.getActorName() %></option>
                <%} %>
                </select>
                </div>		
				
				<div class="form-group">
			    	<label for="poster">Poster du Film : </label>
					<input type="text" name="poster"  placeholder="Poster en ligne du film" class="form-control">
				</div>	
			
				<button type="submit" class="btn btn-success" name="addMovie">
                     <span class="glyphicon glyphicon-save"></span> 
                     Ajouter
                </button>
                <a href=<%="movies.jsp?user="+visitor%> class="btn btn-danger" >
                     Annuler
                </a>
				
			</form>
		
		
		</div>
	</div>


</div>


</body>
</html>