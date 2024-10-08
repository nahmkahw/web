import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/app_theme.dart';
import 'package:web/providers/master_provider.dart';

class MasterImageGraduateSuccess extends StatefulWidget {
  @override
  _MasterImageGraduateSuccessState createState() =>
      _MasterImageGraduateSuccessState();
}

class _MasterImageGraduateSuccessState
    extends State<MasterImageGraduateSuccess> {
  Uint8List? imageData = Uint8List(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imageData = context.watch<MasterProvider>().imageData;
    return SizedBox(
      width: 120,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: imageData!.length > 0
            ? Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: MemoryImage(imageData!), // ใช้รูปจาก memory
                    fit: BoxFit.cover, // ปรับขนาดรูปให้เต็มวงกลม
                    alignment:
                        Alignment.topCenter, // จัดตำแหน่งภาพให้อยู่ด้านบน
                  ),
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  color: AppTheme.ru_dark_blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      style: TextStyle(
                        fontFamily: AppTheme.ruFontKanit,
                        fontSize: 12,
                        color: AppTheme.nearlyWhite,
                      ),
                      'รูปภาพไม่แสดง โปรดติดต่อ (ระดับปริญญาโทและเอก) หน่วยบัตรประจำตัวนักศึกษา โทร. 02-3108605'),
                ),
                alignment: Alignment.center,
              ),
      ),
    );
    ;
  }
}
