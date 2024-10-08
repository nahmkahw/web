import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web/app_theme.dart';
import 'package:web/model/studentsuccess.dart';
import 'package:web/providers/authenprovider.dart';
import 'package:web/providers/master_provider.dart';
import 'package:web/screens/master_Image_graduate.dart';
import 'package:web/screens/master_Image_graduate_success.dart';

class MasterSuccessProfileDetail extends StatefulWidget {
  @override
  _MasterSuccessProfileDetailState createState() =>
      _MasterSuccessProfileDetailState();
}

class _MasterSuccessProfileDetailState extends State<MasterSuccessProfileDetail>
    with SingleTickerProviderStateMixin {
  bool _isDetailsVisible = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // สร้าง Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // สร้าง Animation สำหรับการ Fade
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // เริ่มแอนิเมชันเมื่อเปิดหน้า
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      setState(() {
        _isDetailsVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MasterProvider>(context, listen: false);
    var authen = Provider.of<AuthenProvider>(context, listen: false);
    return MasterSuccessProfile(
      fadeAnimation: _fadeAnimation,
      profile: prov.success,
      accessToken: authen.profile.accessToken.toString(),
    );
  }
}

class MasterSuccessProfileCheck extends StatelessWidget {
  const MasterSuccessProfileCheck({
    super.key,
    required Animation<double> fadeAnimation,
    required this.profile,
    required this.accessToken,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final MasterSuccess profile;
  final String accessToken;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 794, // ความกว้าง A4 ที่ 96 DPI
          height: 1123,
          margin: EdgeInsets.all(16.0), // ความสูง A4 ที่ 96 DPI
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // รูปโปรไฟล์นักศึกษา พร้อมแอนิเมชันการ Fade In
              SizedBox(height: 40),

              CertificateLogo(fadeAnimation: _fadeAnimation),

              SizedBox(height: 24),

              CertificateUniversity(fadeAnimation: _fadeAnimation),
              SizedBox(height: 8),

              CertificateHeader1(fadeAnimation: _fadeAnimation),
              SizedBox(height: 8),

              CertificateHeader2(fadeAnimation: _fadeAnimation),
              SizedBox(height: 24),

              CertificateHeader3(fadeAnimation: _fadeAnimation),
              SizedBox(height: 8),

              CertificateName(fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 24),

              CertificateCurr(fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 8),

              CertificateMajor(fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 24),

              CertificateConferenceDate(
                  fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 8),

              CertificateGraduateDate(
                  fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CertificateImageCheck(fadeAnimation: _fadeAnimation),
                  CertificateLinecense(fadeAnimation: _fadeAnimation)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MasterSuccessProfile extends StatelessWidget {
  const MasterSuccessProfile({
    super.key,
    required Animation<double> fadeAnimation,
    required this.profile,
    required this.accessToken,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final MasterSuccess profile;
  final String accessToken;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 794, // ความกว้าง A4 ที่ 96 DPI
          height: 1123,
          margin: EdgeInsets.all(16.0), // ความสูง A4 ที่ 96 DPI
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // รูปโปรไฟล์นักศึกษา พร้อมแอนิเมชันการ Fade In
              SizedBox(height: 40),

              CertificateLogo(fadeAnimation: _fadeAnimation),

              SizedBox(height: 24),

              CertificateUniversity(fadeAnimation: _fadeAnimation),
              SizedBox(height: 8),

              CertificateHeader1(fadeAnimation: _fadeAnimation),
              SizedBox(height: 8),

              CertificateHeader2(fadeAnimation: _fadeAnimation),
              SizedBox(height: 24),

              CertificateHeader3(fadeAnimation: _fadeAnimation),
              SizedBox(height: 8),

              CertificateName(fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 24),

              CertificateCurr(fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 8),

              CertificateMajor(fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 24),

              CertificateConferenceDate(
                  fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 8),

              CertificateGraduateDate(
                  fadeAnimation: _fadeAnimation, profile: profile),
              SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CertificateImage(fadeAnimation: _fadeAnimation),
                  CertificateLinecense(fadeAnimation: _fadeAnimation)
                ],
              ),
              SizedBox(height: 24),

              CertificateBarcode(
                  fadeAnimation: _fadeAnimation, accessToken: accessToken),

              SizedBox(height: 24),

              // ปุ่มเพิ่มเติม พร้อมแอนิเมชันการ Fade
              CertificateButton(fadeAnimation: _fadeAnimation),
            ],
          ),
        ),
      ),
    );
  }
}

class CertificateButton extends StatelessWidget {
  const CertificateButton({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // กดเพื่อดูผลการเรียน
            },
            icon: Icon(Icons.print),
            label: Text('พิมพ์ไฟล์ pdf'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              // กดเพื่อดูข้อมูลการลงทะเบียน
            },
            icon: Icon(Icons.edit),
            label: Text('กำหนดวันหมดอายุ'),
          ),
        ],
      ),
    );
  }
}

