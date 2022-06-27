import 'dart:convert';
import 'package:flutter/services.dart';

class DataPiutang {
  int noid;
  String no_bukti;
  String tgl;
  String kodes;
  String namas;
  String acno;
  String nacno;
  String uraian;
  double sisa;
  double jumlah;
  double jumlahrp;
  double um;
  double jumlahinv;
  String curr;
  String info;
  String flag;
  double rate;
  String noinv;

  DataPiutang(
      {this.noid,
      this.no_bukti,
      this.tgl,
      this.kodes,
      this.namas,
      this.acno,
      this.nacno,
      this.uraian,
      this.um,
      this.sisa,
      this.jumlah,
      this.jumlahrp,
      this.jumlahinv,
      this.info,
      this.flag,
      this.curr,
      this.rate,
      this.noinv});

  factory DataPiutang.fromJson(var parsedJson) {
    return DataPiutang(
      noid: parsedJson['NO_ID'],
      no_bukti: parsedJson['NO_BUKTI'] as String,
      tgl: parsedJson['TGL'] as String,
      kodes: parsedJson['KODES'] as String,
      namas: parsedJson['NAMAS'] as String,
      acno: parsedJson['ACNO'] as String,
      nacno: parsedJson['NACNO'] as String,
      uraian: parsedJson['URAIAN'] as String,
      um: 0.00,
      sisa: 0.00,
      jumlah: 0.00,
      jumlahrp: 0.00,
      jumlahinv: 0.00,
      info: parsedJson['INFO'] as String,
      flag: parsedJson['FLAG'] as String,
      curr: parsedJson['CURR'] as String,
      // rate: double.parse(parsedJson['RATE'].toString()),
      rate: 0.00,
      noinv: "",
    );
  }
}