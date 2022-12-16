// ignore_for_file: constant_identifier_names

enum Cinsiyet { woman, man, other }

enum Renkler { Sari, Kirmizi, Mavi, Yasil }

class UserInformation {
  final String isim;
  final Cinsiyet cinsiyet;
  final List<String> renkler;
  final bool ogrenmcimisin;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenmcimisin);
}