class CertificateBarcode extends StatelessWidget {
  const CertificateBarcode({
    super.key,
    required Animation<double> fadeAnimation,
    required this.accessToken,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final String accessToken;

  void openLinkInNewTab(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final currentUrl = html.window.location.href;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: QrImage(
            data: "$currentUrl/#/success/$accessToken",
            version: QrVersions.auto,
            size: 200,
            gapless: false,
          ),
        ),
        Text("${currentUrl}success/$accessToken"),
        ElevatedButton(
          onPressed: () {
            openLinkInNewTab("${currentUrl}success/$accessToken");
          },
          child: Text('Open Link'),
        ),
      ],
    );
  }
}

class CertificateImage extends StatelessWidget {
  const CertificateImage({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: MasterImageGraduate(),
    );
  }
}

class CertificateImageCheck extends StatelessWidget {
  const CertificateImageCheck({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: MasterImageGraduateSuccess(),
    );
  }
}

class CertificateLinecense extends StatelessWidget {
  const CertificateLinecense({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/images/line.jpg'), // ใช้รูปจาก memory
                fit: BoxFit.cover, // ปรับขนาดรูปให้เต็มวงกลม
                alignment: Alignment.topCenter, // จัดตำแหน่งภาพให้อยู่ด้านบน
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        FadeTransition(
          opacity: _fadeAnimation,
          child: const Text(
            '(ผศ.วุฒิศักดิ์ ลาภเจริญทรัพย์)',
            style: AppTheme.body2,
          ),
        ),
        SizedBox(height: 8),
        FadeTransition(
          opacity: _fadeAnimation,
          child: const Text(
            'ประธานกรรมการส่งเสริมกิจการมหาวิทยาลัย',
            style: AppTheme.body2,
          ),
        ),
        SizedBox(height: 8),
        FadeTransition(
          opacity: _fadeAnimation,
          child: const Text(
            'กรรมการสภามหาวิทยาลัยรามคำแหง',
            style: AppTheme.body2,
          ),
        ),
        SizedBox(height: 8),
        FadeTransition(
          opacity: _fadeAnimation,
          child: const Text(
            'รักษาราชการแทนอธิการบดีมหาวิทยาลัยรามคำแหง',
            style: AppTheme.body2,
          ),
        ),
      ],
    );
  }
}

class CertificateGraduateDate extends StatelessWidget {
  const CertificateGraduateDate({
    super.key,
    required Animation<double> fadeAnimation,
    required this.profile,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final MasterSuccess profile;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Text(
        'ให้ไว้ ณ วันที่ ${profile.graduateddate}',
        style: AppTheme.body1,
      ),
    );
  }
}

class CertificateConferenceDate extends StatelessWidget {
  const CertificateConferenceDate({
    super.key,
    required Animation<double> fadeAnimation,
    required this.profile,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final MasterSuccess profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                'ตั้งแต่วันที่ ${profile.conferencedate}',
                style: AppTheme.body1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CertificateMajor extends StatelessWidget {
  const CertificateMajor({
    super.key,
    required Animation<double> fadeAnimation,
    required this.profile,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final MasterSuccess profile;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Text(
        'สาขาวิชา ${profile.majornamethai}',
        style: AppTheme.body1,
      ),
    );
  }
}

class CertificateCurr extends StatelessWidget {
  const CertificateCurr({
    super.key,
    required Animation<double> fadeAnimation,
    required this.profile,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final MasterSuccess profile;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Text(
        'ศึกษาสำเร็จตามหลักสูตร ${profile.currname}',
        style: AppTheme.body1,
      ),
    );
  }
}

class CertificateName extends StatelessWidget {
  const CertificateName({
    super.key,
    required Animation<double> fadeAnimation,
    required this.profile,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final MasterSuccess profile;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Text(
        '${profile.namethai}',
        style: AppTheme.header,
      ),
    );
  }
}

class CertificateHeader3 extends StatelessWidget {
  const CertificateHeader3({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: const Text(
        'ใบรับรองคุณวุฒิฉบับนี้ให้ไว้เพื่อแสดงว่า สภามหาวิทยาลัยอนุมัติให้',
        style: AppTheme.body1,
      ),
    );
  }
}

class CertificateHeader2 extends StatelessWidget {
  const CertificateHeader2({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: const Text(
        'โดยอนุมัติของสภามหาวิทยาลัย',
        style: AppTheme.body1,
      ),
    );
  }
}

class CertificateHeader1 extends StatelessWidget {
  const CertificateHeader1({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: const Text(
        'ใบรับรองคุณวุฒิ',
        style: AppTheme.body1,
      ),
    );
  }
}

class CertificateUniversity extends StatelessWidget {
  const CertificateUniversity({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: const Text(
        'มหาวิทยาลัยรามคำแหง',
        style: AppTheme.header,
      ),
    );
  }
}

class CertificateLogo extends StatelessWidget {
  const CertificateLogo({
    super.key,
    required Animation<double> fadeAnimation,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage('assets/images/ram.png'), // ใช้รูปจาก memory
            fit: BoxFit.cover, // ปรับขนาดรูปให้เต็มวงกลม
            alignment: Alignment.topCenter, // จัดตำแหน่งภาพให้อยู่ด้านบน
          ),
        ),
      ),
    );
  }
}
