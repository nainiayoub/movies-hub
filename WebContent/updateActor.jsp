<%@page import="metier.Actor"%>
<%@page import="dataAccess.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier Acteur</title>
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
	String idActeur = request.getParameter("idActor");
	if(idActeur == null){
		idActeur = (String)request.getAttribute("idActor");
	}
	//visitor
	String visitor = "admin";
	String updated = (String)request.getAttribute("updated");
	
	DAO dao = new DAO();
	
	Actor actor = new Actor();
	actor = dao.getActor(idActeur);
%>

<!-- navbar -->
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
      <li><a href=<%="directors.jsp?user="+visitor %>>Directors</a></li>
      <li class="active"><a href=<%="actors.jsp?user="+visitor %>>Actors</a></li>
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

<!-- Formulaire d'edition -->

<!-- EDIT FORM -->
<div class="container" style="margin-top:110px;">
	<div class="panel panel-default">
		<div class="panel-heading" style="font-weight: bold; text-align: center; font: 700 1.7em/1.1 Noe,georgia,serif;">
		Modifier - <svg class="bi bi-film" width="0.9em" height="0.9em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 1a1 1 0 011-1h14a1 1 0 011 1v14a1 1 0 01-1 1H1a1 1 0 01-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z" clip-rule="evenodd"/>
</svg> - <%=actor.getActorName()%></div>
			
			<!-- Update Message -->
			
			
	         
		<div class="panel-body">
			<%if(updated != null){ %>
	         <div class="alert alert-success alert-dismissible ">
    		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
   				 <center><%=updated %>  </center>
 			 </div>
	         <%} %>
			<form method="post" action="myServlet" class="form">
				<table width="100%">
				<tr>
				<td width="80%" style="text-align: left">
				<div class="form-group">
					<label for="idActor">ID Acteur: <%=actor.getActorId()%></label>
					<input type="hidden" name="idActor" placeholder="ID Directeur" class="form-control" value="<%=actor.getActorId()%>">
				</div>
				
				<div class="form-group">
					<label for="aname">Acteur : </label>
					<input type="text" name="aname" value="<%=actor.getActorName() %>" placeholder="Nom et Prénom d'Acteur" class="form-control">
				</div>
						
			   	<div class="form-group">
			    	<label for="nationality">Nationalité : </label>
					<input type="text" name="nationality" value="<%=actor.getActorNationality() %>" placeholder="Nationalité" class="form-control">
				</div>	
				<div class="form-group">
			    	<label for="poster">Image de l'Acteur : </label>
					<input type="text" name="image" value="<%=actor.getImage() %>" placeholder="Lien d'image en ligne de l'Acteur" class="form-control">
				</div>	
				</td>
				<td style="padding-right: ">
				<img alt="<%=actor.getActorName()%>" src="<%=actor.getImage()%>" class="img-thumbnail" width="210px" height="320px" style="float: right;dispaly: inline-block; border: 2px solid #333"/>		
				</td>
				</tr>
				</table>
				
			
				<button type="submit" class="btn btn-success" name="updateActor">
                     <span class="glyphicon glyphicon-save"></span> 
                     Update
                </button>
                <a href=<%="actors.jsp?user="+visitor%> class="btn btn-danger" >
                     Annuler
                </a>
				
			</form>
		
		
		</div>
	</div>


</div>


</body>
</html>