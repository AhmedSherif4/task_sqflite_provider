import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider_helper.dart';
import '../../model/user.dart';
import '../sec_page/s_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _userAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<MyProvider>(context, listen: true).users;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(label: Text('put your name')),
            ),
            TextField(
              controller: _userAddressController,
              decoration:
                  const InputDecoration(label: Text('put your address')),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    User user = User(
                        name: _usernameController.text,
                        address: _userAddressController.text);
                    Provider.of<MyProvider>(context, listen: false).setData(user);
                  },
                  child: const Text('add user Data'),
                ),
                if (users.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      print(users);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecPage(users: users),
                      ));
                    },
                    child: const Text('show Data'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
