import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/models/searchSortBy.dart';
import 'package:invidious/search/views/screens/search.dart';

import '../globals.dart';
import '../models/searchResult.dart';
import '../models/searchType.dart';

class MySearchDelegate extends SearchDelegate<String> {
  SearchSortBy sortBy = SearchSortBy.relevance;

  MySearchDelegate() {
    MiniPlayerController.to()?.showMiniPlayer();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear)),
      const Padding(
        padding: EdgeInsets.only(right: 4.0),
        child: Icon(Icons.sort),
      ),
      DropdownButton<SearchSortBy>(
        value: sortBy,
        items: [
          DropdownMenuItem(value: SearchSortBy.relevance, child: Text(locals.searchSortRelevance)),
          DropdownMenuItem(
            value: SearchSortBy.rating,
            child: Text(locals.searchSortRating),
          ),
          DropdownMenuItem(
            value: SearchSortBy.upload_date,
            child: Text(locals.searchSortUploadDate),
          ),
          DropdownMenuItem(
            value: SearchSortBy.view_count,
            child: Text(locals.searchSortViewCount),
          ),
        ],
        onChanged: (SearchSortBy? value) {
          print(value);
          sortBy = value ?? SearchSortBy.relevance;
          super.showResults(context);
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: () => close(context, ''), icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<SearchResults>>(
      future: Future.wait([
        service.search(query, type: SearchType.video, sortBy: sortBy),
        service.search(query, type: SearchType.channel, sortBy: sortBy),
        service.search(query, type: SearchType.playlist, sortBy: sortBy)
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
          return Search(
              // results: snapshot.data!,
              // query: query,
              );
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
                title: isHistoryResults ? Row(children: [const Icon(Icons.history), Padding(padding: const EdgeInsets.only(left: 8), child: Text(suggestions[index]))]) : Text(suggestions[index]),
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
