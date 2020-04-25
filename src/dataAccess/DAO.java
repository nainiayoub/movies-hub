package dataAccess;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import metier.Actor;
import metier.Director;
import metier.Genre;
import metier.Movie;

public class DAO {
Connection conn;
	
	// Connection

	public void connection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/movies-db", "root", "");
	}
	
	// Authentification
	
	public boolean authentification(String login, String pwd) {
		
		try 
		{
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT login, pwd FROM visitor");
			
			while(rs.next()) {
				if(login.equals(rs.getString("login")) && pwd.equals(rs.getString("pwd"))) {
					return true;
				}
			}
			
		} 
		catch (Exception e){
			
			e.printStackTrace();
		}
		
		return false;
	}
	
	public String signUp(String login, String name, String pwd, String confirme) {
		try {
			connection();
			Statement stm = conn.createStatement();
			
			if(pwd.equals(confirme)) {
				int r = stm.executeUpdate
				("INSERT INTO visitor (login, name, pwd) VALUES ('"+login+"','"+name+"','"+pwd+"')");
			}else {
				return "<strong>Réessayer!</strong> Les mots de passe ne correspondent pas. ";
			}
			
			ResultSet rs = stm.executeQuery("SELECT * FROM visitor where login = '"+login+"'");
			
			while(rs.next()) {
				
					if(login.equals(rs.getString("login"))) {
						return "Connectez-vous "+login+" !";
					}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "<strong>Réessayer!</strong> Login existe deja.";
	}
	
	//Movies list
	public ArrayList<Movie> listeMovies(){
		ArrayList<Movie> listeMovies = new ArrayList<Movie>();
		
		try
		{
			
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM movie");
			
			while(rs.next()) {
				Movie movie = new Movie();
				
				movie.setMovieId(rs.getString("MovieID"));
				movie.setTitle(rs.getString("MovieTitle"));
				movie.setDate(rs.getString("ReleaseDate"));
				movie.setgId(rs.getString("GenreID"));
				movie.setdId(rs.getString("DirectorID"));
				movie.setAid(rs.getString("leadActor"));
				movie.setPoster(rs.getString("poster"));
				
				
				listeMovies.add(movie);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return listeMovies;
	}
	
	//Actor list
	public ArrayList<Actor> listeActors(){
		ArrayList<Actor> listeActors = new ArrayList<Actor>();
		
		try
		{
			
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM actor");
			
			while(rs.next()) {
				Actor actor = new Actor();
				
				actor.setActorId(rs.getString("ActorID"));
				actor.setActorName(rs.getString("ActorName"));
				actor.setActorNationality(rs.getString("ActorNationality"));
				actor.setImage(rs.getString("Image"));
				
				
				listeActors.add(actor);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return listeActors;
	}
	
	//Directors list
	public ArrayList<Director> listeDirectors(){
		ArrayList<Director> listeDirectors = new ArrayList<Director>();
		
		try
		{
			
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM director");
			
			while(rs.next()) {
				Director director = new Director();
				
				director.setDirectorId(rs.getString("DirectorID"));
				director.setDirectorName(rs.getString("DirectorName"));
				director.setDirectorNat(rs.getString("DirectorNationality"));
				director.setImage(rs.getString("Image"));
				
				
				listeDirectors.add(director);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return listeDirectors;
	}
	
	public ArrayList<Genre> listeGenres(){
		ArrayList<Genre> listeGenres = new ArrayList<Genre>();
		
		try
		{
			
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM genre");
			
			while(rs.next()) {
				Genre genre = new Genre();
				
				genre.setGenreId(rs.getString("GenreID"));
				genre.setGenreType(rs.getString("GenreType"));
				
				
				listeGenres.add(genre);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return listeGenres;
	}
	
	
	//Director Info
	public Director getDirector(String id) {
		Director director = new Director();
		try {
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM director WHERE DirectorID = '"+id+"'");
			
			while(rs.next()) {
				director.setDirectorId(rs.getString("DirectorID"));
				director.setDirectorName(rs.getString("DirectorName"));
				director.setDirectorNat(rs.getString("DirectorNationality"));
				director.setImage(rs.getString("Image"));
			}
			return director;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return director;
	}
	
	//Actor Info
	public Actor getActor(String id) {
		Actor actor = new Actor();
		try {
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM actor WHERE ActorID = '"+id+"'");
			
			while(rs.next()) {
				actor.setActorId(rs.getString("ActorID"));
				actor.setActorName(rs.getString("ActorName"));
				actor.setActorNationality(rs.getString("ActorNationality"));
				actor.setImage(rs.getString("Image"));
				
			}
			return actor;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return actor;
	}
	
	// Genre Info
	public Genre getGenre(String id) {
		Genre genre = new Genre();
		try {
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM genre WHERE GenreID = '"+id+"'");
			
			while(rs.next()) {
				genre.setGenreId(rs.getString("GenreID"));
				genre.setGenreType(rs.getString("GenreType"));
			}
			return genre;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return genre;
	}
	
	//genre by name
	public Genre genreByName(String genreType) {
		Genre genre = new Genre();
		try {
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM genre WHERE GenreID = '"+genreType+"'");
			
			while(rs.next()) {
				genre.setGenreId(rs.getString("GenreID"));
				genre.setGenreType(rs.getString("GenreType"));
			}
			return genre;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return genre;
	}
	
	// MOVIE INFO
		public Movie getMovieInfo(String id) {
			Movie movie = new Movie();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE MovieID = '"+id+"'");
				
				while(rs.next()) {
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return movie;
		}
	
	//DELETE MOVIE
	public String deleteMovie(String movieID) {
		Movie movie = new Movie();
		try {
			
			connection();
			Statement stm = conn.createStatement();
			ResultSet rset = stm.executeQuery("SELECT * FROM movie WHERE MovieID = '"+movieID+"'");
			
			while(rset.next()) {
				movie.setTitle(rset.getString("MovieTitle"));
			}
			
			int rs = stm.executeUpdate("DELETE FROM movie WHERE MovieID = '"+movieID+"' ");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return movie.getTitle();
	}
	
	//Update Movie
	public String updateMovie(String idM, String title, String date, String director, String genre, String actor, String poster) {
		try {
			connection();
			Statement stm = conn.createStatement();
			int up = stm.executeUpdate("UPDATE movie SET MovieID = '"+idM+"', MovieTitle = '"+title+"', ReleaseDate = '"+date+"', GenreID = '"+genre+"', DirectorID = '"+director+"', leadActor = '"+actor+"', poster = '"+poster+"' WHERE MovieID = '"+idM+"'");
			
			return "Le film : <strong>"+title+"</strong> a été modifié!";
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "Modification échouée!";
	}
	// FIND MOVIE 
	public Movie findMovie(String title) {
		Movie movie = new Movie();
		try {
			connection();
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE MovieTitle = '"+title+"'");
			
			while(rs.next()) {
				movie.setMovieId(rs.getString("MovieID"));
				movie.setTitle(rs.getString("MovieTitle"));
				movie.setDate(rs.getString("ReleaseDate"));
				movie.setgId(rs.getString("GenreID"));
				movie.setdId(rs.getString("DirectorID"));
				movie.setAid(rs.getString("leadActor"));
				movie.setPoster(rs.getString("poster"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
				
				return movie;
	}
	
	//Movies by genre
	//Movies list
		public ArrayList<Movie> movieByGenre(String genre){
			ArrayList<Movie> listeMovies = new ArrayList<Movie>();
			
			try
			{
				
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE GenreID = '"+genre+"'");
				
				while(rs.next()) {
					Movie movie = new Movie();
					
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
					
					listeMovies.add(movie);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return listeMovies;
		}
	
		public Movie getLastMovieRow() {
			Movie movie = new Movie();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie ORDER BY MovieID DESC LIMIT 1");
				while(rs.next()) {
					
					
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return movie;
		}
		
		//ADD Movie
		public String addMovie(String idM, String title, String date, String director, String genre, String actor, String poster) {
			try {
				connection();
				Statement stm = conn.createStatement();
				int up = stm.executeUpdate("INSERT INTO movie VALUES ('"+idM+"','"+title+"','"+date+"','"+genre+"','"+director+"','"+actor+"','"+poster+"')");
				
				return "Nouveau film : <strong>"+title+"</strong> a été ajouté!";
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "Insertion échouée!";
		}
		
		//FIND DIRECTOR
		public Director findDirector(String name) {
			Director director = new Director();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM director WHERE DirectorName = '"+name+"'");
				
				while(rs.next()) {
					director.setDirectorId(rs.getString("DirectorID"));
					director.setDirectorName(rs.getString("DirectorName"));
					director.setDirectorNat(rs.getString("DirectorNationality"));
					director.setImage(rs.getString("Image"));
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
					
					return director;
		}
		
		//Director last row
		public Director getLastDirector() {
			Director director = new Director();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM director ORDER BY DirectorID DESC LIMIT 1");
				while(rs.next()) {
					
					director.setDirectorId(rs.getString("DirectorID"));
					director.setDirectorName(rs.getString("DirectorName"));
					director.setDirectorNat(rs.getString("Image"));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return director;
		}
			
		//ADD DIRECTOR
		
		public String addDirector(String idD, String name, String nationality, String image) {
			try {
				connection();
				Statement stm = conn.createStatement();
				int up = stm.executeUpdate("INSERT INTO director VALUES ('"+idD+"','"+name+"','"+nationality+"','"+image+"')");
				
				return "Nouveau Directeur : <strong>"+name+"</strong> a été ajouté!";
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "Insertion échouée!";
		}
		
		//Update Director
		public String updateDirector(String idD, String dname, String nationality, String image) {
			try {
				connection();
				Statement stm = conn.createStatement();
				int up = stm.executeUpdate("UPDATE director SET DirectorID = '"+idD+"', DirectorName = '"+dname+"', DirectorNationality = '"+nationality+"', Image = '"+image+"' WHERE DirectorID = '"+idD+"'");
				
				return "Le Directeur : <strong>"+dname+"</strong> a été modifié!";
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "Modification échouée!";
		}
		
		
		//GET MOVIE BY DIRECTOR
		public ArrayList<Movie> getMovieByDirector(String id) {
			ArrayList<Movie>movies = new ArrayList<Movie>();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE DirectorID = '"+id+"'");
				
				while(rs.next()) {
					Movie movie = new Movie();
					
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
					movies.add(movie);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return movies;
		}
		
		public String deleteDirector(String id) {
			Director director = new Director();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rset = stm.executeQuery("SELECT * FROM director WHERE DirectorID = '"+id+"'");
				
				while(rset.next()) {
					director.setDirectorName(rset.getString("DirectorName"));;
				}
				
				int rs = stm.executeUpdate("DELETE FROM movie WHERE DirectorID = '"+id+"' ");
				rs = stm.executeUpdate("DELETE FROM director WHERE DirectorID = '"+id+"'");
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return director.getDirectorName()+" et ses Films";
		}
		
		// FIND ACTOR 
		public Actor findActor(String name) {
			Actor actor = new Actor();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM actor WHERE ActorName = '"+name+"'");
				
				while(rs.next()) {
					actor.setActorId(rs.getString("ActorID"));
					actor.setActorName(rs.getString("ActorName"));
					actor.setActorNationality(rs.getString("ActorNationality"));
					actor.setImage(rs.getString("Image"));
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
					
					return actor;
		}
		
		//GET LAST ACTOR
		public Actor getLastActorRow() {
			Actor actor = new Actor();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM actor ORDER BY ActorID DESC LIMIT 1");
				while(rs.next()) {
					
					actor.setActorId(rs.getString("ActorID"));
					actor.setActorName(rs.getString("ActorName"));
					actor.setActorNationality(rs.getString("ActorNationality"));
					actor.setImage(rs.getString("Image"));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return actor;
		}
		
		//ADD DIRECTOR
		
		public String addActor(String id, String name, String nationality, String image) {
			try {
				connection();
				Statement stm = conn.createStatement();
				int up = stm.executeUpdate("INSERT INTO actor VALUES ('"+id+"','"+name+"','"+nationality+"','"+image+"')");
				
				return "Nouveau Acteur : <strong>"+name+"</strong> a été ajouté!";
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "Insertion échouée!";
		}
		
		//Update Director
		public String updateActor(String id, String name, String nationality, String image) {
			try {
				connection();
				Statement stm = conn.createStatement();
				int up = stm.executeUpdate("UPDATE actor SET ActorID = '"+id+"', ActorName = '"+name+"', ActorNationality = '"+nationality+"', Image = '"+image+"' WHERE ActorID = '"+id+"'");
				
				return "L'Acteur : <strong>"+name+"</strong> a été modifié!";
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "Modification échouée!";
		}
		
		//GET MOVIE BY ACTOR
		public ArrayList<Movie> getMovieByActor(String id) {
			ArrayList<Movie>movies = new ArrayList<Movie>();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE leadActor = '"+id+"'");
				
				while(rs.next()) {
					Movie movie = new Movie();
					
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
					movies.add(movie);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return movies;
		}
		
		//Movies by genre and name
		//Movies list
		public ArrayList<Movie> movieByGenreDirector(String genre, String id){
			ArrayList<Movie> listeMovies = new ArrayList<Movie>();
			
			try
			{
				
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE GenreID = '"+genre+"' AND DirectorID='"+id+"'");
				
				while(rs.next()) {
					Movie movie = new Movie();
					
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
					
					listeMovies.add(movie);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}	
			return listeMovies;
		}
		
		// FIND MOVIE 
		public Movie findMovieDirect(String title, String id) {
			Movie movie = new Movie();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE MovieTitle = '"+title+"' AND DirectorID = '"+id+"'");
				
				while(rs.next()) {
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
					
					return movie;
		}
		
		//FIND MOVIE BY TITLE AND ACTOR
		//GET MOVIE BY ACTOR
		public Movie findMovieByActorTitle(String id, String title) {
			Movie movie = new Movie();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE leadActor = '"+id+"' AND MovieTitle = '"+title+"'");
				
				while(rs.next()) {
					
					
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return movie;
		}
		
		//find movie by genre and actor
		public ArrayList<Movie> movieByGenreActor(String genre, String id){
			ArrayList<Movie> listeMovies = new ArrayList<Movie>();
			
			try
			{
				
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM movie WHERE GenreID = '"+genre+"' AND leadActor='"+id+"'");
				
				while(rs.next()) {
					Movie movie = new Movie();
					
					movie.setMovieId(rs.getString("MovieID"));
					movie.setTitle(rs.getString("MovieTitle"));
					movie.setDate(rs.getString("ReleaseDate"));
					movie.setgId(rs.getString("GenreID"));
					movie.setdId(rs.getString("DirectorID"));
					movie.setAid(rs.getString("leadActor"));
					movie.setPoster(rs.getString("poster"));
					
					
					listeMovies.add(movie);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}	
			return listeMovies;
		}
		
		//GET LAST Genre
		public Genre getLastGenreRow() {
			Genre genre = new Genre();
			try {
				connection();
				Statement stm = conn.createStatement();
				ResultSet rs = stm.executeQuery("SELECT * FROM genre ORDER BY GenreID DESC LIMIT 1");
				while(rs.next()) {
					
					genre.setGenreId(rs.getString("GenreID"));
					genre.setGenreType(rs.getString("GenreType"));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return genre;
		}
		
		//ADD GENRE
		
		public String addGenre(String id, String genre) {
			try {
				connection();
				Statement stm = conn.createStatement();
				int up = stm.executeUpdate("INSERT INTO genre VALUES ('"+id+"','"+genre+"')");
				
				return "Nouveau Genre : <strong>"+genre+"</strong> a été ajouté!";
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "Insertion échouée!";
		}
		
}
