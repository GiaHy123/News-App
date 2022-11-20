import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/model.dart';
import 'package:news_app/provider/screen.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_options.dart';

Future<void> main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() => UserManagement().checkLogin());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Model()),
      ChangeNotifierProvider(create: (_) => UserManagement()),
      ChangeNotifierProvider(create: (_) => Screen()),

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
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  void initState() {
    super.initState();
    context.read<Model>().getDataNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: context.watch<Screen>().screen,
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  context.read<Screen>().changeScreen(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: context.watch<Screen>().currentTab == 0 ? Colors.blue : Colors.grey,
                    ),
                    Text("Home",
                        style: AppStyles.regular.copyWith(
                            color: context.watch<Screen>().currentTab == 0
                                ? Colors.blue
                                : Colors.grey)),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  context.read<Screen>().changeScreen(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: context.watch<Screen>().currentTab == 1 ? Colors.blue : Colors.grey,
                    ),
                    Text("Search",
                        style: AppStyles.regular.copyWith(
                            color: context.watch<Screen>().currentTab == 1
                                ? Colors.blue
                                : Colors.grey)),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  context.read<Screen>().changeScreen(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_box,
                      color: context.watch<Screen>().currentTab == 2 ? Colors.blue : Colors.grey,
                    ),
                    Text("Profile",
                        style: AppStyles.regular.copyWith(
                            color: context.watch<Screen>().currentTab == 2
                                ? Colors.blue
                                : Colors.grey)),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  context.read<Screen>().changeScreen(3);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: context.watch<Screen>().currentTab == 3 ? Colors.blue : Colors.grey,
                    ),
                    Text("Settings",
                        style: AppStyles.regular.copyWith(
                            color: context.watch<Screen>().currentTab == 3
                                ? Colors.blue
                                : Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
