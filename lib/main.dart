
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/utils/TopShows.dart';
import 'package:tmdb/utils/TrendingMovies.dart';
import 'package:tmdb/utils/topratedmovies.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness:Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

   MyHomePage({Key? key, required this.title}) : super(key: key);
  final String  title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    @override
  void initState() {
    loadMovies();
    super.initState();
  }
   List ?trendingMovies,topRatedMovies,topShows;
    final String apikey='a09c7af22045f3565e544a17ed773cdc';
    final String accessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDljN2FmMjIwNDVmMzU2NWU1NDRhMTdlZDc3M2NkYyIsInN1YiI6IjY0NGY1ZGE0MzUwMzk4MDMwNGQ0OTQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XVMDuS-qspnPO2rPk0BOF4Bf4x2JHMaEKTko8Livi4U';
      loadMovies() async{
        TMDB customLogs=TMDB(ApiKeys(apikey, accessToken),
         logConfig:const ConfigLogger(
           showErrorLogs: true,
           showInfoLogs: true,
             showUrlLogs:true
         ));
        Map trendingResult=await customLogs.v3.trending.getTrending();
        Map topRated=await customLogs.v3.movies.getTopRated();
        Map shows=await customLogs.v3.tv.getPopular();
        setState(() {
          trendingMovies=trendingResult['results']!;
          topRatedMovies=topRated['results'];
          topShows=shows['results'];
        });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
        backgroundColor: Colors.white,
      ),
      backgroundColor:Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Movie App",style:GoogleFonts.breeSerif(
          color: Colors.white
        ),),
      ),
      body:ListView(
        children: [
          TopShows(topShows!),
          TrendingMovies(trendingMovies!),
          TopRatedMovies(topRatedMovies!),
        ],
      ),

    );
  }
}
