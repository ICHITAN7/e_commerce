import 'package:e_commerce/data/model/user.dart';
import 'package:firebase_database/firebase_database.dart';

class UserController {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref();
  Future<List<UserModel>> users () async {
    try {
      DatabaseEvent databaseEvent = await _ref.child('users').once();
      DataSnapshot snapshot = databaseEvent.snapshot;
      List<UserModel> userList = [];
      if (snapshot.value != null) {
        Map<String, dynamic> usersData = snapshot.value as Map<String,dynamic>;
        usersData.forEach((userId, userData) {
          userList.add(UserModel.fromMap(userId, Map<String, dynamic>.from(userData)));
        });
      }
      return userList;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}