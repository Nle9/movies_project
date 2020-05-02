

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesproject/model/movie.dart';
import 'package:moviesproject/ui/movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I am legend",
    "300",
    "The Woft of Wall Street",
    "Interstellar",
    "Game of Throne",
    "Vikings",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children: <Widget>[
                 Positioned(
                     child: movieCard(movieList[index], context)),
                  Positioned(
                      top: 10.0,
                      child: movieImage(movieList[index].images[0])),
                ]);
//        return Card(
////          elevation: 4.5,
////          color: Colors.white,
////          child: ListTile(
////            leading: CircleAvatar(
////              child: Container(
////                width: 200,
////                height: 200,
////                decoration: BoxDecoration(
////                  image: DecorationImage(
////                    image: NetworkImage(movieList[index].images[0]),
////                    fit: BoxFit.cover
////                  ),
////                  borderRadius: BorderRadius.circular(13.9)
////                ),
////                child: Text("H"),
////
////              ),
////            ),
////            trailing: Text("..."),
////            title: Text(movieList[index].title),
////            subtitle: Text("${movieList[index].title}"),
////           // onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
////            onTap: () {
////              Navigator.push(context, MaterialPageRoute(
////                  builder: (context) => MovieListViewDetails(movieName: movieList.elementAt(index).title,
////                  movie: movieList[index])));
////            },
////          ),
//        );
      }

      )
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                     child: Text(movie.title, style:
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.white
                      ),),
                    ),

                  Text("Rating: ${movie.imdbRating} / 10",
                  style: mainTextStyle())
                    ],
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Release: ${movie.released}",
                          style: mainTextStyle()),
                      Text(movie.runtime,
                        style: mainTextStyle()),
                      Text(movie.rated,
                        style: mainTextStyle())
                    ],
                  )

                ],

              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MovieListViewDetails(movieName: movie.title,
                  movie: movie)))
  },
    );
  }
  TextStyle mainTextStyle(){
    return TextStyle(
      fontSize: 15.0,
      color: Colors.grey
    );
  }
  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://images-na.ssl-images-amazon.com/images/M/MV5BNzM2MDk3MTcyMV5BMl5BanBnXkFtZTcwNjg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg'),
        fit: BoxFit.cover)

      ),
    );
  }

}

class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        backgroundColor: Colors.blueGrey.shade900,
      ), 
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images,)

  ],
),
//      body: Center(
//        child: Container(
//          child: RaisedButton(
//              child: Text("Go back ${this.movieName}"),
//              onPressed: () {
//                Navigator.pop(context);
//              }
//              ),
//        ),
//      ),
    );
  }
}
