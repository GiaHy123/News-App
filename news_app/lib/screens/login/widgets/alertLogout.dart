import 'package:flutter/material.dart';
import 'package:news_app/provider/user_management.dart';
import 'package:provider/provider.dart';

Future<void> alertLogout(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('News App'),
          content: const Text('Are you sure?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Oke'),
              onPressed: () {
                context.read<UserManagement>().logOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
}