import 'package:codigo6_alerts/pages/home_page.dart';
import 'package:codigo6_alerts/pages/map_page.dart';
import 'package:codigo6_alerts/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int indexPage = 0;
  List<Widget> pages = [
    HomePage(),
    Center(
      child: Text("Favorites"),
    ),
    Center(
      child: Text("news"),
    ),
    ProfilePage(),
    MapPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff98DBB0),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          print(value);
          indexPage = value;
          setState(() {});
        },
        backgroundColor: const Color(0xff98DBB0),
        type: BottomNavigationBarType.fixed,
        currentIndex: indexPage,
        iconSize: 22,
        selectedFontSize: 14,
        selectedItemColor: const Color(0xffF08656),
        selectedLabelStyle: const TextStyle(color: Colors.red),
        showSelectedLabels: true,
        selectedIconTheme: const IconThemeData(
          size: 30,
        ),
        unselectedFontSize: 14,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/bxs-store.svg",
              colorFilter: ColorFilter.mode(
                  indexPage == 0 ? const Color(0xffF08656) : Colors.white,
                  BlendMode.srcIn),
              // color: indexPage == 0 ? const Color(0xffF08656) : Colors.white,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "Noticias",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Mis Datos",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: "ubicaciòn",
          ),
        ],
      ),
      body: pages[indexPage],
    );
  }
}
