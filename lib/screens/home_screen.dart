import 'package:flutter/material.dart';
import 'package:netflix_app/models/tvseries_models.dart';
import 'package:netflix_app/models/upcoming_models.dart';
import 'package:netflix_app/services/api_services.dart';
import 'package:netflix_app/widgets/custom_corousel.dart';
import 'package:netflix_app/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowplayingFuture;
  late Future<TvseriesModel> topratedFuture;

  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getupcomingMoviemodel();
    nowplayingFuture = apiServices.getnowPlaying();
    topratedFuture = apiServices.gettvseriesPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 10),
            ]),
          ],
          title: Image.asset(
            'assets/logo.png',
            height: 80,
            width: 130,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: topratedFuture,
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return CustomCorouselSlide(data: snapshots.data!);
                  }),
              const SizedBox(
                height: 5,
              ),
              FutureBuilder(
                  future: nowplayingFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return MovieCard(
                        future: nowplayingFuture,
                        headlinetext: "Now playing Movies ");
                  }),
              const SizedBox(
                height: 40,
              ),
              FutureBuilder(
                  future: upcomingFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return MovieCard(
                        future: upcomingFuture,
                        headlinetext: "Upcoming Movies ");
                  }),
            ],
          ),
        ));
  }
}
