class DataReservasi {
  String _namaPeminjam;
  int _idAlatYangDipinjam;
  int _jumlahDipinjam;

  DataReservasi(
    this._namaPeminjam,
    this._idAlatYangDipinjam,
    this._jumlahDipinjam,
  );

  String get namaPeminjam => _namaPeminjam;
  int get idAlatYangDipinjam => _idAlatYangDipinjam;
  int get jumlahDipinjam => _jumlahDipinjam;
}
