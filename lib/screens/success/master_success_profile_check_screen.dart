import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:web/app_theme.dart';
import 'package:web/providers/master_provider.dart';
import 'package:web/screens/success/master_success_profile_detail.dart';

class MasterSuccessProfileCheckScreen extends StatefulWidget {
  @override
  _MasterSuccessProfileCheckScreenState createState() =>
      _MasterSuccessProfileCheckScreenState();
}

class _MasterSuccessProfileCheckScreenState
    extends State<MasterSuccessProfileCheckScreen>
    with TickerProviderStateMixin {
  bool _isDetailsVisible = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  late String token;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    super.initState();
    token = Get.parameters['id'].toString();
    Provider.of<MasterProvider>(context, listen: false)
        .getImageProfileById(token);
    Provider.of<MasterProvider>(context, listen: false).getSuccessById(token);
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
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              final profile =
                  Provider.of<MasterProvider>(context, listen: false).success;
              return MasterSuccessProfileCheck(
                  fadeAnimation: _fadeAnimation,
                  profile: profile,
                  accessToken: token);
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
    return true;
  }
}
