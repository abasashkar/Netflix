import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/common/utils.dart'; // Ensure imageUrl is correctly defined here
import 'package:netflix_app/provider/searchpage_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchpageProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 35, 22, 0),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      suffixIcon: Icon(Icons.cancel, color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(20, 16, 0, 13),
                      hintText: "Enter the movie's name",
                      hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (value) {
                      searchProvider.search(
                          value); // Call the search method from the provider
                    },
                  ),
                ),
              ),
              searchProvider.searchModel == null ||
                      searchProvider.searchModel!.results.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "No results found",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: searchProvider.searchModel?.results.length ??
                            0, // Updated count
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.2 / 2,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "${imageUrl}${searchProvider.searchModel!.results[index].backdropPath}",
                              height: 170,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              searchProvider
                                  .searchModel!.results[index].originalTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
