import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/pages/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
class ProfileImageUpdate extends StatefulWidget {
  const ProfileImageUpdate({Key? key}) : super(key: key);

  @override
  _ProfileImageUpdateState createState() => _ProfileImageUpdateState();
}

class _ProfileImageUpdateState extends State<ProfileImageUpdate> {
final ProfileController profileController = Get.find();

  var taskInProgress = false.obs;
  @override
  void initState() { 
    super.initState();
    profileController.getUser();    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Obx(
            () => ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                  height: 130.0,
                  width: 130.0,
                  fit: BoxFit.cover,
                  imageUrl: profileController.appUser.value.photoUrl,
                  errorWidget: (context, url, error) => Image.asset(
                        'assets/images/ic_profile_place_holder.png',
                      )),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            width: 30,
            height: 30,
            child: ClipOval(
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  icon:const Icon(Icons.edit,color:Colors.white),
                  onPressed: () async {
                    if(defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android){
                      Map<Permission, PermissionStatus> statuses =
                      await [Permission.camera, Permission.storage,].request();
                      final granted = statuses.values.fold<bool>(
                          true,
                          (previousValue, element) => previousValue && element.isGranted
                      );
                      if(granted){
                        showPicker(context);
                      }
                    }else{
                      pickFile();
                    }

                  },
                ),
              ),
            ),
          ),
          Positioned(
            width: 30,
            height: 30,
            bottom: 50,
            right: 55,
            child: Obx(
                ()=> taskInProgress.value
                    ? const CircularProgressIndicator()
                    : const SizedBox(width: 0,height: 0,)
            ),
          )
        ],
      ),
    );
  }

  void onChangeProfilePic(ImageSource source) async {
    final imagePicker = ImagePicker();
    taskInProgress.value = true;
    try {
      var file = await imagePicker.pickImage(source: source);
      if (file != null) {
        final imageUrl = await profileController.uploadPicture(File(file.path));
        final newUser = profileController.appUser.value;
        newUser.photoUrl = imageUrl;
        profileController.updateProfile(newUser);
      }else{
        taskInProgress.value = false;
      }
    }catch(ex){
      taskInProgress.value = false;
    }finally{
      taskInProgress.value = false;
    }
  }

  void pickFile() async{

    taskInProgress.value = true;
    try {
      var filePickerResult = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image
      );
      if (filePickerResult != null) {
        final imageUrl = await profileController.uploadPlatformFile(filePickerResult.files.first);
        final newUser = profileController.appUser.value;
        newUser.photoUrl = imageUrl;
        profileController.updateProfile(newUser);
      }else{
        taskInProgress.value = false;
      }
    }catch(ex){
      taskInProgress.value = false;
    }finally{
      taskInProgress.value = false;
    }
  }

  void showPicker(BuildContext context){
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:const EdgeInsets.all(10),
              decoration :const  BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton.icon(
                        onPressed: () {
                          Get.back();
                          onChangeProfilePic(ImageSource.camera);
                        },
                        icon:const Icon(Icons.camera_alt_outlined),
                        label:const Text("Take picture")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton.icon(
                        onPressed: () {
                          Get.back();
                          onChangeProfilePic(ImageSource.gallery);
                        },
                        icon:const Icon(Icons.file_upload_outlined),
                        label:const Text("Upload a picture")),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
