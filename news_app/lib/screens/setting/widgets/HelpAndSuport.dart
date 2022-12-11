import 'package:flutter/material.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/model.dart';
import 'package:provider/provider.dart';

class HelpAndSuport extends StatelessWidget {
  const HelpAndSuport({super.key});

  @override
  Widget build(BuildContext context) {
    var tmp = context.read<Model>().getHelpAndSuport();
    var helpAndSuport = context.watch<Model>().helpAndSuport;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help And Suport",
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
              itemBuilder: (context, index) => Text('${helpAndSuport[index]}\n'),
              itemCount: helpAndSuport.length)),
    );
  }
}