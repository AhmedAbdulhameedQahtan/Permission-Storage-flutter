import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

Future<void> openDocumentTree(BuildContext context) async {
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

  if (selectedDirectory == null) {
    // المستخدم لم يختار أي مجلد
    print('لم يتم اختيار أي مجلد');
  } else {
    // المجلد الذي اختاره المستخدم
    print('تم اختيار المجلد: $selectedDirectory');

    // يمكنك الآن حفظ الملفات داخل هذا المجلد
    final File newFile = File('$selectedDirectory/myfile.txt');
    await newFile.writeAsString('Hello from SAF!');
    print('تم حفظ الملف في $selectedDirectory/myfile.txt');
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAF Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => openDocumentTree(context),
          child: Text('اختر مجلد'),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: MyHomePage(),
//   ));
// }
