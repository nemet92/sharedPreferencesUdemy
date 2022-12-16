import 'package:shared/model/my_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  late final preferences;
  void verileriKayedet(UserInformation userInformation) async {
    final name = userInformation.isim;
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("Isim", name);
    preferences.setBool("ogrenci", userInformation.ogrenmcimisin);
    preferences.setInt("cinsiyet", userInformation.cinsiyet.index);
    preferences.setStringList("renkler", userInformation.renkler);

    // debugPrint(
    //     "${_secilenCinsiyyet.index}renkler${_secilenRengler}ogrencimisin$_ogrencimisin");
  }

  Future<UserInformation> verileriOku() async {
    final preferences = await SharedPreferences.getInstance();
    var isim = preferences.getString("Isim") ?? "";
    var ogrenci = preferences.getBool("ogrenci") ?? false;
    var cinsiyet = Cinsiyet.values[preferences.getInt("cinsiyet") ?? 0];
    var rengler = preferences.getStringList("renkler") ?? <String>[];
    return UserInformation(isim, cinsiyet, rengler, ogrenci);
  }
}
