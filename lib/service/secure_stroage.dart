import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared/model/my_model.dart';

class SecureStorageService {
  late final FlutterSecureStorage preferences;
  void verileriKayedet(UserInformation userInformation) async {
    final name = userInformation.isim;

    await preferences.write(key: "isim", value: name);
    await preferences.write(
        key: "ogrenci", value: userInformation.ogrenmcimisin.toString());
    await preferences.write(
        key: "cinsiyet", value: userInformation.cinsiyet.index.toString());

    await preferences.write(
        key: "renkler", value: jsonEncode(userInformation.renkler));
  }

  Future<UserInformation> verileriOku() async {
    preferences = const FlutterSecureStorage();

    var isim = await preferences.read(key: "Isim") ?? " ";

    var ogrenciString = await preferences.read(key: "ogrenci") ?? "false";
    var ogrenci = ogrenciString.toLowerCase() == "true" ? true : false;

    var cinsiyetString = await preferences.read(key: "cinsiyet") ?? " 0";
    var cinsiyet = Cinsiyet.values[int.parse(cinsiyetString)];

    var renklerString = await preferences.read(key: "renkler");
    var renkler = renklerString == null
        ? <String>[]
        : List<String>.from(jsonDecode(renklerString));

    return UserInformation(isim, cinsiyet, renkler, ogrenci);
  }
}
