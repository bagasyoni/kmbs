import 'package:akunt/controller/login_controller.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:akunt/model/master/finansial/model_account.dart';
import 'package:akunt/view/base_widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountController with ChangeNotifier {
  ///paginate
  bool proses = false;
  List data_accountList = [];
  List data_modalbankList = [];
  List data_modalkasList = [];
  TextEditingController c_page = new TextEditingController();
  TextEditingController searchController = TextEditingController();
  model_account m_account = model_account();
  List<DropdownMenuItem<int>> dropdownLimit;
  int totalNotaTerima = 0;
  int offset = 0;
  int limit = 50;
  double pageCount = 1;
  int page_index = 0;

  void setProses(bool proses) {
    this.proses = proses;
  }

  Future<void> ambil_account() async {
    data_accountList = await model_account().data_accountcari('');
    proses = false;
    notifyListeners();
  }

  void selectData(String cari) async {
    data_accountList = await model_account().data_modal_kas(cari);
    notifyListeners();
  }

  void selectDataModalKas(String cari) async {
    data_accountList = await model_account().data_modal_kas(cari);
    notifyListeners();
  }

  void selectDataModalBank(String cari) async {
    data_modalbankList = await model_account().data_modal_bank(cari);
    notifyListeners();
  }

  ///paginate
  Future<void> initData() async {
    c_page.text = '1';
    limitPaging();
    await selectDataPaginate(true);
    // initFilterSupplier();
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_accountList =
        await m_account.data_accpaginate(searchController.text, offset, limit);
    var count = await m_account.countAccPaginate(searchController.text);
    totalNotaTerima = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    pageCount = totalNotaTerima / limit;
    notifyListeners();
  }

  ///paginate
  void limitPaging() {
    dropdownLimit = [];
    dropdownLimit.add(DropdownMenuItem(
      child: Text('10'),
      value: 10,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('30'),
      value: 30,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('50'),
      value: 50,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('100'),
      value: 100,
    ));
    limit = dropdownLimit[0].value;
  }

  void modalDataKas(String cari) async {
    data_modalkasList = await model_account().data_modal_kas(cari);
    notifyListeners();
  }

  void modalDataBank(String cari) async {
    data_modalbankList = await model_account().data_modal_bank(cari);
    notifyListeners();
  }

  Future<void> search(var cari) async {
    data_accountList = await model_account().cari_account(cari);
    proses = false;
    notifyListeners();
  }

  //variable tambah supplier
  TextEditingController acnoController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController hdController = TextEditingController();
  TextEditingController grupController = TextEditingController();
  TextEditingController nm_grupController = TextEditingController();
  TextEditingController kelController = TextEditingController();
  TextEditingController nama_kelController = TextEditingController();
  TextEditingController bnkController = TextEditingController();
  TextEditingController pos1Controller = TextEditingController();
  TextEditingController usrnmController = TextEditingController();
  TextEditingController tg_smpController = TextEditingController();
  TextEditingController nonController = TextEditingController();

  Future<void> resetField() {
    acnoController.clear();
    namaController.clear();
    hdController.clear();
    grupController.clear();
    nm_grupController.clear();
    kelController.clear();
    nama_kelController.clear();
    bnkController.clear();
    pos1Controller.clear();
    usrnmController.clear();
    tg_smpController.clear();
    nonController.clear();
  }

  Future<bool> daftar_account() async {
    if (acnoController.text.isNotEmpty) {
      if (namaController.text.isNotEmpty) {
        BotToast.showLoading();
        var data_ready = await m_account.check_no_bukti(
            acnoController.text, "ACNO", "account");
        if (data_ready.length > 0) {
          Toast("Peringatan !", "Acno '${acnoController.text}' sudah ada !",
              false);
          Map data_insert = new Map();
          data_insert['NO_ID'] = null;
          data_insert['ACNO'] = acnoController.text;
          data_insert['NAMA'] = namaController.text;
          data_insert['HD'] = hdController.text;
          data_insert['GRUP'] = grupController.text;
          data_insert['NM_GRUP'] = nm_grupController.text;
          data_insert['KEL'] = kelController.text;
          data_insert['NAMA_KEL'] = nama_kelController.text;
          data_insert['BNK'] = bnkController.text;
          data_insert['POS1'] = pos1Controller.text;
          data_insert['USRNM'] = LoginController.nama_staff;
          data_insert['TG_SMP'] = DateTime.now();
          data_insert['NON'] = nonController.text;
          await model_account().insert_data_account(data_insert);
          Toast("Success !!", "Berhasil menambah account !", true);
          ambil_account();
          BotToast.closeAllLoading();
          return true;
          // }
        } else {
          Toast("Peringatan !", "Silahkan isi acno !", false);
          return false;
        }
      } else {
        Toast("Peringatan !", "Silahkan isi nama !", false);
        return false;
      }
    }
  }

  Future<void> init_edit_account(var data_account) async {
    acnoController.text = data_account['ACNO'];
    namaController.text = data_account['NAMA'];
    hdController.text = data_account['HD'];
    grupController.text = data_account['GRUP'];
    nm_grupController.text = data_account['NM_GRUP'];
    kelController.text = data_account['KEL'];
    nama_kelController.text = data_account['NAMA_KEL'];
    bnkController.text = data_account['BNK'];
    pos1Controller.text = data_account['POS1'];
    usrnmController.text = data_account['USRNM'];
    tg_smpController.text = data_account['TG_SMP'];
    nonController.text = data_account['NON'].toString();
  }

  // Future<void> data_satuan_barang() async {
  //   dropdownList_satuan_barang = [];
  //   dropdownList_satuan_barang
  //       .add(new DropdownMenuItem(value: "", child: new Text("Pilih Satuan")));
  //   List satuanList = await model_satuan().data_satuan("");
  //   for (int i = 0; i < satuanList.length; i++) {
  //     dropdownList_satuan_barang.add(new DropdownMenuItem(
  //         value: satuanList[i]['nama_satuan'].toString().toLowerCase(),
  //         child: new Text(satuanList[i]['nama_satuan'])));
  //   }
  //   dropdownList_satuan_barang.add(new DropdownMenuItem(
  //       value: "Tambah Baru ?", child: new Text("Tambah Baru ?")));
  //   satuan_barang = dropdownList_satuan_barang[0].value;
  // }

  Future<bool> edit_account(var id) async {
    if (acnoController.text.isNotEmpty) {
      if (namaController.text.isNotEmpty) {
        BotToast.showLoading();
        Map data_insert = new Map();
        data_insert['NO_ID'] = id;
        data_insert['ACNO'] = acnoController.text;
        data_insert['NAMA'] = namaController.text;
        data_insert['HD'] = hdController.text;
        data_insert['GRUP'] = grupController.text;
        data_insert['NM_GRUP'] = nm_grupController.text;
        data_insert['KEL'] = kelController.text;
        data_insert['NAMA_KEL'] = nama_kelController.text;
        data_insert['BNK'] = bnkController.text;
        data_insert['POS1'] = pos1Controller.text;
        data_insert['USRNM'] = LoginController.nama_staff;
        data_insert['TG_SMP'] = DateTime.now();
        data_insert['NON'] = nonController.text;
        await model_account().update_data_account_by_id(data_insert);
        ambil_account();
        Toast("Success !!", "Berhasil Mengedit Account !", true);
        BotToast.closeAllLoading();
        return true;
      } else {
        Toast("Peringatan !", "Silahkan isi acno !", false);
        return false;
      }
    } else {
      Toast("Peringatan !", "Silahkan isi nama !", false);
      return false;
    }
  }

  Future<bool> hapus_akun(var data) async {
    await model_account().delete_account_byID(data['NO_ID'].toString());
    selectData("");
  }
}
