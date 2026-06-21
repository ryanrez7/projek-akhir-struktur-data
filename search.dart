import '../model/alat_olahraga.dart';

class Search {
  static List<AlatOlahraga> linearSearch(
    List<AlatOlahraga> listGudang,
    String kataKunci,
  ) {
    List<AlatOlahraga> hasilPencarian = [];

    for (var alat in listGudang) {
      if (alat.nama.toLowerCase().contains(kataKunci.toLowerCase())) {
        hasilPencarian.add(alat);
      }
    }
    return hasilPencarian;
  }
}
