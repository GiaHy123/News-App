// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:news_app/constants/app_assets.dart';
import 'package:provider/provider.dart';
import 'package:news_app/constants/app_styles.dart';
import 'package:news_app/provider/user_management.dart';

class ChooseImage extends StatelessWidget {
  const ChooseImage({super.key});
  final listAvatar = AppAssets.listAvatar;


  @override
  Widget build(BuildContext context) {
    void ChangeAvatar(int index) async {
      context.read<UserManagement>().user.avatar = listAvatar[index];
      await context.read<UserManagement>().updateUser();      
      Navigator.pop(context);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Choose Image",
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(listAvatar.length, (index) {
                    return Center(
                      child: TextButton(
                        onPressed: () => ChangeAvatar(index),
                        child: CircleAvatar(
                          radius: 56,
                          child: ClipOval(child: Image.asset(listAvatar[index])),
                        ),
                      ),
                    );
                  }))),
        ));
  }
}
