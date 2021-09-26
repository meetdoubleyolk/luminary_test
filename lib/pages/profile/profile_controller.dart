import 'dart:io';
import 'dart:typed_data';
import 'package:fluttertest/pages/services/firebase_auth_service.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:path/path.dart';
import 'package:fluttertest/model/app_user.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

class ProfileController extends GetxController {
  var inProgress = false.obs;
  Rx<AppUser> appUser = AppUser().obs;

  void getUser() async {
// get id from auth
    await FirebaseAppAuthService()
        .getCurrentFirebaseUser()
        .then((value) async => {
              // get user object from firestore
              await FirebaseAppAuthService()
                  .getUserFirestore(value.uid)
                  .then((user) async => {
                        appUser.value = user!,
                        appUser.refresh(),
                      })
            });
  }

  Future<String> uploadPicture(File file) async {
    String fileName = basename(file.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(file);
    return await uploadTask.then((snapshot) async {
      final url = await snapshot.ref.getDownloadURL();
      return Future.value(url);
    }, onError: (error) {
      return Future.error(error);
    });
  }

  Future updateProfile(AppUser user) async {
    await FirebaseAppAuthService().updateUserDetails(user);
    appUser.value = user;
    appUser.refresh();
  }

  Future<String> uploadPlatformFile(PlatformFile file) async {
    Uint8List? fileBytes = file.bytes;
    String fileName = file.name;
    if (fileBytes != null) {
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putData(fileBytes);
      return await uploadTask.then((snapshot) async {
        final url = await snapshot.ref.getDownloadURL();
        return Future.value(url);
      }, onError: (error) {
        return Future.error(error);
      });
    } else {
      return Future.error("error uploading $fileName");
    }
  }

  void logout() async {
    await FirebaseAppAuthService()
        .signOut()
        .then((value) => {Get.offAllNamed(Routes.initial)});
  }
}
