import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared/model/my_model.dart';
import 'package:shared/service/secure_stroage.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  var _secilenCinsiyyet = Cinsiyet.woman;
  var _secilenRengler = <String>[];
  var _ogrencimisin = false;
  final TextEditingController _nameController = TextEditingController();
  // final _preferenceService = SharedPreferenceService();
  final _preferenceService = SecureStorageService();

  @override
  void initState() {
    verileriOku();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SharedPreference kullanimi"),
        ),
        body: ListView(children: [
          ListTile(
            title: TextFormField(
              controller: _nameController,
              decoration:
                  const InputDecoration(labelText: "Adinizi daxil edin"),
            ),
          ),
          for (var item in Cinsiyet.values)
            _buildRadioListTiles(describeEnum(item), item),
          for (var item in Renkler.values) _buildCheckBoxListTiles(item),
          SwitchListTile(
              title: const Text("Ogrenci Misin?"),
              value: _ogrencimisin,
              onChanged: (bool ogrencimisin) {
                setState(() {
                  _ogrencimisin = ogrencimisin;
                });
              }),
          TextButton(
              onPressed: () {
                var userInformation = UserInformation(_nameController.text,
                    _secilenCinsiyyet, _secilenRengler, _ogrencimisin);
                _preferenceService.verileriKayedet(userInformation);
              },
              child: const Text("Kaydet"))
        ]));
  }

  // ignore: unused_element
  Widget _buildCheckBoxListTiles(Renkler renk) {
    return CheckboxListTile(
        title: Text(describeEnum(renk)),
        value: _secilenRengler.contains(describeEnum(renk)),
        onChanged: (bool? value) {
          if (value == false) {
            _secilenRengler.remove(describeEnum(renk));
          } else {
            _secilenRengler.add(describeEnum(renk));
          }
          setState(() {});
        });
  }

  Widget _buildRadioListTiles(String title, Cinsiyet cinsiyyet) {
    return RadioListTile(
        title: Text(title),
        value: cinsiyyet,
        groupValue: _secilenCinsiyyet,
        onChanged: ((Cinsiyet? secilmisCinsiyyet) {
          setState(() {
            _secilenCinsiyyet = secilmisCinsiyyet!;
          });
        }));
  }

  void verileriOku() async {
    var info = await _preferenceService.verileriOku();
    _nameController.text = info.isim;
    _secilenCinsiyyet = info.cinsiyet;
    _ogrencimisin = info.ogrenmcimisin;
    _secilenRengler = info.renkler;
    setState(() {});
  }
}
