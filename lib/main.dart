import 'package:business_dot_com/view/Dashboard/Drawer/Gov_Schemes/all_scheme_chatagory.dart';
import 'package:business_dot_com/view/login_info/log_in.dart';
import 'package:business_dot_com/view/login_info/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyARTdK-12Yag3a78cn78PHrT1W2V9bvSdk',
        appId: '1:37414851158:android:f5047bf8c92fc1f6ed21f7',
        messagingSenderId: '37414851158',
        projectId: 'businessdotcom-62fd1',
        storageBucket: "businessdotcom-62fd1.firebasestorage.app"), //goto ab
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Business.Com",
      localizationsDelegates: const [
        MonthYearPickerLocalizations
            .delegate, // Required for year picker localization
      ],
      supportedLocales: const [
        Locale('en', ''), // Add locales as needed
      ],
      theme: ThemeData(
          textTheme:
              GoogleFonts.merriweatherTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
