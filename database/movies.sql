CREATE TABLE Genre(
GenreID varchar(10) NOT NULL PRIMARY KEY,
GenreType varchar(30) NOT NULL
);

-- DROP TABLE Director;
CREATE TABLE Director(
DirectorID varchar(10) NOT NULL PRIMARY KEY,
DirectorName varchar(30) NOT NULL,
DirectoryNationality varchar(30) NOT NULL
);


CREATE TABLE Actor(
ActorID varchar(10) NOT NULL PRIMARY KEY,
ActorName varchar(30) NOT NULL,
ActorNationality varchar(30) NOT NULL
);

-- DROP TABLE Movie;
CREATE TABLE Movie (
MovieID varchar(10) NOT NULL PRIMARY KEY,
MovieTitle varchar (30) NOT NULL,
ReleaseDate DATE NOT NULL,
GenreID varchar(10),
DirectorID varchar (10), 
leadActor varchar(10),
FOREIGN KEY (GenreID) References Genre(GenreID),
FOREIGN KEY (DirectorID) References Director(DirectorID),
FOREIGN KEY (leadActor) References Actor(ActorID)
);

CREATE TABLE visitor(
visitorID int NOT NULL,
login varchar(40) NOT NULL PRIMARY KEY,
name varchar(40) NOT NULL,
pwd varchar(30) NOT NULL
);

INSERT INTO visitor VALUES
                (1,'admin','administrator','admin1234'),
                (2,'nainia','ayoubnainia','1234');


INSERT INTO Genre VALUES 
				('G01', 'Action'),
				('G02', 'Comedy'),
				('G03', 'Thriller'),
				('G04', 'Drama'),
				('G05', 'Crime');
                
INSERT INTO Actor VALUES
                ('A01', 'Robert De Niro', 'American'),
                ('A02', 'Leonardo DiCaprio', 'American'),
                ('A03', 'Denzel Washington', 'American'),
                ('A04', 'Samuel L. Jackson', 'American'),
                ('A05', 'Brad Pitt', 'American'),
                ('A06', 'Samuel L. Jackson', 'American'),
                ('A07', 'Edward Norton', 'American');

INSERT INTO Director VALUES 
					('D01', 'Martin Scorsese', 'American'),
					('D02', 'Quentin Tarantino', 'American'),
					('D03', 'Alfred Hitchcock', 'English'),
					('D04', 'Stanley Kubrick', 'American'),
					('D05', 'Woody Allen ', 'American'),
                    ('D06', 'Woody Allen ', 'American'),
					('D07', 'David Fincher', 'American');
					

INSERT INTO Movie VALUES 
    				('M01', 'Taxi Driver', '1976-02-08', 'G03', 'D01','A01','https://cdn.shopify.com/s/files/1/1416/8662/products/taxi_driver_1976_original_film_art_f_50a2b193-29c6-442b-ac7b-e7b26b6fdff6_2000x.jpg?v=1575083709'),
                    ('M02', 'Pulp Fiction', '1994-05-24', 'G05', 'D02','A04','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRz_2nKTNlxhVtzbh29kgL3m2ebLv3TlYyzrbyqBtEUxt6mBuZ-'),
    				('M03', 'Fight Club', '1999-09-10', 'G05', 'D07', 'A07','https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg'),
                    ('M04', 'GoodFellas', '1990-12-12', 'G05', 'D01', 'A01', 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg');
    				
                    
