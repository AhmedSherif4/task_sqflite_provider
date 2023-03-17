import 'package:flutter/material.dart';

import '../../model/user.dart';

class SecPage extends StatelessWidget {
  final List<User> users;
  const SecPage({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          ...users
              .map((user) => Text(
                  'user name: ${user.name}, and his address: ${user.address}'))
              .toList(),
        ],
      )),
    );
  }
}
