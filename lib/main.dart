import 'package:codigo6_alerts/pages/init_page.dart';
import 'package:codigo6_alerts/pages/login_page.dart';
import 'package:codigo6_alerts/utils/spg_global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  //STEP 6
  //para realizar la llamda usamos nuestro ensureInitilizded
  WidgetsFlutterBinding.ensureInitialized();
  //llamamos nuestro sharesPrefences para que se use de forma global
  SPGlobal prefs = SPGlobal();
  await prefs.initSharedPreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alerts App',
      home: const PreInit(),
      // home: InitPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        scaffoldBackgroundColor: const Color(0xffFAFFFB),
      ),
    );
  }
}

class PreInit extends StatelessWidget {
  const PreInit({super.key});

  @override
  Widget build(BuildContext context) {
    return SPGlobal().isLogin ? const InitPage() : LoginPage();
  }
}
