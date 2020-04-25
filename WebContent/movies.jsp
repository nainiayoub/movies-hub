<%@page import="metier.Genre"%>
<%@page import="metier.Actor"%>
<%@page import="metier.Director"%>
<%@page import="metier.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dataAccess.DAO"%>
<%@page import="metier.Visitor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movies list</title>
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
<!-- NAV BAR -->
<% 


	String visitor = request.getParameter("user");
	if(visitor == null){
		visitor = (String)request.getAttribute("user");
	}
	String deleted = (String)request.getAttribute("deleted");
	String updated = (String)request.getAttribute("updated");
	String found = (String)request.getAttribute("foundMovie");
	String inserted = (String)request.getAttribute("inserted");
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
      <li><a href=<%="directors.jsp?user="+visitor %>>Directors</a></li>
      <li><a href=<%="actors.jsp?user="+visitor %>>Actors</a></li>
      
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
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Se deconnecter</a></li>
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
	            	Recherchez Film
	            </div>
	                <div class="panel-body">
	                    <form method="post" action="myServlet" class="form-inline">
	                        <div class="form-group">
	                            <input type="text" name="movieTitle" placeholder="Titre du film" class="form-control">
	                        </div>
	                        <div class="form-group">
								<label for="genre">Genre :</label>
				                <select name="genre" class="form-control" id="genre" >
				                	<option value="default" selected>Par défaut</option>
				                <%
				                DAO dao = new DAO();
				                ArrayList<Genre>genres = new ArrayList<Genre>();
									genres = dao.listeGenres();
									for(Genre g:genres){
								%>
				                    <option value="<%=g.getGenreId() %>" >
				                    <%=g.getGenreType() %>
				                    </option>
				               <%} %>
				               </select>
			                </div>
			                <input type="hidden" name="theUser" value="<%=visitor%>">
			                &nbsp &nbsp;
	                        <button type="submit" class="btn btn-success" name="findMovie">
	                        	<span class="glyphicon glyphicon-search"></span> 
	                            Rechercher..
	                        </button>
	                        
	                       &nbsp &nbsp;
	                       <% if(visitor.equals("admin")){ %>
                       	       <a href="addMovie.jsp"><span class="glyphicon glyphicon-plus"></span> Ajouter Film</a><br><br>
                       	       <a href="addGenre.jsp"><span class="glyphicon glyphicon-plus"></span> Ajouter Genre</a>
	                        <%} %>
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
             <!-- Message de suppression -->
             <%if(deleted != null){ %>
	         <div class="alert alert-danger alert-dismissible ">
    		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
   				 <center><strong><%=deleted %> </strong> a été supprimé! </center>
 			 </div>
	         <%} %>
	         
	         <!-- Message d'edition -->
	         <%if(updated != null){ %>
	         <div class="alert alert-success alert-dismissible ">
    		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
   				 <center><%=updated %>  </center>
 			 </div>
	         <%} %>
	         
	         <!--  Message d'insertion  -->
	         <%if(inserted != null){ %>
	         <div class="alert alert-success alert-dismissible ">
    		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
   				 <center><%=inserted %>  </center>
 			 </div>
	         <%} %>
	         
                <div class="panel-body">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
								<th>Id</th>
								<th>Titre</th>
								<th>Poster</th>
								<th>Date de sortie</th>
								<th>Genre</th>
								
								<th>Directeur</th>
								<th>Acteur</th>
								<% if(visitor.equals("admin")){ %>
								<th style="" colspan="2">Actions</th>
								<%} %>
							</tr>
                        </thead>
                        <tbody>
                         <%if(found != null){ %>
                         
		        			 <div class="alert alert-danger alert-dismissible ">
	    		 			 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	   						 <center><%=found %> </center>
	 						 </div>
	 					 
	        			 <%} %>
       <%
       
       Director director= new Director();
       Actor actor = new Actor();
       Genre genre = new Genre();
       
       String idfilm = (String)request.getAttribute("idFilm");
       if (idfilm != null){
    	   Movie film = dao.getMovieInfo(idfilm);
    	   director = dao.getDirector(film.getdId());
   		actor = dao.getActor(film.getAid());
   		genre = dao.getGenre(film.getgId());
       
        %>
        
        <tr>
								<td><%=film.getMovieId() %></td>
								<td><%=film.getTitle() %></td>
								<td style=""><img alt="poster" src="<%=film.getPoster()%>" width="60px" height="100px" class="img-thumbnail"></td>
								
								<td><%=film.getDate() %></td>
								<td><%=genre.getGenreType() %></td>
								<td><%=director.getDirectorName() %></td>
								<td><%=actor.getActorName() %></td>
								<% if(visitor.equals("admin")){ %>
								<!-- EDIT -->
								<% if(visitor.equals("admin")){ %>
								<td style="">
									<a href=<%="updateMovie.jsp?idM="+film.getMovieId() %>>
									<span class="glyphicon glyphicon-edit">modifier</span></a>
                                    
								</td>
								<!-- DELETE -->
								<td style="">
								<a href=<%="deleteMovie.jsp?idM="+film.getMovieId()+"&mvImg="+film.getPoster() %>>
									<span class="glyphicon glyphicon-trash text-danger">supprimer</span></a>
									
								</td>
								<%}}
								
								
        }else{
	   ArrayList<Movie>movies = (ArrayList<Movie>)request.getAttribute("movieGenre");
       
	   if(movies == null){
		   movies = dao.listeMovies();
	   }
	   for(Movie movie: movies){
	   
		director = dao.getDirector(movie.getdId());
		actor = dao.getActor(movie.getAid());
		genre = dao.getGenre(movie.getgId());
		
		%>
					
							<tr>
								<td><%=movie.getMovieId() %></td>
								<td><%=movie.getTitle() %></td>
								<td style=""><img alt="poster" src="<%=movie.getPoster()%>" width="60px" height="100px" class="img-thumbnail"></td>
								
								<td><%=movie.getDate() %></td>
								<td><%=genre.getGenreType() %></td>
								<td><%=director.getDirectorName() %></td>
								<td><%=actor.getActorName() %></td>
								<% if(visitor.equals("admin")){ %>
								<!-- EDIT -->
								<td style="">
									<a href=<%="updateMovie.jsp?idM="+movie.getMovieId() %>>
									<span class="glyphicon glyphicon-edit">modifier</span></a>
                                    
								</td>
								<!-- DELETE -->
								<td style="">
								<a href=<%="deleteMovie.jsp?idM="+movie.getMovieId()+"&mvImg="+movie.getPoster() %>>
									<span class="glyphicon glyphicon-trash text-danger">supprimer</span></a>
									
								</td>
								<%}%>
							</tr>	
							<%}}%>
			           </tbody>
	                </table>
                    
        </div>
	
	</div>
</body>
</html>