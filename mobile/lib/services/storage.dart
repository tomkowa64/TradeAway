import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;
  
  Future<void> uploadFile(num id, String filePath, String fileName) async {
    final status = await Permission.storage.request();
    if(status.isDenied) {
      print('denied');
    } else if(status.isGranted) {
      // print('granted');
      File file = File(filePath);

      try {
        await storage.ref('products/$id/$fileName').putFile(file);
      } on FirebaseException catch(e) {
        print(e);
      }
    }
  }
  // Upload photo
  // ListResult results = await storage.storage.ref('products/' + this._productId.toString()).listAll();
  // storage.uploadFile(this._productId, '/sdcard/Download/blender.png', results.items.length.toString() + '_' + this._productName);

  Future<ListResult> listFiles(num id) async {
    ListResult results = await storage.ref('products/$id/').listAll();
    
    for (var ref in results.items) {
      print('Found file: $ref');
    }

    return results;
  }

  Future<String> getURL(num id, String fileName) async {
    String url = await storage.ref('products/$id/$fileName').getDownloadURL();

    return url;
  }
}