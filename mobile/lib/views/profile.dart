import 'dart:ui';

//Included widgets
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/components/profileMenuHorizontalCard.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  XFile? imageFile;
  String imgPath = '';

  /// Get from gallery
  _getFromGallery() async {
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it you
      //can now select photo.
      PickedFile? photo = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (photo != null) {
        imageFile = XFile(photo.path);
      }
      setState(() {
        imgPath = photo!.path;
      });
    }
  }

  /// Get from camera
  _getFromCamera() async {
    if (await Permission.camera.request().isGranted) {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        imageFile = XFile(pickedFile.path);
      }
      setState(() {
        imgPath = pickedFile!.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser?>(context);
    final users = Provider.of<List<OurUser>>(context);
    final Storage storage = Storage();

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Nav(),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    //Container for User Image, Real Name and Email, show only after user provide those
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: const Text("Upload Avatar"),
                                        content: const Text(
                                            "Upload avatar form your files or make a new photo using your camera."),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: const Icon(
                                              FontAwesomeIcons.camera,
                                              size: 40,
                                            ),
                                            onPressed: () async {
                                              await _getFromCamera();
                                              storage.uploadAvatar(auth!.uid, imgPath).whenComplete(() {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
                                              });
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            child: const Icon(
                                                FontAwesomeIcons.file,
                                                size: 40,
                                            ),
                                            onPressed: () async {
                                              await _getFromGallery();
                                              storage.uploadAvatar(auth!.uid, imgPath).whenComplete(() {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
                                              });
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: FutureBuilder(
                                  future: storage.getAvatarURL(auth!.uid),
                                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                    if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                      return CircleAvatar(
                                          radius: 60,
                                          backgroundImage: NetworkImage(snapshot.data!),
                                          backgroundColor: const Color(0x00000000)
                                      );
                                    }
                                    if(snapshot.connectionState == ConnectionState.waiting) {
                                      return const SizedBox(
                                        child: CircularProgressIndicator(),
                                        height: 120,
                                        width: 120,
                                      );
                                    }
                                    if(!snapshot.hasData) {
                                      return CircleAvatar(
                                        radius: 60,
                                        backgroundColor: const Color(0xffcf4e6c),
                                        child: Text(
                                            users.firstWhere((element) => element.uid == auth.uid).name.substring(0, 1) + users.firstWhere((element) => element.uid == auth.uid).surname.substring(0, 1),
                                            style: const TextStyle(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontFamily: 'Times New Roman')),
                                      );
                                    }
                                    return Container();
                                  }
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              users
                                      .firstWhere((element) =>
                                          element.uid == auth.uid)
                                      .name +
                                  ' ' +
                                  users
                                      .firstWhere((element) =>
                                          element.uid == auth.uid)
                                      .surname,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Times New Roman'),
                            ),
                            SizedBox(height: 5),
                            Text(
                              auth.email.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Times New Roman',
                                  color: Color(0xff9e9e9e)),
                            )
                          ],
                        )
                      ],
                    ),
                    //Actions list
                    Container(
                      child: Column(
                        children: [
                          //Action List Item
                          ProfileMenuHorizontalCard(
                              const Icon(
                                Icons.compare_arrows,
                                size: 40,
                                color: Color(0xff303744),
                              ),
                              'My Transactions',
                              'Transactions'),
                          ProfileMenuHorizontalCard(
                              const Icon(
                                Icons.account_circle,
                                size: 40,
                                color: Color(0xff303744),
                              ),
                              'Personal Data',
                              'PersonalData'),
                          ProfileMenuHorizontalCard(
                              const Icon(
                                Icons.history,
                                size: 40,
                                color: Color(0xff303744),
                              ),
                              'Order History',
                              'History'),
                          ProfileMenuHorizontalCard(
                              const Icon(
                                Icons.info,
                                size: 40,
                                color: Color(0xff303744),
                              ),
                              'About',
                              'PersonalData'),
                          ProfileMenuHorizontalCard(
                              const Icon(
                                Icons.settings,
                                size: 40,
                                color: Color(0xff303744),
                              ),
                              'Account',
                              'AccountSettings'),
                          ProfileMenuHorizontalCard(
                              const Icon(
                                Icons.add_circle_outlined,
                                size: 40,
                                color: Color(0xff303744),
                              ),
                              'Create Offer',
                              'AddOffer'),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
