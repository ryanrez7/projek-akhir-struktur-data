import '../model/alat_olahraga.dart';

class InventarisService {
  List<AlatOlahraga> _daftarAlat = [];

  List<AlatOlahraga> get daftarAlat => _daftarAlat;

  void inisialisasiDataAwal() {
    _daftarAlat.add(AlatOlahraga(1, "Raket Badminton", 10));
    _daftarAlat.add(AlatOlahraga(2, "Raket Pingpong", 8));
    _daftarAlat.add(AlatOlahraga(3, "Bola Pingpong", 20));
    _daftarAlat.add(AlatOlahraga(4, "Net Badminton", 2));
    _daftarAlat.add(
      AlatOlahraga(5, "Pelindung Bela Diri (Silat/Karate/Taekwondo)", 6),
    );
    _daftarAlat.add(AlatOlahraga(6, "Catur", 5));
    _daftarAlat.add(AlatOlahraga(7, "Bola Voli", 6));
    _daftarAlat.add(AlatOlahraga(8, "Bola Basket", 4));
    _daftarAlat.add(AlatOlahraga(9, "Bola Sepak", 5));
    _daftarAlat.add(AlatOlahraga(10, "Ban Latihan", 4));
    _daftarAlat.add(AlatOlahraga(11, "Kerucut Latihan (Cone)", 15));
  }

  void cetakSemuaInventaris() {
    print("ID\t Nama Alat\t\t\t\t\t| Jumlah Stok");
    for (var alat in _daftarAlat) {
      alat.tampilkanData();
    }
  }

  bool cekIdValid(int id) {
    return _daftarAlat.any((alat) => alat.id == id);
  }

  AlatOlahraga? cariBerdasarkanId(int id) {
    for (var alat in _daftarAlat) {
      if (alat.id == id) return alat;
    }
    return null;
  }
}
