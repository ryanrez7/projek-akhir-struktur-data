import 'dart:collection';
import '../model/data_reservasi.dart';
import '../model/alat_olahraga.dart';
import 'iventaris_servis.dart';

class ReservasiService {
  Queue<DataReservasi> _antreanReservasi = Queue<DataReservasi>();

  Queue<DataReservasi> get antreanReservasi => _antreanReservasi;

  void tambahKeAntrean(String nama, int idAlat, int jumlah) {
    _antreanReservasi.addLast(DataReservasi(nama, idAlat, jumlah));
    print("Berhasil memasukkan $nama ke dalam daftar antrean.");
  }

  void prosesAntreanTerdepan(InventarisService inventaris) {
    if (_antreanReservasi.isNotEmpty) {
      DataReservasi res = _antreanReservasi.removeFirst();
      AlatOlahraga? alat = inventaris.cariBerdasarkanId(res.idAlatYangDipinjam);

      print("\nMEMPROSES ANTREAN TERDEPAN");
      print("Nama Peminjam: ${res.namaPeminjam}");
      print("Alat Olahraga: ${alat?.nama}");
      print("Jumlah Pinjam: ${res.jumlahDipinjam}");

      if (alat != null && alat.stok >= res.jumlahDipinjam) {
        int stokBaru = alat.stok - res.jumlahDipinjam;
        print("STATUS: RESERVASI DISETUJUI.");
        print("Sisa stok ${alat.nama} di gudang sekarang: $stokBaru");
      } else {
        print("STATUS: RESERVASI DITOLAK.");
        print("Alasan: Jumlah stok di gudang tidak mencukupi.");
      }
    } else {
      print("\nAntrean kosong, tidak ada reservasi yang dapat diproses.");
    }
  }

  void tampilkanSemuaAntrean(InventarisService inventaris) {
    print("\nDaftar Kondisi antrean saat ini:");
    if (_antreanReservasi.isEmpty) {
      print("(Antrean sedang kosong)");
    } else {
      int nomor = 1;
      for (var res in _antreanReservasi) {
        AlatOlahraga? alat = inventaris.cariBerdasarkanId(
          res.idAlatYangDipinjam,
        );
        print(
          "$nomor. ${res.namaPeminjam} -> Meminjam: ${alat?.nama} [Jumlah: ${res.jumlahDipinjam}]",
        );
        nomor++;
      }
    }
  }
}
