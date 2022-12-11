import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/models/convertJSON.dart';
import 'package:news_app/provider/model.dart';
import 'package:provider/provider.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});
  @override
  Widget build(BuildContext context) {
    var tmp = context.read<Model>().getPrivacy();
    var privacy = context.watch<Model>().privacy;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy",
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
              itemBuilder: (context, index) => Text('${privacy[index]}\n'),
              itemCount: privacy.length)),
    );
  }
}
