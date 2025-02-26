'use strict';

var response = require('../../../res');
var connection = require('../../../koneksi');
var md5 = require('md5');

exports.index = function (req, res) {
    response.ok('aplikasi rest api berjalan', res)
};

///========================/// TRANSAKSI PO BAHAN LOKAL ///========================///
exports.pobahanlokal_paginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    var offset_page = Number(req.body.offset);
    var limit_page = Number(req.body.limit);
    if(filter_cari = '%%'){
        connection.query("SELECT * FROM po WHERE TYP='L' AND GOL='A' AND FLAG='PO' LIMIT ?, ?", [offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
    }else{
        connection.query("SELECT * FROM po WHERE TYP='L' AND GOL='A' AND FLAG='PO' AND (KODES LIKE ? OR NAMAS LIKE ?) LIMIT ?, ?", [filter_cari, filter_cari, offset_page, limit_page],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
    }
}

exports.count_pobahanlokalpaginate = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("SELECT COUNT(*) FROM po WHERE TYP='L' AND GOL='A' AND FLAG='PO' AND (KODES LIKE ? OR NAMAS LIKE ?)", [filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);
            }
        });
}

///HEADER
exports.tambahheaderpobahanlokal = function (req, res) {
    var NO_BUKTI = req.body.NO_BUKTI;
    var TGL = req.body.TGL;
    var JTEMPO = req.body.JTEMPO;
    var CURR = req.body.CURR;
    var CURRNM = req.body.CURRNM;
    var RATE = req.body.RATE;
    var KODES = req.body.KODES;
    var NAMAS = req.body.NAMAS;
    var ALAMAT = req.body.ALAMAT;
    var KOTA = req.body.KOTA;
    var NOTES = req.body.NOTES;
    var TOTAL_QTY = req.body.TOTAL_QTY;
    var SISA_QTY = req.body.SISA_QTY;
    var TOTAL1 = req.body.TOTAL1;
    var DISC = req.body.DISC;
    var PPN = req.body.PPN;
    var NETT1 = req.body.NETT1;
    var DISC1 = req.body.DISC1;
    var PPN1 = req.body.PPN1;
    var PPH1 = req.body.PPH1;
    var PPH = req.body.PPH;
    var TOTAL = req.body.TOTAL;
    var RPDISC = req.body.RPDISC;
    var RPPPN = req.body.RPPPN;
    var NETT = req.body.NETT;
    var SISA = req.body.SISA;
    var RPDISC1 = req.body.RPDISC1;
    var RPPPN1 = req.body.RPPPN1;
    var RPPPH1 = req.body.RPPPH1;
    var RPPPH = req.body.RPPPH;
    var USRIN = req.body.USRIN;
    var TG_IN = req.body.TG_IN;
    var FLAG = req.body.FLAG;
    var PER = req.body.PER;
    var TYP = req.body.TYP;
    var GOL = req.body.GOL;
    var BRAND = req.body.BRAND;
    var RATEKS = req.body.rateks;
    var ACNO1 = req.body.ACNO1;
    var ACNO1_NM = req.body.ACNO1_NM;

    connection.query("INSERT INTO po (NO_BUKTI,TGL,JTEMPO,CURR,CURRNM,RATE,KODES,NAMAS,ALAMAT,KOTA,NOTES,TOTAL_QTY,SISA_QTY,TOTAL1,DISC,PPN,NETT1,DISC1,PPN1,PPH1,PPH,TOTAL,RPDISC,RPPPN,NETT,SISA,RPDISC1,RPPPN1,RPPPH1,RPPPH,USRIN,TG_IN,FLAG,PER,TYP,GOL,BRAND,rateks,ACNO1,ACNO1_NM) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [NO_BUKTI, TGL, JTEMPO, CURR, CURRNM, RATE, KODES, NAMAS, ALAMAT, KOTA, NOTES, TOTAL_QTY, SISA_QTY, TOTAL1, DISC, PPN, NETT1, DISC1, PPN1, PPH1, PPH, TOTAL, RPDISC, RPPPN, NETT, SISA, RPDISC1, RPPPN1, RPPPH1, RPPPH, USRIN, TG_IN, FLAG, PER, TYP, GOL, BRAND, RATEKS, ACNO1, ACNO1_NM],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah Po Bahan Lokal Header', res);

            }
        });
};

///DETAIL
exports.tambahdetailpobahanlokal = function (req, res) {
    var REC = req.body.REC;
    var NO_BUKTI = req.body.NO_BUKTI;
    var PER = req.body.PER;
    var FLAG = req.body.FLAG;
    var KD_BHN = req.body.KD_BHN;
    var NA_BHN = req.body.NA_BHN;
    var SATUAN = req.body.SATUAN;
    var QTY = Number(req.body.QTY);
    var HARGA = Number(req.body.HARGA);
    var TOTAL = Number(req.body.TOTAL);
    var KET = req.body.KET;

    connection.query("INSERT INTO pod (REC, NO_BUKTI, PER, FLAG, KD_BHN, NA_BHN, SATUAN, QTY, HARGA, TOTAL, KET) VALUES (?,?,?,?,?,?,?,?,?,?,?); UPDATE po, pod SET pod.ID = po.NO_ID WHERE pod.NO_BUKTI = po.NO_BUKTI;", [REC, NO_BUKTI, PER, FLAG, KD_BHN, NA_BHN, SATUAN, QTY, HARGA, TOTAL, KET],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Tambah PO Detail', res);

            }
        });
};

