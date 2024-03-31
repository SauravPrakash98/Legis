// TODO: create db methods to fetch and update dbs for each user
import 'package:firebase_database/firebase_database.dart';

class DataRepository  {
  FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref('users/123');
  Future<void> ReadFromDatabase() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Questions').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }
  Future<void> WriteToDatabase() async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.set({
      "name": "John",
      "age": 18,
      "address": {
        "line1": "100 Mountain View"
      }
    });
  }
}