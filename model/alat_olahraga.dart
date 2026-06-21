class AlatOlahraga {
  int id;
  String nama;
  int _stok;

  AlatOlahraga(this.id, this.nama, this._stok);

  int get stok => _stok;

  bool kurangiStok(int jumlah) {
    if (_stok >= jumlah) {
      _stok -= jumlah;
      return true;
    }
    return false;
  }

  void tampilkanData() {
    String namaFormatted = nama.padRight(45);
    print("[$id]\t $namaFormatted | Stok: $_stok");
  }
}
