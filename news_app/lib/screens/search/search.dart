// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
//import 'package:news_app/models/data_news.dart';
import 'package:news_app/screens/search/widgets/newsCard.dart';
import 'package:provider/provider.dart';

import '../../constants/app_styles.dart';
import '../../provider/model.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  late List<News> dataNews;
  FocusNode focus = FocusNode();
  @override
  // Mount
  void initState() {
    super.initState();
    dataNews = context.read<Model>().data;
    print("Khởi tạo");
  }

  //mount và unmount

  @override
  void dispose() {
    super.dispose();
    print("Hủy");
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    print("Render component");
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Container(
                child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  flex: 12,
                  child: TextField(
                    enabled: true,
                    focusNode: focus,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search",
                    ),
                    onChanged: (value) {
                      List<News> temp = [];
                      for (var item in context.read<Model>().data) {
                        if (item.title
                            .toLowerCase()
                            .contains(_controller.text.toLowerCase())) {
                          temp.add(item);
                        }
                        setState(() {
                          dataNews = temp;
                        });
                      }
                    },
                  ),
                ),
                if (_controller.text.isNotEmpty)
                  (Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _controller.text = "";
                          setState(() {
                            dataNews = context.read<Model>().data;
                          });
                        },
                      ))),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        FocusScope.of(context).autofocus(focus);
                      },
                    )),
              ],
            ))),
        body: Container(
          height: window.physicalSize.height,
          
          child: Column(
            children: [
              Container(
                child: Expanded(
                  flex: 1,
                  child: 
                  Text("Trending Now",
                    style:TextStyle(color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  )
                  
                  ),
              ),
              Expanded(
                flex: 17,
                child: ListView.builder(
                  itemCount: dataNews.length,
                  itemBuilder: (context, index) => NewCard(news: dataNews[index]),
                ),
              ),
            ],
          ),
        ));
  }
}

// class CustomSearch extends SearchDelegate {
//   List<String> allData = ['News', 'Russia', 'Winter', 'Hot'];

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = ' ';
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return (IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.arrow_back)));
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item in allData) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(title: Text(result));
//         });
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var item in allData) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery[index];
//           return ListTile(title: Text(result));
//         });
//   }
// }
