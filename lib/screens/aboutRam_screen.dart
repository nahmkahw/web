import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:web/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:web/navigation_home_screen.dart';
// import 'package:web/schedule/schedule_home_screen.dart';
// import 'package:web/screens/runewsScreen.dart';
import 'package:web/widget/ru_wallpaper.dart';
import 'package:web/widget/top_bar.dart';
import 'package:web/widget/top_menu_bar.dart';

class aboutRam extends StatefulWidget {
  const aboutRam({Key? key}) : super(key: key);

  @override
  _aboutRamState createState() => _aboutRamState();
}

class _aboutRamState extends State<aboutRam> {
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  List<dynamic> _products = [
    {
      'title': 'พ่อขุนรามคำแหง',
      'image': 'https://www.ru.ac.th/th/images/porkunram.jpg',
      'description':
          'พ่อขุนรามคำแหงมหาราช หรือ ขุนรามราช หรือ พระบาทกมรเตงอัญศรีรามราช เป็นพระมหากษัตริย์พระองค์ที่ 3 ในราชวงศ์พระร่วงแห่งราชอาณาจักรสุโขทัย เสวยราชย์ประมาณ พ.ศ. 1822 ถึงประมาณ พ.ศ. 1842 พระองค์ทรงเป็นกษัตริย์พระองค์แรกของไทยที่ได้รับการยกย่องเป็น "มหาราช"'
    },
    {
      'title': 'ตราประจำมหาวิทยาลัย',
      'image': 'https://www.ru.ac.th/th/images/sila01.jpg',
      'description':
          '“ประวัติความเป็นมา” ศิลาจารึกพ่อขุนรามคำแหง เมื่อ พ.ศ.๒๓๗๖ ณ เนินปราสาทเมืองเก่าสุโขทัย อำเภอเมือง จังหวัดสุโขทัย โดยพระบาทสมเด็จพระจอมเกล้าเจ้าอยู่หัว ขณะที่ทรงผนวชเป็นผู้ค้นพบ'
    },
    {
      'title': 'ต้นไม้ ประจำมหาวิทยาลัย',
      'image': 'https://www.ru.ac.th/th/images/tree1.jpg',
      'description':
          'สมเด็จพระเทพรัตนราชสุดาฯ สยามบรมราชกุมารี พระราชทานต้นสุพรรณิการ์ เป็นต้นไม้ประจำมหาวิทยาลัย ขณะนี้ปลูกไว้บริเวณหน้าอาคาร หอประชุมพ่อขุนรามคำแหงมหาราช เมื่อวันที่ 18 มกราคม 2542'
    },
    {
      'title': 'วิสัยทัศน์',
      'image': 'https://www.naewna.com/uploads/news/source/389623.jpg',
      'description':
          'มหาวิทยาลัยรามคำแหงเป็นตลาดวิชาดิจิทัล ที่ให้บริการส่งเสริมการเรียนรู้ตลอดชีวิต'
    },
    {
      'title': 'ปณิธาน',
      'image': 'https://www.naewna.com/uploads/news/source/389623.jpg',
      'description':
          'พัฒนามหาวิทยาลัยรามคำแหงให้เป็นแหล่งวิทยาการแบบตลาดวิชาควบคู่แบบจำกัดจำนวน มุ่งผลิตบัณฑิตที่มีความรู้คู่คุณธรรม และจิตสำนึกในความรับผิดชอบต่อสังคม '
    },
    {
      'title': 'ผศ.วุฒิศักดิ์ ลาภเจริญทรัพย์',
      'image': 'https://www.ru.ac.th/th/images/President/1720275748_.png',
      'description':
          'ประธานกรรมการส่งเสริมกิจการมหาวิทยาลัย กรรมการสภามหาวิทยาลัยรามคำแหง รักษาราชการแทน อธิการบดีมหาวิทยาลัยรามคำแหง'
    }
  ];

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppTheme.nearlyWhite, // Change back arrow color to white
        ),
        title: Text(
          'เกี่ยวกับราม',
          style: AppTheme.title,
        ),
        centerTitle: true, // Centers the title
        backgroundColor:
            AppTheme.ru_dark_blue, // Background color of the AppBar
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.help,
        //       color: AppTheme.nearlyWhite,
        //     ),
        //     onPressed: () {
        //       Get.toNamed("/manual");
        //     },
        //   ),
        // ],
      ),
      floatingActionButton: _selectedIndex.length > 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.arrow_forward_ios),
            )
          : null,
      backgroundColor:
          isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
      body: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, -2),
                blurRadius: 8.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  RuWallpaper(),
                  Container(
                    width: double.infinity,
                    height: 500,
                    child: CarouselSlider(
                        carouselController: _carouselController,
                        options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.90,
                            enlargeCenterPage: true,
                            pageSnapping: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        items: _products.map((data) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //   image:
                                      //       AssetImage('assets/images/ID.png'),
                                      //   fit: BoxFit.cover,
                                      //   opacity: isLightMode ? 0.8 : 0.6,
                                      // ),
                                      color: AppTheme.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: _selectedIndex == data
                                          ? Border.all(
                                              color: Colors.blue.shade500,
                                              width: 3)
                                          : null,
                                      boxShadow: _selectedIndex == data
                                          ? [
                                              BoxShadow(
                                                  color: Colors.blue.shade100,
                                                  blurRadius: 30,
                                                  offset: const Offset(0, 10))
                                            ]
                                          : [
                                              BoxShadow(
                                                  color: AppTheme.ru_yellow,
                                                  blurRadius: 10,
                                                  offset:
                                                      const Offset(1.1, 1.1))
                                            ]),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Image.network(
                                            data['image'],
                                            fit: BoxFit.cover,
                                            height: 200,
                                            width: 120,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(data['title'],
                                            style: AppTheme.body1),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Text(data['description'],
                                              style: AppTheme.body2),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
