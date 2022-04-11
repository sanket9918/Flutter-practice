import 'package:brew_sanket/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid = ""});

  final CollectionReference sanketBrewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserdata(String sugars, String name, int strength) async {
    return await sanketBrewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

// Brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((DocumentSnapshot doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      return Brew(
          name: data['name'] ?? "",
          sugars: data['sugars'] ?? "0",
          strength: data['strength'] ?? 0);
    }).toList();
  }
  // Get a stream for changes

  Stream<List<Brew?>> get brews {
    return sanketBrewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
