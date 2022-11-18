import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/model.dart';
import 'package:news_app/screens/home/home.dart';
import 'package:news_app/screens/login/loginUI.dart';
import 'package:news_app/screens/profile/profile.dart';
import 'package:news_app/screens/search/search.dart';
import 'package:news_app/screens/settings/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Model()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'News App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;
  final List<Widget> screens = const [
    Home(),
    Search(),
    Profile(),
    Settings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: screens[currentTab],
      ),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(48)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
          border: Border.all(color: Colors.white, width: 8),
        ),
        child: FittedBox(
          child: FloatingActionButton(
              child: const Icon(Icons.post_add),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text("Home",
                            style: AppStyles.regular.copyWith(
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey)),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text("Search",
                            style: AppStyles.regular.copyWith(
                                color: currentTab == 1
                                    ? Colors.blue
                                    : Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_box,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text("Profile",
                            style: AppStyles.regular.copyWith(
                                color: currentTab == 2
                                    ? Colors.blue
                                    : Colors.grey)),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text("Settings",
                            style: AppStyles.regular.copyWith(
                                color: currentTab == 3
                                    ? Colors.blue
                                    : Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
