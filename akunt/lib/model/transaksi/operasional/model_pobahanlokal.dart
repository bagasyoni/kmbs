import 'package:akunt/controller/login_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class model_pobahanlokal {
  String baseUrl = base_url;

  /// paginate
  Future<List> data_pobahanlokalpaginate(
      String cari, int paramoffset, int paramlimit) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/pobahanlokalpaginate"),
      body: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///paginate
  Future countPobahanlokalPaginate(String key_cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/countpobahanlokalpaginate"),
      body: {"cari": key_cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> data_modal(String cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/modal_po_bahan_lokal"),
      body: {"cari": cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> insert_po_bahan_lokal(Map data_insert) async {
    try {
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/tambah_header_po_bahan_lokal"),
        body: {
          "NO_BUKTI": data_insert['NO_BUKTI'].toString(),
          "TGL": data_insert['TGL'].toString(),
          "JTEMPO": data_insert['JTEMPO'].toString(),
          "CURR": data_insert['CURR'].toString(),
          "CURRNM": data_insert['CURRNM'].toString(),
          "RATE": data_insert['RATE'].toString(),
          "KODES": data_insert['KODES'].toString(),
          "NAMAS": data_insert['NAMAS'].toString(),
          "ALAMAT": data_insert['ALAMAT'].toString(),
          "KOTA": data_insert['KOTA'].toString(),
          "NOTES": data_insert['NOTES'].toString(),
          "TOTAL_QTY": data_insert['TOTAL_QTY'].toString(),
          "SISA_QTY": data_insert['SISA_QTY'].toString(),
          "TOTAL1": data_insert['TOTAL1'].toString(),
          "DISC": data_insert['DISC'].toString(),
          "PPN": data_insert['PPN'].toString(),
          "NETT1": data_insert['NETT1'].toString(),
          "DISC1": data_insert['DISC1'].toString(),
          "PPN1": data_insert['PPN1'].toString(),
          "PPH1": data_insert['PPH1'].toString(),
          "PPH": data_insert['PPH'].toString(),
          "TOTAL": data_insert['TOTAL'].toString(),
          "RPDISC": data_insert['RPDISC'].toString(),
          "RPPPN": data_insert['RPPPN'].toString(),
          "NETT": data_insert['NETT'].toString(),
          "SISA": data_insert['SISA'].toString(),
          "RPDISC1": data_insert['RPDISC1'].toString(),
          "RPPPN1": data_insert['RPPPN1'].toString(),
          "RPPPH1": data_insert['RPPPH1'].toString(),
          "RPPPH": data_insert['RPPPH'].toString(),
          "USRIN": data_insert['USRIN'].toString(),
          "TG_IN": data_insert['TG_IN'].toString(),
          "FLAG": data_insert['FLAG'].toString(),
          "PER": data_insert['PER'].toString(),
          "TYP": data_insert['TYP'].toString(),
          "GOL": data_insert['GOL'].toString(),
          "BRAND": data_insert['BRAND'].toString(),
          "rateks": data_insert['rateks'],
          "ACNO1": data_insert['ACNO1'].toString(),
          "ACNO1_NM": data_insert['ACNO1_NM'].toString(),
        },
      );

      ///DATA DETAIL
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_po_bahan_lokal"),
          body: {
            "REC": (i + 1).toString(),
            "NO_BUKTI": data_insert['NO_BUKTI'].toString(),
            "PER": data_insert['PER'].toString(),
            "FLAG": data_insert['FLAG'].toString(),
            "KD_BHN": data_detail[i]['KD_BHN'].toString(),
            "NA_BHN": data_detail[i]['NA_BHN'].toString(),
            "SATUAN": data_detail[i]['SATUAN'].toString(),
            "QTY": data_detail[i]['QTY'].toString(),
            "HARGA": data_detail[i]['HARGA'].toString(),
            "TOTAL": data_detail[i]['TOTAL'].toString(),
            "KET": data_detail[i]['KET'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ///UPDATE PO BAHAN LOKAL DETAIL
  Future<List> update_po_bahan_lokal(Map data_insert) async {
    try {
      await http.post(
        Uri.parse("${baseUrl}:3000/hapus_detail"),
        body: {
          "no_bukti": data_insert['NO_BUKTI'].toString(),
          "kolom": "NO_BUKTI",
          "tabel": "pod"
        },
      );

      ///DATA HEADER
      final response = await http.post(
        Uri.parse("${baseUrl}:3000/edit_header_po_bahan_lokal"),
        body: {
          "NO_BUKTI": data_insert['NO_BUKTI'].toString(),
          "TGL": data_insert['TGL'].toString(),
          "JTEMPO": data_insert['JTEMPO'].toString(),
          "CURR": data_insert['CURR'].toString(),
          "CURRNM": data_insert['CURRNM'].toString(),
          "RATE": data_insert['RATE'].toString(),
          "KODES": data_insert['KODES'].toString(),
          "NAMAS": data_insert['NAMAS'].toString(),
          "ALAMAT": data_insert['ALAMAT'].toString(),
          "KOTA": data_insert['KOTA'].toString(),
          "NOTES": data_insert['NOTES'].toString(),
          "TOTAL_QTY": data_insert['TOTAL_QTY'].toString(),
          "SISA_QTY": data_insert['SISA_QTY'].toString(),
          "TOTAL1": data_insert['TOTAL1'].toString(),
          "DISC": data_insert['DISC'].toString(),
          "PPN": data_insert['PPN'].toString(),
          "NETT1": data_insert['NETT1'].toString(),
          "DISC1": data_insert['DISC1'].toString(),
          "PPN1": data_insert['PPN1'].toString(),
          "PPH1": data_insert['PPH1'].toString(),
          "PPH": data_insert['PPH'].toString(),
          "TOTAL": data_insert['TOTAL'].toString(),
          "RPDISC": data_insert['RPDISC'].toString(),
          "RPPPN": data_insert['RPPPN'].toString(),
          "NETT": data_insert['NETT'].toString(),
          "SISA": data_insert['SISA'].toString(),
          "RPDISC1": data_insert['RPDISC1'].toString(),
          "RPPPN1": data_insert['RPPPN1'].toString(),
          "RPPPH1": data_insert['RPPPH1'].toString(),
          "RPPPH": data_insert['RPPPH'].toString(),
          "USRNM": data_insert['USRNM'].toString(),
          "TG_SMP": data_insert['TG_SMP'].toString(),
          "FLAG": data_insert['FLAG'].toString(),
          "PER": data_insert['PER'].toString(),
          "TYP": data_insert['TYP'].toString(),
          "GOL": data_insert['GOL'].toString(),
          "BRAND": data_insert['BRAND'].toString(),
          "rateks": data_insert['rateks'],
          "ACNO1": data_insert['ACNO1'].toString(),
          "ACNO1_NM": data_insert['ACNO1_NM'].toString(),
        },
      );

      ///DATA DETAIL
      List data_detail = data_insert['tabeld'];
      for (int i = 0; i < data_detail.length; i++) {
        await http.post(
          Uri.parse("${baseUrl}:3000/tambah_detail_po_bahan_lokal"),
          body: {
            "REC": (i + 1).toString(),
            "NO_BUKTI": data_insert['NO_BUKTI'].toString(),
            "PER": data_insert['PER'].toString(),
            "FLAG": data_insert['FLAG'].toString(),
            "KD_BHN": data_detail[i]['KD_BHN'].toString(),
            "NA_BHN": data_detail[i]['NA_BHN'].toString(),
            "SATUAN": data_detail[i]['SATUAN'].toString(),
            "QTY": data_detail[i]['QTY'].toString(),
            "HARGA": data_detail[i]['HARGA'].toString(),
            "TOTAL": data_detail[i]['TOTAL'].toString(),
            "KET": data_detail[i]['KET'].toString(),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> check_no_bukti(
      String kode, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/check_nobukti"),
      body: {"cari": kode, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> get_no_bukti(
      String tipe, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/no_urut"),
      body: {"tipe": tipe, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> cari_po_bahan_lokal(String cari) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/cari_po_bahan_lokal"),
      body: {"cari": cari},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT HEADER
  Future<List> select_po_bahan_lokal(
      String cari, String start_date, String end_date, String periode) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/tampil_po_bahan_lokal"),
      body: {
        "cari": cari,
        "tglawal": start_date,
        "tglakhir": end_date,
        "periode": periode
      },
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///SELECT DETAIL
  Future<List> select_po_bahan_lokal_detail(
      String no_bukti, String paramkolom, String paramtabel) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/select_detail"),
      body: {"cari": no_bukti, "kolom": paramkolom, "tabel": paramtabel},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  ///COBA COBA SELECT DETAIL
  Future<List> select_detail(String no_bukti) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/ambil_po_detail"),
      body: {"cari": no_bukti},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }

  Future<List> delete_po_bahan_lokal(String no_bukti) async {
    final response = await http.post(
      Uri.parse("${baseUrl}:3000/hapus_po_bahanlokal"),
      body: {"no_bukti": no_bukti},
    );
    var results2 = json.decode(response.body);
    return results2['data'].toList();
  }
}
