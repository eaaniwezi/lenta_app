import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../const/theme.dart' as style;
import 'package:google_fonts/google_fonts.dart';
import 'package:lenta_app/screens/map_screen.dart';
import 'package:lenta_app/screens/home_screen.dart';
import 'package:lenta_app/screens/profile_screen.dart';
import 'package:lenta_app/screens/favourite_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const MapScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: SizedBox(
        height: size.height * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navBarItem(
                pic: "assets/lenta.svg",
                picName: "Лента",
                currentPageIndex: 0,
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                }),
            _navBarItem(
                pic: "assets/map.svg",
                picName: "Карта",
                currentPageIndex: 1,
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                }),
            _navBarItem(
                pic: "assets/heart.svg",
                picName: "Избранные",
                currentPageIndex: 2,
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                }),
            _navBarItem(
                pic: "assets/profile.svg",
                picName: "Профиль",
                currentPageIndex: 3,
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                  });
                }),
          ],
        ),
      ),
    );
  }

  _navBarItem({
    required String pic,
    required String picName,
    required Function onTap,
    required int currentPageIndex,
  }) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            pic,
            color: currentPageIndex == pageIndex
                ? style.Colors.purpleColor
                : Colors.black,
          ),
          Text(
            picName,
            style: GoogleFonts.manrope(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: currentPageIndex == pageIndex
                  ? style.Colors.purpleColor
                  : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