exports.tampilpobahanlokal = function (req, res) {
    var nobukti = '%' + req.body.cari + '%';
    var tgl_awal = req.body.tglawal;
    var tgl_akhir = req.body.tglakhir;
    var periode = req.body.periode;
    connection.query("SELECT * FROM po WHERE if(NO_BUKTI<>'',NO_BUKTI like ?,true) AND TGL BETWEEN ? AND ? AND FLAG='PO' AND PER=? AND TYP='L' AND GOL='A'", [nobukti, tgl_awal, tgl_akhir, periode], function (error, rows, fields) {
        if (error) {
            console.log(error);
        } else {

            response.ok(rows, res);

        }
    });
};

exports.editheaderpobahanlokal = function (req, res) {
    var NO_BUKTI = req.body.NO_BUKTI;
    var TGL = req.body.TGL;
    var JTEMPO = req.body.JTEMPO;
    var CURR = req.body.CURR;
    var CURRNM = req.body.CURRNM;
    var RATE = req.body.RATE;
    var KODES = req.body.KODES;
    var NAMAS = req.body.NAMAS;
    var ALAMAT = req.body.ALAMAT;
    var KOTA = req.body.KOTA;
    var NOTES = req.body.NOTES;
    var TOTAL_QTY = req.body.TOTAL_QTY;
    var SISA_QTY = req.body.SISA_QTY;
    var TOTAL1 = req.body.TOTAL1;
    var DISC = req.body.DISC;
    var PPN = req.body.PPN;
    var NETT1 = req.body.NETT1;
    var DISC1 = req.body.DISC1;
    var PPN1 = req.body.PPN1;
    var PPH1 = req.body.PPH1;
    var PPH = req.body.PPH;
    var TOTAL = req.body.TOTAL;
    var RPDISC = req.body.RPDISC;
    var RPPPN = req.body.RPPPN;
    var NETT = req.body.NETT;
    var SISA = req.body.SISA;
    var RPDISC1 = req.body.RPDISC1;
    var RPPPN1 = req.body.RPPPN1;
    var RPPPH1 = req.body.RPPPH1;
    var RPPPH = req.body.RPPPH;
    var USRNM = req.body.USRNM;
    var TG_SMP = req.body.TG_SMP;
    var FLAG = req.body.FLAG;
    var PER = req.body.PER;
    var TYP = req.body.TYP;
    var GOL = req.body.GOL;
    var BRAND = req.body.BRAND;
    var rateks = req.body.rateks;
    var ACNO1 = req.body.ACNO1;
    var ACNO1_NM = req.body.ACNO1_NM;

    connection.query("UPDATE po set TGL=?, JTEMPO=?, CURR=?, CURRNM=?, RATE=?, KODES=?, NAMAS=?, ALAMAT=?, KOTA=?, NOTES=?, TOTAL_QTY=?, SISA_QTY=?, TOTAL1=?, DISC=?, PPN=?, NETT1=?, DISC1=?, PPN1=?, PPH1=?, PPH=?, TOTAL=?, RPDISC=?, RPPPN=?, NETT=?, SISA=?, RPDISC1=?, RPPPN1=?, RPPPH1=?, RPPPH=?, USRNM=?, TG_SMP=?, FLAG=?, PER=?, TYP=?, GOL=?, BRAND=?, rateks=?, ACNO1=?, ACNO1_NM=? WHERE NO_BUKTI=?", [TGL, JTEMPO, CURR, CURRNM, RATE, KODES, NAMAS, ALAMAT, KOTA, NOTES, TOTAL_QTY, SISA_QTY, TOTAL1, DISC, PPN, NETT1, DISC1, PPN1, PPH1, PPH, TOTAL, RPDISC, RPPPN, NETT, SISA, RPDISC1, RPPPN1, RPPPH1, RPPPH, USRNM, TG_SMP, FLAG, PER, TYP, GOL, BRAND, rateks, ACNO1, ACNO1_NM, NO_BUKTI],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok('Berhasil Edit PO Header', res);

            }
        });
};

exports.modalpobahanlokal = function (req, res) {
    var cari = '%' + req.body.cari + '%';
    if ([cari] != '') {
        connection.query("select * from po where KODES like ? or NAMAS like ? order by KODES", [cari, cari],
            function (error, rows, fields) {
                if (error) {
                    console.log(error);
                } else {

                    response.ok(rows, res);

                }
            });
    } else {
        connection.query("select * from po order by KODES",
            function (error, rows, fields) {
                if (error) {
                    console.log(error);
                } else {

                    response.ok(rows, res);

                }
            });
    };
};

exports.caripobahanlokal = function (req, res) {
    var filter_cari = '%' + req.body.cari + '%';
    connection.query("select * from po where (KODES like ? or NAMAS like ? or ALAMAT like ? or KOTA like ?) and FLAG='PO' and NO_BUKTI IN (SELECT NO_BUKTI FROM pod WHERE SISA>0)", [filter_cari, filter_cari, filter_cari, filter_cari],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
}

exports.hapuspobahanlokal = function (req, res) {
    var no_bukti = req.body.no_bukti;
    connection.query("DELETE from po where NO_BUKTI=?; DELETE from pod where NO_BUKTI=?", [no_bukti, no_bukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {

                response.ok(rows, res);

            }
        });
}

///SELECT DETAIL TRANSAKSI
exports.ambilpodetail = function (req, res) {
    var nobukti = req.body.cari;
    // var filter_cari = '%'+req.body.cari+'%';
    connection.query("SELECT * from po where NO_BUKTI=?", [nobukti],
        function (error, rows, fields) {
            if (error) {
                console.log(error);
            } else {
                response.ok(rows, res);

            }
        });
}