package web;

import java.io.IOException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dataAccess.DAO;
import metier.Actor;
import metier.Director;
import metier.Genre;
import metier.Movie;
import metier.Visitor;

@WebServlet("/myServlet")
public class myServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public myServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		String login = request.getParameter("login");
		String pwd = request.getParameter("pwd");
		Visitor visitor;
		Visitor admin;
		//session
		HttpSession session = request.getSession();
		
		
		if(request.getParameter("connect")!=null) {
			if(login.equals("admin") && dao.authentification(login, pwd)==true) 
			{
				//session admin
				if(session.getAttribute("admin") != null) admin = (Visitor) session.getAttribute("admin");
				else admin = new Visitor();
				
				admin.setLogin(login);
				String msgPanel = "Welcome Admin !";
				request.setAttribute("msgPanel", msgPanel);
				request.setAttribute("visitor", admin);
				request.getRequestDispatcher("/welcome.jsp").forward(request, response);
			}
			else if (dao.authentification(login, pwd)==true)
			{
				//session visitor
				if(session.getAttribute("visitor")!=null) visitor = (Visitor) session.getAttribute("visitor");
				else visitor = new Visitor();
				
				visitor.setLogin(login);
				String msgPanel = "Welcome "+login+" !";
				request.setAttribute("msgPanel", msgPanel);
				request.setAttribute("visitor", visitor);
				request.getRequestDispatcher("/welcome.jsp").forward(request, response);
			}
			else if (dao.authentification(login, pwd)==false)
			{
				String msgPanel = "Login ou mot de passe incorrect !";
				request.setAttribute("msgPanel", msgPanel);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}
		
		//inscription
		
		if(request.getParameter("signup")!=null) {
			login = request.getParameter("login");
			pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String confirme = request.getParameter("confirm");
			
			String signed = dao.signUp(login, name, pwd, confirme);
			
			request.setAttribute("signed", signed);
			request.setAttribute("login", login);
			if(signed.equals("Connectez-vous "+login+" !")) {
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/signup.jsp").forward(request, response);
			}
		}
		
		//DELETE MOVIE
		if(request.getParameter("deleteMovie") != null) {
			String idMovie = request.getParameter("idMovie");
			String deleted = dao.deleteMovie(idMovie);
			request.setAttribute("deleted", deleted);
			request.setAttribute("user", "admin");
			request.getRequestDispatcher("/movies.jsp").forward(request, response);
			
		}
		
		//update movie
		
		if(request.getParameter("updateMovie") != null) {
			String idM = request.getParameter("idfilm");
			String title = request.getParameter("mtitle");
			String date = request.getParameter("dateSortie");
			String genre = request.getParameter("genre");
			String director = request.getParameter("director");
			String actor = request.getParameter("actor");
			String poster = request.getParameter("poster");
			
			String updated = dao.updateMovie(idM, title, date, director, genre, actor, poster);
			request.setAttribute("user", "admin");
			request.setAttribute("updated", updated);
			request.setAttribute("idMovie", idM);
			request.getRequestDispatcher("/updateMovie.jsp").forward(request, response);
		}
		
		//Search movie
		if(request.getParameter("findMovie") != null){
			String title = request.getParameter("movieTitle");
			String genre = request.getParameter("genre");
			String user = request.getParameter("theUser");
			Movie movie = dao.findMovie(title);
			String found = null;
			ArrayList<Movie>movies = new ArrayList<Movie>();
			
			
			if(genre != null && movie.getTitle() == null) {
				if(genre.equals("default")) {
					movies = dao.listeMovies();
				}else {
				movies = dao.movieByGenre(genre);
				
				Genre gr = dao.getGenre(genre);
				if(movies.isEmpty()) {
					found = "Films de genre <strong>"+gr.getGenreType()+"</strong> non trouvé!";
					request.setAttribute("foundMovie", found);
				}}
				request.setAttribute("movieGenre", movies);
			
			}else if(movie.getTitle() != null) {
				
				
				if (movie.getTitle() == null) {
					found = "Film : <strong>"+title+"</strong> non trouvé!";
				}
				request.setAttribute("foundMovie", found);
				request.setAttribute("idFilm", movie.getMovieId());
			}
			request.setAttribute("user", user);
			request.getRequestDispatcher("/movies.jsp").forward(request, response);
			
		}
		
		//SEARCH DIRECTOR
		
		if(request.getParameter("findDirector") != null) {
			String dName = request.getParameter("dname");
			String user = request.getParameter("theUser");
			
			Director director = dao.findDirector(dName);
			
			if(director.getDirectorName()== null) {
				String found = "Directeur : <strong>"+dName+"</strong> non trouvé!";
				request.setAttribute("foundDirector", found);
			}
			
			request.setAttribute("user", user);
			request.setAttribute("director", director);
			request.getRequestDispatcher("/directors.jsp").forward(request, response);
		}
	
		//ADD movie
		if (request.getParameter("addMovie") != null) {
			String idM = request.getParameter("idfilm");
			String title = request.getParameter("mtitle");
			String date = request.getParameter("dateSortie");
			String genre = request.getParameter("genre");
			String director = request.getParameter("director");
			String actor = request.getParameter("actor");
			String poster = request.getParameter("poster");
			
			String inserted = dao.addMovie(idM, title, date, director, genre, actor, poster);
			
			request.setAttribute("inserted", inserted);
			request.setAttribute("user", "admin");
			request.getRequestDispatcher("/movies.jsp").forward(request, response);
		}
		
		//ADD DIRECTOR
		if (request.getParameter("addDirector") != null) {
			String idD = request.getParameter("idDirector");
			String name = request.getParameter("dname");
			String nationality = request.getParameter("nationality");
			String image = request.getParameter("image");
			
			
			String inserted = dao.addDirector(idD, name, nationality, image);
			
			request.setAttribute("inserted", inserted);
			request.setAttribute("user", "admin");
			request.getRequestDispatcher("/directors.jsp").forward(request, response);
		}
			
		//UPDATE DIRECTOR
		if (request.getParameter("updateDirector") != null) {
			String idD = request.getParameter("idDirect");
			String dname = request.getParameter("dname");
			String nationality = request.getParameter("nationality");
			String image = request.getParameter("image");
			
			
			String updated = dao.updateDirector(idD, dname, nationality, image);
			
			request.setAttribute("updated", updated);
			request.setAttribute("user", "admin");
			request.setAttribute("idDirector", idD);
			request.getRequestDispatcher("/updateDirector.jsp").forward(request, response);
		}
		
		//DELETE DIRECTOR
		if(request.getParameter("deleteDirector") != null) {
			String id = request.getParameter("directorID");
			String deleted = dao.deleteDirector(id);
			
			request.setAttribute("user", "admin");
			request.setAttribute("deleted", deleted);
			
			request.getRequestDispatcher("/directors.jsp").forward(request, response);
		}
		
		//SEARCH Actor
		if(request.getParameter("findActor") != null) {
			String aName = request.getParameter("aname");
			String user = request.getParameter("theUser");
			
			Actor actor = dao.findActor(aName);
			
			if(actor.getActorName()== null) {
				String found = "Acteur : <strong>"+aName+"</strong> non trouvé!";
				request.setAttribute("foundActeur", found);
			}
			
			request.setAttribute("user", user);
			request.setAttribute("actor", actor);
			request.getRequestDispatcher("/actors.jsp").forward(request, response);
		}
		
		//ADD ACTOR
		if (request.getParameter("addActor") != null) {
			String id = request.getParameter("idActor");
			String name = request.getParameter("aname");
			String nationality = request.getParameter("nationality");
			String image = request.getParameter("image");
			
			
			String inserted = dao.addActor(id, name, nationality, image);
			
			request.setAttribute("inserted", inserted);
			request.setAttribute("user", "admin");
			request.getRequestDispatcher("/actors.jsp").forward(request, response);
		}
		
		//UPDATE DIRECTOR
		if (request.getParameter("updateActor") != null) {
			String id = request.getParameter("idActor");
			String name = request.getParameter("aname");
			String nationality = request.getParameter("nationality");
			String image = request.getParameter("image");
			
			
			String updated = dao.updateActor(id, name, nationality, image);
			
			request.setAttribute("updated", updated);
			request.setAttribute("user", "admin");
			request.setAttribute("idDirector", id);
			request.getRequestDispatcher("/updateActor.jsp").forward(request, response);
		}
		
		//Search movie
		if(request.getParameter("findMovieDirect") != null){
			String title = request.getParameter("movieTitle");
			String genre = request.getParameter("genre");
			String user = request.getParameter("theUser");
			String idDirect = request.getParameter("idDirect");
			Movie movie = dao.findMovieDirect(title, idDirect);
			ArrayList<Movie>movies = new ArrayList<Movie>();
			String found = null;
			
			if(genre != null && movie.getTitle() == null) {
				if(genre.equals("default")) {
					movies = dao.getMovieByDirector(idDirect);
				}else {
				movies = dao.movieByGenreDirector(genre, idDirect);
				Genre gr = dao.getGenre(genre);
				if(movies.isEmpty()) {
					found = "Films de genre <strong>"+gr.getGenreType()+"</strong> non trouvé!";
					request.setAttribute("foundMovie", found);
				}}
				request.setAttribute("movieGenre", movies);
			
			}else if(movie.getTitle() != null) {
				
				
				if (movie.getTitle() == null) {
					found = "Film : <strong>"+title+"</strong> non trouvé!";
				}
				request.setAttribute("foundMovie", found);
				request.setAttribute("idFilm", movie.getMovieId());
			}
			request.setAttribute("id", idDirect);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/dmore.jsp").forward(request, response);
			
		}
		
		//Search movie
		if(request.getParameter("findMovieActor") != null){
			String title = request.getParameter("movieTitle");
			String genre = request.getParameter("genre");
			String user = request.getParameter("theUser");
			String idActor = request.getParameter("idActor");
			Movie movie = dao.findMovieByActorTitle(idActor, title);
			String found = null;
			ArrayList<Movie>movies = new ArrayList<Movie>();
			if(genre != null && movie.getTitle() == null) {
				if(genre.equals("default")) {
					movies = dao.getMovieByActor(idActor);
				}else {
				movies = dao.movieByGenreActor(genre, idActor);
				Genre gr = dao.getGenre(genre);
				if(movies.isEmpty()) {
					found = "Films de genre <strong>"+gr.getGenreType()+"</strong> non trouvé!";
					request.setAttribute("foundMovie", found);
				}}
				request.setAttribute("movieGenre", movies);
			
			}else if(movie.getTitle() != null) {
				
				
				if (movie.getTitle() == null) {
					found = "Film : <strong>"+title+"</strong> non trouvé!";
				}
				request.setAttribute("foundMovie", found);
				request.setAttribute("idFilm", movie.getMovieId());
			}
			request.setAttribute("id", idActor);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/amore.jsp").forward(request, response);
			
		}
		
		//ADD GEENRE
		if (request.getParameter("addGenre") != null) {
			String id = request.getParameter("idGenre");
			String genre = request.getParameter("genreType");
			
			
			String inserted = dao.addGenre(id, genre);
			
			request.setAttribute("inserted", inserted);
			request.setAttribute("user", "admin");
			request.getRequestDispatcher("/movies.jsp").forward(request, response);
		}
		
	}
	
	

}
