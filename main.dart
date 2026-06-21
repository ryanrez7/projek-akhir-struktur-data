import 'dart:io';
import 'servis/iventaris_servis.dart';
import 'servis/reservasi_servis.dart';
import 'model/alat_olahraga.dart';
import 'search/search.dart';

void main() {
  InventarisService inventaris = InventarisService();
  ReservasiService reservasi = ReservasiService();

  inventaris.inisialisasiDataAwal();

  int pilihan = 0;

  while (pilihan != 6) {
    print("\nSISTEM MANAJEMEN INVENTARIS & RESERVASI ALAT OLAHRAGA");
    print("");
    print("1. Lihat dafar alat olahraga");
    print("2. Cari alat olahraga");
    print("3. Ajukan reservasi baru");
    print("4. Proses antrean pertama");
    print("5. Lihat semua isi antrean");
    print("6. Keluar");
    stdout.write("Pilihan Menu: ");

    String? inputRaw = stdin.readLineSync();
    pilihan = int.tryParse(inputRaw ?? '') ?? 0;

    switch (pilihan) {
      case 1:
        inventaris.cetakSemuaInventaris();
        break;
      case 2:
        stdout.write("\nMasukkan nama alat: ");
        String cari = stdin.readLineSync() ?? '';
        List<AlatOlahraga> hasil = Search.linearSearch(
          inventaris.daftarAlat,
          cari,
        );
        if (hasil.isNotEmpty) {
          print("\nData ditemukan!");
          for (var alat in hasil) {
            alat.tampilkanData();
          }
        } else {
          print("\nkata kunci '$cari' tidak ditemukan.");
        }
        break;

      case 3:
        stdout.write("\nMasukkan nama: ");
        String namaPeminjam = stdin.readLineSync() ?? '';

        stdout.write("Masukkan ID Alat yang mau dipinjam: ");
        int idAlat = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        stdout.write("Masukkan Jumlah Alat yang mau dipinjam: ");
        int jumlah = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        if (namaPeminjam.isNotEmpty &&
            inventaris.cekIdValid(idAlat) &&
            jumlah > 0) {
          reservasi.tambahKeAntrean(namaPeminjam, idAlat, jumlah);
        } else {
          print("Gagal data atau id alat salah.");
        }
        break;

      case 4:
        reservasi.prosesAntreanTerdepan(inventaris);
        break;

      case 5:
        reservasi.tampilkanSemuaAntrean(inventaris);
        break;

      case 6:
        print("\nProgram UAS selesai. Terima kasih!");
        break;

      default:
        print("Pilihan menu salah!");
    }
  }
}
