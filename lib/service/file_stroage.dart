import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/model/my_model.dart';

class FileStorageService {
  _getFilePath() async {
    var filePath = await getApplicationDocumentsDirectory();
    debugPrint(filePath.path);
    return filePath;
  }

  _createFile() {
    var file = File(_getFilePath() + "/info.txt");
    file.writeAsString("deneme icerik");
  }

  void verileriKayedet(UserInformation userInformation) async {}

  Future<UserInformation> verileriOku() async {}
}
