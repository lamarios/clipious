import 'package:flutter/material.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/views/search.dart';

import '../globals.dart';
import '../models/searchResult.dart';

class MySearchDelegate extends SearchDelegate<String> {
  MySearchDelegate(){
    MiniPlayerController.to()?.showMiniPlayer();
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear))
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: () => close(context, ''), icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<SearchResults>(
      future: service.search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
          return Search(results: snapshot.data!);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    bool isHistoryResults = true;
    return FutureBuilder(
      future: service.getSearchSuggestion(query),
      builder: (context, snapshot) {
        List<String> suggestions = db.getSearchHistory();
        if (snapshot.connectionState == ConnectionState.done && (snapshot.data?.suggestions ?? []).isNotEmpty) {
          suggestions = snapshot.data?.suggestions ?? [];
          isHistoryResults = false;
        } else {
          isHistoryResults = true;
        }

        return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              String sugg = suggestions[index];
              return ListTile(
                title: isHistoryResults ? Row(
                    children: [
                      const Icon(Icons.history),
                      Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(suggestions[index])
                      )
                    ]
                ) : Text(suggestions[index]),
                onTap: () {
                  query = sugg;
                  showResults(context);
                },
              );
            });
      },
    );
  }
}
