<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <title>Welcome</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="styleHead.css">
   
        <style>
	  	<%@include file="style/styleHead.css" %>
            body{
                font: 400 1em/1.5 "neuton";
                background-color: #090d00;
                color: rgba(255,255,255,0.25);
                text-align: center;
                margin: 0;
            }
        
        </style>
    
    </head>
    <body>
        <h1 style="" class="neon" data-text="Movies Hub">Movies Hub</h1>
        <center>
            <a class="login" href="login.jsp">Connectez-vous</a>
            <a class="Signup" href="signup.jsp">Inscrivez-vous</a>
        </center>
        <canvas  id="clapperboard-canvas" width="400px" height="400px">
</canvas>
        
    </body>
</html>