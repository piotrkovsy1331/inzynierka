import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:inzynierka/helpers/firestore_doc_helper.dart';
import 'package:inzynierka/models/dto/user_data_dto.dart';
import 'package:inzynierka/models/user_data.dart';
import 'package:path_provider/path_provider.dart';

class UserDataRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> editUserInfo(UserData userData) async {
    try {
      CollectionReference _userDatatCollection =
          _firebaseFirestore.collection('userData');

      final DocumentSnapshot snapshot = await _userDatatCollection
          .doc(_firebaseAuth.currentUser!.uid.toString())
          .get();

      if (snapshot.exists) {
        UserDataDTO toSend = UserDataDTO.fromModel(userData);

        final json = toSend.toJson();
        await _userDatatCollection
            .doc(_firebaseAuth.currentUser!.uid)
            .set(json, SetOptions(merge: true));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserData> getUserData() async {
    late UserData returnData;
    try {
      CollectionReference _userDatatCollection =
          _firebaseFirestore.collection('userData');

      final DocumentSnapshot snapshot = await _userDatatCollection
          .doc(_firebaseAuth.currentUser!.uid.toString())
          .get();
      if (!snapshot.exists) {
        await _userDatatCollection
            .doc(_firebaseAuth.currentUser!.uid.toString())
            .set(UserDataDTO.fromModel(FireStoreDocHelper.emptyUserData)
                .toJson());
        returnData = FireStoreDocHelper.emptyUserData;
      } else {
        returnData =
            UserDataDTO.fromJson(snapshot.data() as Map<String, dynamic>)
                .toModel();
      }
    } catch (e) {
      print(e);
    }
    return returnData;
  }

  Future<String> uploadImage(File image) async {
    String url = '';

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/${image.path}';
    Reference reference =
        _firebaseStorage.ref().child('user_profile_pictures/${image.path}');
    File file = File(filePath);
    reference.putFile(file).snapshotEvents.listen((event) {
      if (event.state == TaskState.success) {
        reference.getDownloadURL().then((value) => url = value);
      }
    });
    return url;
  }
}
