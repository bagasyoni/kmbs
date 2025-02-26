// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:akunt/config/OnHoverButton.dart';
import 'package:akunt/config/animation_custom_dialog.dart';
import 'package:akunt/config/color.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controller/laporan_perincian_piu_controller.dart';
import 'package:akunt/view/lap_perincian_piu/pilih_periode.dart';

// IMPORT PRINT WEB
// import 'dart:js' as js;

class LapPerincianpiuScreen extends StatefulWidget {
  @override
  _LapPerincianpiuScreenState createState() => _LapPerincianpiuScreenState();
}

class _LapPerincianpiuScreenState extends State<LapPerincianpiuScreen> {
  var f = NumberFormat("#,##0.00", "en_US");
  String baseUrl = base_url;
  @override
  void initState() {
    Provider.of<LapPerincianpiuController>(context, listen: false).initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LapPerincianpiuController>(
        builder: (context, lapPerincianpiu, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            children: [
              Container(
                height: 25,
                width: 1,
                color: AbuColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Laporan Perincian Piutang",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 20,
            padding: EdgeInsets.all(0),
            icon: Image.asset(
              "assets/images/ic_back.png",
              height: 30,
            ),
          ),
          actions: [
            SizedBox(
              width: 16,
            ),
            OnHoverButton(
              child: InkWell(
                onTap: () {},
                hoverColor: Colors.white,
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/ic_download.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Export",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            OnHoverButton(
              child: InkWell(
                hoverColor: Colors.white,
                onTap: () {
                  // lapPerincianpiu.proses_export_lapperincianpiu(1);
                  // js.context.callMethod('open', [
                  //   'http://localhost/KMBS/KMBS/kmbs_php/Laporan_Masterbhn.php?PER=' +
                  //       lapPerincianpiu.perx
                  // ]);
                },
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/ic_print.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Cetak",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        backgroundColor: kBackgroundColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 16, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: GreyColor,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(
                                        1, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                readOnly: true,
                                // focusNode: fokuse,
                                controller: lapPerincianpiu.periodeController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 18, bottom: 15),
                                  hintText: "Cari Periode",
                                  hintStyle: GoogleFonts.poppins(
                                      color: GreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  icon: Image.asset(
                                    "assets/images/ic_tanggal.png",
                                    height: 20,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                onTap: () {
                                  showAnimatedDialog(
                                      context,
                                      PilihPeriode(
                                          lapPerincianpiu.periodeController.text
                                                  .isEmpty
                                              ? null
                                              : lapPerincianpiu
                                                  .periodeController.text,
                                          lapPerincianpiu),
                                      isFlip: false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: (lapPerincianpiu.data_list.length > 0)
                    ? ListView(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 24, top: 16, bottom: 4),
                          child: PaginatedDataTable(
                            source: MyData(lapPerincianpiu.data_list, context,
                                lapPerincianpiu),
                            // header: Text('My Products'),
                            columns: [
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'No',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Kode Customer',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Nama Customer',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Awal',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Masuk',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Keluar',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Lain',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Akhir',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(label: Text('')),
                            ],
                            initialFirstRowIndex: 0,
                            columnSpacing: 0,
                            horizontalMargin: 10,
                            rowsPerPage: 15,
                            showCheckboxColumn: true,
                          ),
                        ),
                      ])
                    : Container(
                        child: Center(
                          child: Text(
                            "Tidak ada data",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: GreyColor),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: GreyColor,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                RichText(
                  text: TextSpan(
                    text: "Jumlah Transaksi : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: lapPerincianpiu.data_list.length.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 600,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 20,
                    width: 1,
                    color: GreyColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Awal : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: f.format(lapPerincianpiu.awal),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 20,
                    width: 1,
                    color: GreyColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Jual : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: f.format(lapPerincianpiu.jual),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 20,
                    width: 1,
                    color: GreyColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Bayar : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: f.format(lapPerincianpiu.bayar),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 95,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 20,
                    width: 1,
                    color: GreyColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Lain : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: f.format(lapPerincianpiu.lain),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 20,
                    width: 1,
                    color: GreyColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Akhir : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: f.format(lapPerincianpiu.akhir),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget pageField() {
    LapPerincianpiuController pageTerima =
        Provider.of<LapPerincianpiuController>(context, listen: false);
    return Container(
      width: 70,
      height: 35,
      child: TextField(
        textAlign: TextAlign.center,
        controller: pageTerima.c_page,
        decoration: InputDecoration(
          hintText: "1",
          hintStyle: GoogleFonts.poppins(
              fontSize: 14, fontWeight: FontWeight.w400, color: GreyColor),
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        onSubmitted: (value) {
          int index = 1;
          try {
            index = int.parse(value.trim());
          } catch (e) {
            index = 1;
          }
          if (index == 0) {
            index = 1;
          } else {
            if (index > 0) {
              index = index - 1;
            }
          }
          if (index > pageTerima.page_index) {
            pageTerima.offset = (index * pageTerima.limit);
            pageTerima.page_index = index;
            pageTerima.c_page.text = (pageTerima.page_index + 1).toString();
            pageTerima.select_data();
          } else if (index < pageTerima.page_index) {
            pageTerima.offset = (index * pageTerima.limit);
            pageTerima.page_index = index;
            pageTerima.c_page.text = (pageTerima.page_index + 1).toString();
            pageTerima.select_data();
          }
        },
      ),
    );
  }
}

class MyData extends DataTableSource {
  var dtx = [];
  var f = NumberFormat("#,##0.00", "en_US");
  BuildContext context;
  LapPerincianpiuController lapPerincianpiu;
  MyData(this.dtx, this.context, this.lapPerincianpiu);
  bool get isRowCountApproximate => false;
  int get rowCount => dtx.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(SizedBox(
        width: double.infinity,
        child: Text("${index + 1}",
            style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
      )),
      DataCell(SizedBox(
        width: double.infinity,
        child: Text(dtx[index]['KODE'].toString(),
            style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
      )),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(dtx[index]['NAMA'].toString(),
              style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(f.format(dtx[index]['AWAL']),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(f.format(dtx[index]['MASUK']),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(f.format(dtx[index]['KELUAR']),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(f.format(dtx[index]['LAIN']),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right),
        ),
      ),
      DataCell(SizedBox(
        width: double.infinity,
        child: Text(
          f.format(dtx[index]['AKHIR']),
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
      )),
      DataCell(
        Text(''),
      ),
    ]);
  }
}
