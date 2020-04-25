<%@page import="java.util.ArrayList"%>
<%@page import="metier.Actor"%>
<%@page import="dataAccess.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acteurs</title>
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
	DAO dao = new DAO();
	
	String deleted = (String)request.getAttribute("deleted");
	String updated = (String)request.getAttribute("updated");
	String found = (String)request.getAttribute("foundActor");
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

<!-- Formulairs + Table -->

<div class="container" style="margin-top:80px; background-color: #fff">	
		&nbsp
			<!-- Search -->
		<div class="panel panel-default " style="text-align: center">
		
	            <div class="panel-heading " style=" font-weight: bold;">
	            	Recherchez Acteur
	            </div>
	                <div class="panel-body">
	                    <form method="post" action="myServlet" class="form-inline">
	                        <div class="form-group">
	                            <input type="text" name="aname" placeholder="Nom Acteur" class="form-control" required>
	                        </div>
	                        
			                <input type="hidden" name="theUser" value="<%=visitor%>">
			                &nbsp &nbsp;
	                        <button type="submit" class="btn btn-success" name="findActor">
	                        	<span class="glyphicon glyphicon-search"></span> 
	                            Rechercher..
	                        </button>
	                        
	                       &nbsp &nbsp;
	                       <% if(visitor.equals("admin")){ %>
                       	       <a href="addActor.jsp"><span class="glyphicon glyphicon-plus"></span> Ajouter Acteur</a>
	                        <%} %>
	                    </form>
	                </div>
	        </div>
	        
	        <!-- Movie list -->
	       
	        <div class="panel panel-deafult" style="border: 1px solid #333" >
            <div class="panel-heading" style="font-weight: bold;color: #fff; font-size: 17px;background-color: #333; text-align: center">
            		Acteurs - <svg class="bi bi-film" width="0.9em" height="0.9em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 1a1 1 0 011-1h14a1 1 0 011 1v14a1 1 0 01-1 1H1a1 1 0 01-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z" clip-rule="evenodd"/>
</svg>
             </div>
             <!-- Message de suppression -->
             <%if(deleted != null){ %>
	         <div class="alert alert-danger alert-dismissible ">
    		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
   				 <center>Acteur : <strong><%=deleted %> </strong>  ont été supprimé. </center>
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
								<th>Nom</th>
								<th>Image</th>
								<th>Nationalité</th>
								
								
								<th style="width: 20%" colspan="2" >Actions</th>
								
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
       
       Actor actor = (Actor)request.getAttribute("actor");
       
       //String idDirector = (String)request.getAttribute("idDirecteur");
       if (actor != null && actor.getActorName() != null){
       %>
        
        <tr>
			<td><%=actor.getActorId() %></td>
			<td><%=actor.getActorName() %></td>
			<td style=""><img alt="poster" src="<%=actor.getImage() %>" width="60px" height="100px" class="img-thumbnail"></td>
			
			<td><%=actor.getActorNationality()%></td>
			
			<!-- MODIFIER -->
			
			<% if(visitor.equals("admin")){ %>
			<td style="">
				<a href=<%="updateActor.jsp?idActor="+actor.getActorId() %>>
				<span class="glyphicon glyphicon-edit">modifier</span></a>
                               
			</td>
			
			<%}%>
			
			<!-- VOIR -->
			
			<td style="">
			<a href=<%="amore.jsp?user="+visitor+"&id="+actor.getActorId()%>>
				<span class="glyphicon glyphicon-check text-success">More</span></a>
				
			</td>
			
			
			<%
								
        }else{
        	ArrayList<Actor> actors = dao.listeActors();
		   
	   
	   for(Actor a: actors){
	   
		
		
		%>
					
							<tr>
								<td><%=a.getActorId() %></td>
								<td><%=a.getActorName() %></td>
								<td style=""><img alt="image" src="<%=a.getImage() %>" width="60px" height="100px" class="img-thumbnail"></td>
								
								<td><%=a.getActorName() %></td>
								
								<!-- MODIFIER -->
			
								<% if(visitor.equals("admin")){ %>
								<td style="">
									<a href=<%="updateActor.jsp?idActor="+a.getActorId() %>>
									<span class="glyphicon glyphicon-edit">modifier</span></a>
					                               
								</td>
								
								<%}%>
								
								<!-- VIEW -->
								<td style="">
									<a href=<%="amore.jsp?user="+visitor+"&id="+a.getActorId()%>>
									<span class="glyphicon glyphicon-check text-success">More</span></a>
                                    
								</td>
								
								<%%>
							</tr>	
							<%}}%>
			           </tbody>
	                </table>
                    
        </div>
	
	</div>
</body>
</html>