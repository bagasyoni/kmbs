import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:akunt/config/color.dart';
import 'package:akunt/config/config.dart';
import 'package:akunt/controller/transaksi/operasional/pobahanimport_controller.dart';
import 'package:akunt/model/master/operasional/data_bhn.dart';
import 'package:provider/provider.dart';

Widget AddPobahanCard(BuildContext context, int index, DataBhn data_bhn) {
  TextEditingController kd_bhnController = new TextEditingController();
  TextEditingController na_bhnController = new TextEditingController();
  TextEditingController satuanController = new TextEditingController();
  TextEditingController ketController = new TextEditingController();
  TextEditingController hargaController = new TextEditingController();
  TextEditingController qtyController = new TextEditingController();
  double subTotal = data_bhn.qty * data_bhn.harga;
  double subTotal1 = (data_bhn.qty * data_bhn.harga) *
      double.parse((PobahanimportController.rate).toString());
  kd_bhnController.value = TextEditingValue(
    text: data_bhn.kd_bhn.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bhn.kd_bhn.toString().length),
    ),
  );
  na_bhnController.value = TextEditingValue(
    text: data_bhn.na_bhn.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bhn.na_bhn.toString().length),
    ),
  );
  satuanController.value = TextEditingValue(
    text: data_bhn.satuan.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bhn.satuan.toString().length),
    ),
  );
  ketController.value = TextEditingValue(
    text: data_bhn.ket.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bhn.ket.toString().length),
    ),
  );
  hargaController.value = TextEditingValue(
    text: config().format_rupiah(data_bhn.harga.toString()),
    selection: TextSelection.fromPosition(
      TextPosition(
          offset: config().format_rupiah(data_bhn.harga.toString()).length),
    ),
  );
  qtyController.value = TextEditingValue(
    text: data_bhn.qty.toString(),
    selection: TextSelection.fromPosition(
      TextPosition(offset: data_bhn.qty.toString().length),
    ),
  );
  var pobahanController =
      Provider.of<PobahanimportController>(context, listen: false);

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    "${index + 1}.",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    data_bhn.kd_bhn ?? "",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: na_bhnController,
                  readOnly: true,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                    hintText: "Nama Bahan",
                    hintStyle: GoogleFonts.poppins(
                        color: GreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (numb) {
                    if (numb.isNotEmpty) {
                      pobahanController.data_bhn_keranjang[index].na_bhn =
                          na_bhnController.text;
                      pobahanController.hitungSubTotal();
                      pobahanController.notifyListeners();
                    }
                  },
                  onFieldSubmitted: (value) {
                    pobahanController.data_bhn_keranjang[index].na_bhn =
                        na_bhnController.text;
                    pobahanController.hitungSubTotal();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  readOnly: true,
                  controller: satuanController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                    hintText: "-",
                    hintStyle: GoogleFonts.poppins(
                        color: GreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (numb) {
                    if (numb.isNotEmpty) {
                      pobahanController.data_bhn_keranjang[index].satuan =
                          satuanController.text;
                      pobahanController.hitungSubTotal();
                      pobahanController.notifyListeners();
                    }
                  },
                  onFieldSubmitted: (value) {
                    pobahanController.data_bhn_keranjang[index].satuan =
                        satuanController.text;
                    pobahanController.hitungSubTotal();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: ketController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                    hintText: "Keterangan",
                    hintStyle: GoogleFonts.poppins(
                        color: GreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (numb) {
                    if (numb.isNotEmpty) {
                      pobahanController.data_bhn_keranjang[index].ket =
                          ketController.text;
                      pobahanController.hitungSubTotal();
                      pobahanController.notifyListeners();
                    }
                  },
                  onFieldSubmitted: (value) {
                    pobahanController.data_bhn_keranjang[index].ket =
                        ketController.text;
                    pobahanController.hitungSubTotal();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: hargaController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                    hintText: "Rp 0",
                    hintStyle: GoogleFonts.poppins(
                        color: GreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (numb) {
                    if (numb.isNotEmpty) {
                      hargaController.value = TextEditingValue(
                        text: config().format_rupiah(hargaController.text),
                        selection: TextSelection.fromPosition(
                          TextPosition(
                              offset: config()
                                  .format_rupiah(hargaController.text)
                                  .length),
                        ),
                      );
                      pobahanController.data_bhn_keranjang[index].harga =
                          config().convert_rupiah(hargaController.text);
                      // pobahanController.notifyListeners();
                      pobahanController.hitungSubTotal();
                    }
                  },
                  onFieldSubmitted: (value) {
                    pobahanController.data_bhn_keranjang[index].harga =
                        config().convert_rupiah(hargaController.text);
                    pobahanController.hitungSubTotal();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: qtyController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                    hintText: "Qty",
                    hintStyle: GoogleFonts.poppins(
                        color: GreyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (numb) {
                    if (numb.isNotEmpty) {
                      pobahanController.data_bhn_keranjang[index].qty =
                          config().convert_rupiah(qtyController.text);
                      // pobahanController.hitungSubTotal();
                      // pobahanController.notifyListeners();
                    }
                  },
                  onFieldSubmitted: (value) {
                    pobahanController.data_bhn_keranjang[index].qty =
                        config().convert_rupiah(qtyController.text);
                    pobahanController.hitungSubTotal();
                    // pobahanController.notifyListeners();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  config().format_rupiah(subTotal.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: 30,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  border: Border.all(color: GreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  config().format_rupiah(subTotal1.toString()),
                  style: GoogleFonts.poppins(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              pobahanController.data_bhn_keranjang.removeAt(index);
              pobahanController.hitungSubTotal();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                "assets/images/ic_hapus.png",
                height: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
