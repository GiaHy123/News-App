// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:news_app/screens/search/widgets/newsCard.dart';

import '../home/data/data.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  final List<String>newsString =[];

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
            onPressed: (){
              showSearch(
                context: context,
                delegate: CustomSearch()
                );
            }, 
            icon: const Icon(Icons.search)
            )
        ],
          
      ),
      body: Container( 
          child: 
          Column(
            children: [
              ListView.builder(
              itemCount: dataNews.length,
              itemBuilder: ((context, index) => newsCard(dataNews[index])          
              ),
        
        ),
            ],
          ),
    )
    );
  }
}

class CustomSearch extends SearchDelegate{
  List<String>allData = [
    'Kuma','Russia','Winter','Hot'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        onPressed: (){
          query = ' ';
        }, 
        icon: Icon(Icons.clear)
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return(
      IconButton(
        onPressed: (){
          close(context, null);
        }, 
        icon: Icon(Icons.arrow_back)
        )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in allData){
      if(item.toLowerCase().contains(query.toLowerCase())){
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
    for(var item in allData){
      if(item.toLowerCase().contains(query.toLowerCase())){
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