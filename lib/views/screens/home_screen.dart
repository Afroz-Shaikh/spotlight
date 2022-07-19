import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlight/views/screens/add_new_screen.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  int idx = 0;
  HomeScreen({required this.idx});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int pageIndex = ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return AddVideo();
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (idx) {
          setState(() {
            widget.idx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        currentIndex: widget.idx,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset(
              'assets/play.svg',
              height: 25.h,
              width: 25.w,
              color: customColor(0, widget.idx),
            ),
          ),
          BottomNavigationBarItem(
              label: 'explore',
              icon: SvgPicture.asset(
                'assets/search.svg',
                color: customColor(1, widget.idx),
                height: 25.h,
                width: 25.w,
              )),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Upload',
                    style: TextStyle(
                      color: customColor(2, widget.idx),
                    ),
                  ),
                ],
              ),
              label: 'Add'),
          BottomNavigationBarItem(
              label: 'profile',
              icon: SvgPicture.asset(
                'assets/notif.svg',
                color: customColor(3, widget.idx),
                height: 25.h,
                width: 25.w,
              )),
          BottomNavigationBarItem(
              label: 'notif',
              icon: SvgPicture.asset(
                'assets/profile.svg',
                color: customColor(4, widget.idx),
                height: 25.h,
                width: 25.w,
              ))
        ],
      ),
      body: pages[widget.idx],
    );
  }
}

Color customColor(int pageIndex, int selectedPageIndex) {
  if (pageIndex == selectedPageIndex) {
    return Colors.red;
  } else {
    return Colors.white;
  }
}
