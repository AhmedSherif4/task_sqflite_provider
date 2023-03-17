// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../data/local_data_source.dart';
import '../model/user.dart';

class MyProvider extends ChangeNotifier {
  SQLDatabase sqlDatabase;
  MyProvider({
    required this.sqlDatabase,
  });

  List<User> users = [];

  readData() async {
    final usersList = await sqlDatabase.readDatabase();
    users = usersList;
    notifyListeners();
  }

  setData(User newUser) async {
    await sqlDatabase.insertDatabase(newUser);
    readData();
    notifyListeners();
  }
}
