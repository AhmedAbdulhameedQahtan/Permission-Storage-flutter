import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAF Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => openDocumentTreeAndSaveFile(context),
          child: Text('اختر مجلد واحفظ ملف'),
        ),
      ),
    );
  }

  Future<void> openDocumentTreeAndSaveFile(BuildContext context) async {
    // طلب إذن إدارة التخزين الخارجي
    if (await Permission.manageExternalStorage.request().isGranted) {
      // فتح مستكشف الملفات لاختيار المجلد
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory == null) {
        // المستخدم لم يختار أي مجلد
        print('لم يتم اختيار أي مجلد');
        return;
      }

      try {
        // إنشاء مسار لملف جديد داخل المجلد الذي اختاره المستخدم
        final String filePath = '$selectedDirectory/myfile.txt';
        final File newFile = File(filePath);

        // كتابة بعض البيانات في الملف
        await newFile.writeAsString('Hello from SAF!');

        // عرض رسالة للمستخدم تفيد بأن الملف تم حفظه بنجاح
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم حفظ الملف في: $filePath')),
        );

        print('تم حفظ الملف في: $filePath');
      } catch (e) {
        print('حدث خطأ أثناء حفظ الملف: $e');
      }
    } else {
      // إذا لم يتم منح الإذن، يمكن عرض رسالة توضيحية للمستخدم
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لم يتم منح إذن الوصول إلى التخزين')),
      );
      print('لم يتم منح إذن الوصول إلى التخزين');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}
