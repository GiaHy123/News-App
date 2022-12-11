import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/model.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var tmp = context.read<Model>().getAboutUs();
    var aboutUs = context.watch<Model>().aboutUs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: AppStyles.medium.copyWith(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: ListView.builder(
              itemBuilder: (context, index) => Text('${aboutUs[index]}\n'),
              itemCount: aboutUs.length)),
    );
  }
}