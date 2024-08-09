// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
//
// Future<void> createDocument(BuildContext context) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['txt'],
//   );
//
//   if (result != null && result.files.single.path != null) {
//     final File file = File(result.files.single.path!);
//     await file.writeAsString('Hello from SAF!');
//     print('تم إنشاء الملف في: ${file.path}');
//   } else {
//     // المستخدم لم يختار أي ملف
//     print('لم يتم اختيار أي ملف');
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAF Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => createDocument(context),
//           child: Text('اختر ملف لحفظه'),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MyHomePage(),
//   ));
// }
//
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
// import 'package:permission_handler/permission_handler.dart';
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAF Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => openDocumentTreeAndSaveFile(context),
//           child: Text('اختر مجلد واحفظ ملف'),
//         ),
//       ),
//     );
//   }
//
//   Future<void> openDocumentTreeAndSaveFile(BuildContext context) async {
//     // طلب إذن الكتابة على التخزين
//     if (await Permission.storage.request().isGranted) {
//       // فتح مستكشف الملفات لاختيار المجلد
//       String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
//
//       if (selectedDirectory == null) {
//         // المستخدم لم يختار أي مجلد
//         print('لم يتم اختيار أي مجلد');
//         return;
//       }
//
//       try {
//         // إنشاء مسار لملف جديد داخل المجلد الذي اختاره المستخدم
//         final String filePath = '$selectedDirectory/myfile.txt';
//         final File newFile = File(filePath);
//
//         // كتابة بعض البيانات في الملف
//         await newFile.writeAsString('Hello from SAF!');
//
//         // عرض رسالة للمستخدم تفيد بأن الملف تم حفظه بنجاح
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم حفظ الملف في: $filePath')),
//         );
//
//         print('تم حفظ الملف في: $filePath');
//       } catch (e) {
//         // في حالة حدوث خطأ أثناء الكتابة إلى الملف
//         print('حدث خطأ أثناء حفظ الملف: $e');
//       }
//     } else {
//       print('لم يتم منح إذن التخزين');
//     }
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MyHomePage(),
//   ));
// }

