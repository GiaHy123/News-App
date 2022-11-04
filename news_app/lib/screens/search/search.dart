// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/models/new_info.dart';
//import 'package:news_app/models/data_news.dart';
import 'package:news_app/screens/search/widgets/newsCard.dart';

import '../../models/get_data.dart';
import '../home/data/data.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int currentCategory = 0;
  List<NewsInfo> dataNews = [];
  // ignore: non_constant_identifier_names
  void ChangeCurrentCatagory(index) {
    setState(() {
      currentCategory = index;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setUpData();
  }

  void setUpData() async {
    final temp = await GetDataForNews.getWebsiteData('https://vnexpress.net/');
    setState(() {
      dataNews = temp;
    });
    List<String?> urls = [];
    dataNews.forEach((element) {
      urls.add(element.uri);
    });
    List<List<String?>> listImages =
        await GetDataForNews.getImagesForNews(urls);
    if (mounted) {
      setState(() {
        for (int i = 0; i < dataNews.length; i++) {
          dataNews[i].images = listImages[i].isNotEmpty
              ? listImages[i]
              : [
                  "https://i.pinimg.com/736x/4b/1a/d7/4b1ad71f567a41e89b70efe355378977--best-cigar-discovery-channel.jpg"
                ];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Container(
          height: window.physicalSize.height,
          color: Color.fromARGB(255, 181, 196, 203),
          child: Container(
            child: ListView.builder(
              itemCount: dataNews.length,
              itemBuilder: (context, index) => newsCard(dataNews[index]),
            ),
          ),
        ));
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = ['News', 'Russia', 'Winter', 'Hot'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = ' ';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return (IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back)));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(title: Text(result));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(title: Text(result));
        });
  }
}
