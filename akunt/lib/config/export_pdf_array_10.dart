import 'dart:io';
import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:open_file/open_file.dart' as open_file;

Future<Uint8List> ExportPDF(List header, List isi_data, String title) async {
  final pdf = pw.Document();
  var kerbau = NumberFormat("#,##0.00", "en_US");

  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    margin: pw.EdgeInsets.all(2),
    build: (context) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(
            child: pw.Padding(
              padding: pw.EdgeInsets.only(top: 16, left: 16, right: 16),
              child: pw.Text(
                title,
                textAlign: pw.TextAlign.center,
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
              ),
            ),
          ),
          pw.Center(
            child: pw.Container(
              height: 24,
            ),
          ),
          pw.Center(
            child: pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: pw.Divider(
                  height: 1,
                  thickness: 1,
                )),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            child: pw.Row(children: [
              pw.Expanded(
                flex: 2,
                child: pw.Text(header[0],
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 8,
                    )),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(header[1],
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 8)),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(
                  header[2],
                  style:
                      pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
                  textAlign: pw.TextAlign.right,
                ),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(
                  header[3],
                  style:
                      pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
                  textAlign: pw.TextAlign.right,
                ),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(
                  header[4],
                  style:
                      pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
                  textAlign: pw.TextAlign.right,
                ),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(
                  header[5],
                  style:
                      pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
                  textAlign: pw.TextAlign.right,
                ),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(header[6],
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 8),
                    textAlign: pw.TextAlign.right),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(header[7],
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 8),
                    textAlign: pw.TextAlign.right),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(header[8],
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 8),
                    textAlign: pw.TextAlign.right),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Text(header[9],
                    textAlign: pw.TextAlign.right,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 8)),
              ),
            ]),
          ),
          pw.Center(
            child: pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: pw.Divider(
                  height: 1,
                  thickness: 1,
                )),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: pw.Table(children: [
              for (int i = 0; i < isi_data.length; i++)
                pw.TableRow(
                  children: [
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(isi_data[i]['a'].toString(),
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(isi_data[i]['b'].toString(),
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['c']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['d']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['e']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['f']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['g']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['h']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['i']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Text(kerbau.format(isi_data[i]['j']).toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(fontSize: 8)),
                    ),
                  ],
                )
            ]),
          ),
          pw.Center(
            child: pw.Padding(
                padding: pw.EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: pw.Divider(
                  height: 1,
                  thickness: 1,
                )),
          ),
        ],
      );
    },
  ));

  final Directory directory =
      await path_provider.getApplicationDocumentsDirectory();
  final String path = directory.path;
  final File file = File('$path/$title.pdf');
  await file.writeAsBytes(await pdf.save());
  BotToast.closeAllLoading();
  await open_file.OpenFile.open('$path/$title.pdf');
}
