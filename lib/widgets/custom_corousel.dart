import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/common/utils.dart';
import 'package:netflix_app/models/tvseries_models.dart';

class CustomCorouselSlide extends StatelessWidget {
  final TvseriesModel data;
  const CustomCorouselSlide({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
          itemCount: data.results.length,
          itemBuilder: (BuildContext context, int index, int realindex) {
            var url = data.results[index].backdropPath.toString();
            return Column(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: CachedNetworkImage(imageUrl: "$imageUrl$url")),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.results[index].name,
                  style: const TextStyle(fontSize: 18),
                )
              ],
            );
          },
          options: CarouselOptions(
              height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
              aspectRatio: 16 / 9,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal)),
    );
  }
}
