import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class FileHelper {
  static Future<File> writeFile(
      {required String path, required String content}) async {
    final file = File(path);

    // Menuliskan konten ke dalam berkas.
    debugPrint('Saved to $path');
    return file.writeAsString(content);
  }

  static Future<String> readFile({required String filePath}) async {
    try {
      final file = File(filePath);

      // Membaca berkas sebagai sebuah String.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // Jika terjadi eror, mencetak pesan eror ke konsol dan mengembalikan teks kosong.
      debugPrint(e.toString());
      return '';
    }
  }

  static Future<String> getFilePath({required String filename}) async {
    final directory = await getApplicationDocumentsDirectory();
    final prefix = directory.path;
    final absolutePath = '$prefix/$filename.txt';
    return absolutePath;
  }
}
