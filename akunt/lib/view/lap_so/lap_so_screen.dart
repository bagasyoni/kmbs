import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:akunt/config/OnHoverButton.dart';
import 'package:akunt/config/animation_custom_dialog.dart';
import 'package:akunt/config/color.dart';
import 'package:akunt/config/config.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controller/laporan_so_controller.dart';
import '../../controller/transaksi/operasional/so_controller.dart';
import 'package:akunt/view/lap_so/widget/filter_tanggal.dart';
import 'package:akunt/view/lap_so/pilih_barang_a.dart';
import 'package:akunt/view/lap_so/pilih_barang_b.dart';
import 'package:akunt/view/lap_so/pilih_customer_a.dart';
import 'package:akunt/view/lap_so/pilih_customer_b.dart';

class LapSoScreen extends StatefulWidget {
  @override
  _LapSoScreenState createState() => _LapSoScreenState();
}

class _LapSoScreenState extends State<LapSoScreen> {
  String baseUrl = base_url;
  @override
  void initState() {
    Provider.of<LapSoController>(context, listen: false).initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LapSoController>(builder: (context, lapSo, child) {
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
                "Laporan Sales Order",
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
                  lapSo.proses_export_lapso(1);
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
                      child: InkWell(
                        onTap: () {
                          showAnimatedDialog_withCallBack(
                              context, FilterTanggal(), isFlip: true,
                              callback: (value) {
                            if (value != null) {
                              if (value) {
                                // lapSo.initData_add();
                                lapSo.notifyListeners();
                              } else {
                                lapSo.notifyListeners();
                                Navigator.pop(context, true);
                              }
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: GreyColor,
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(1, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/ic_tanggal.png",
                                height: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  width: 1,
                                  height: 25,
                                  color: GreyColor,
                                ),
                              ),
                              Text(
                                lapSo.range,
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
                    Expanded(
                      flex: 11,
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 5, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                                controller: lapSo.cus1Controller,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 18, bottom: 15),
                                  hintText: "Cari Customer",
                                  hintStyle: GoogleFonts.poppins(
                                      color: GreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  icon: Image.asset(
                                    "assets/images/ic_user_warna.png",
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
                                      PilihCustomerA(
                                          lapSo.cus1Controller.text.isEmpty
                                              ? null
                                              : lapSo.cus1Controller.text,
                                          lapSo),
                                      isFlip: false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                // focusNode: fokuse,
                                readOnly: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 18, bottom: 15),
                                  hintText: "S/D",
                                  hintStyle: GoogleFonts.poppins(
                                    color: GreyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
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
                                controller: lapSo.cus2Controller,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 18, bottom: 15),
                                  hintText: "Cari Customer",
                                  hintStyle: GoogleFonts.poppins(
                                      color: GreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  icon: Image.asset(
                                    "assets/images/ic_user_warna.png",
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
                                      PilihCustomerB(
                                          lapSo.cus2Controller.text.isEmpty
                                              ? null
                                              : lapSo.cus2Controller.text,
                                          lapSo),
                                      isFlip: false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 11,
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 5, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
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
                                controller: lapSo.brg1Controller,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 18, bottom: 15),
                                  hintText: "Cari Barang",
                                  hintStyle: GoogleFonts.poppins(
                                      color: GreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  icon: Image.asset(
                                    "assets/images/ic_po.png",
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
                                      PilihBarangA(
                                          lapSo.brg1Controller.text.isEmpty
                                              ? null
                                              : lapSo.brg1Controller.text,
                                          lapSo),
                                      isFlip: false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                // focusNode: fokuse,
                                readOnly: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 18, bottom: 15),
                                  hintText: "S/D",
                                  hintStyle: GoogleFonts.poppins(
                                    color: GreyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
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
                                controller: lapSo.brg2Controller,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 18, bottom: 15),
                                  hintText: "Cari Barang",
                                  hintStyle: GoogleFonts.poppins(
                                      color: GreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  icon: Image.asset(
                                    "assets/images/ic_po.png",
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
                                      PilihBarangB(
                                          lapSo.brg2Controller.text.isEmpty
                                              ? null
                                              : lapSo.brg2Controller.text,
                                          lapSo),
                                      isFlip: false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 11,
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
                child: (lapSo.data_list.length > 0)
                    ? ListView(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 24, top: 16, bottom: 4),
                          child: PaginatedDataTable(
                            source: MyData(lapSo.data_list, context, lapSo),
                            // header: Text('My Products'),
                            columns: [
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'No',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'No Bukti',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Tanggal',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
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
                                      fontSize: 15,
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
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Kode Barang',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Nama Barang',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Harga',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Qty',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Sub Total',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Keterangan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(label: Text('')),
                            ],
                            initialFirstRowIndex: 0,
                            columnSpacing: 0,
                            horizontalMargin: 10,
                            rowsPerPage: 13,
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                RichText(
                  text: TextSpan(
                    text: "Jumlah Transaksi : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: lapSo.data_list.length.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
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
                    text: "Total Qty : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: lapSo.qty.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
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
                    text: "Total Pengeluaran : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: config().format_rupiah(lapSo.total.toString()),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget pageField() {
    SoController pageTerima = Provider.of<SoController>(context, listen: false);
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
  LapSoController lapSo;
  MyData(this.dtx, this.context, this.lapSo);
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
        child: Text(dtx[index]['NO_BUKTI'].toString(),
            style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
      )),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(
              DateFormat('dd/MM/yyyy', "id_ID")
                  .format(DateTime.parse(dtx[index]['TGL']))
                  .toString(),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(dtx[index]['KODEC'].toString(),
              style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(dtx[index]['NAMAC'].toString(),
              style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(dtx[index]['KD_BRG'].toString(),
              style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
        ),
      ),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(dtx[index]['NA_BRG'].toString(),
              style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
        ),
      ),
      DataCell(SizedBox(
        width: double.infinity,
        child: Text(f.format(dtx[index]['HARGA']).toString(),
            style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
      )),
      DataCell(SizedBox(
        width: double.infinity,
        child: Text(
          dtx[index]['TOTAL_QTY'].toString(),
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
      )),
      DataCell(SizedBox(
        width: double.infinity,
        child: Text(f.format(dtx[index]['TOTAL']).toString(),
            style: TextStyle(color: Colors.black), textAlign: TextAlign.right),
      )),
      DataCell(
        SizedBox(
          width: double.infinity,
          child: Text(dtx[index]['KET'].toString(),
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center),
        ),
      ),
      DataCell(
        Text(''),
      ),
    ]);
  }
}
