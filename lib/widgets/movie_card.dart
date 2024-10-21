import 'package:flutter/material.dart';
import 'package:netflix_app/common/utils.dart';

import 'package:netflix_app/models/upcoming_models.dart';

class MovieCard extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headlinetext;

  const MovieCard({
    Key? key,
    required this.future,
    required this.headlinetext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            var data =
                snapshots.data?.results; //resultcome from upcoming movie model

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headlinetext,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    height: 130,
                    child: ListView.builder(
                        itemCount: data?.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    "$imageUrl${data![index].posterPath}"),
                              ));
                        }))
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
