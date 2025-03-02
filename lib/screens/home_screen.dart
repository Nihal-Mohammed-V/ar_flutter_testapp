import 'package:ar_flutter/data/cards.dart';
import 'package:ar_flutter/models/card_models.dart';
import 'package:ar_flutter/screens/object_detail_screen.dart';
import 'package:ar_flutter/utils/sizes.dart';
import 'package:ar_flutter/widgets/appbar.dart';
import 'package:ar_flutter/widgets/rounded_container.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SearchController searchController = SearchController();
  List<CardModel> filteredCards = [];

  @override
  void initState() {
    filteredCards.addAll(cards);
    super.initState();
  }

  void filterCardsByTitle(String? query) {
    setState(() {
      if (query == null || query.isEmpty) {
        filteredCards.clear();
        filteredCards.addAll(cards);
        return;
      }

      filteredCards.clear();
      filteredCards.addAll(
        cards
            .where(
              (card) => card.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AAppBar(
        title: Center(
          child: const Text(
            'AR Objects',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(ASizes.defaultSpace),
        child: Column(
          children: <Widget>[
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ASizes.defaultSpace,
                vertical: ASizes.xs,
              ),
              child: SearchAnchor(
                searchController: searchController,
                viewHintText: 'Search',
                viewTrailing: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      filterCardsByTitle(searchController.text);
                      searchController.closeView(searchController.text);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                    },
                  ),
                ],
                builder: (context, controller) {
                  return TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ASizes.borderRadiusXl),
                      ),
                    ),
                    onTap: () => controller.openView(),
                  );
                },
                suggestionsBuilder: (context, controller) {
                  return cards
                      .where((card) => card.title
                          .toLowerCase()
                          .contains(controller.text.toLowerCase()))
                      .map(
                        (card) => ListTile(
                          title: Text(card.title),
                          onTap: () {
                            controller.text = card.title;
                          },
                        ),
                      )
                      .toList();
                },
              ),
            ),
            const SizedBox(height: ASizes.spaceBtwItems),

            // Cards grid
            Expanded(
              child: filteredCards.isEmpty
                  ? Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : GridView.builder(
                      itemCount: filteredCards.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemBuilder: (context, index) {
                        final card = filteredCards[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ObjectsDetailScreen(card: card),
                              ),
                            );
                          },
                          child: ARoundedContainer(
                            width: double.infinity,
                            height: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Image
                                Image.asset(
                                  card.image,
                                  width: double.infinity,
                                  height: 80,
                                ),
                                const SizedBox(height: 10),
                                // Title
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: ASizes.xs),
                                  child: Center(
                                    child: Text(
                                      card.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
