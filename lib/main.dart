import 'package:business_dot_com/Controller/data_controller.dart';
import 'package:business_dot_com/view/login_info/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyARTdK-12Yag3a78cn78PHrT1W2V9bvSdk',
        appId: '1:37414851158:android:f5047bf8c92fc1f6ed21f7',
        messagingSenderId: '37414851158',
        projectId: 'businessdotcom-62fd1',
        storageBucket: "businessdotcom-62fd1.firebasestorage.app"),
  );
  Get.put(DataController());
  runApp(ScreenUtilInit(
    designSize: const Size(393, 852),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        title: "Business.Com",
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,

          MonthYearPickerLocalizations.delegate, // <--- Add this delegate
        ],
        supportedLocales: const [
          Locale('en', ''), // Add locales as needed
        ],
        theme: ThemeData(
          textTheme:
              GoogleFonts.merriweatherTextTheme(Theme.of(context).textTheme),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    },
  ));
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Business.Com",
//       localizationsDelegates: const [
//         MonthYearPickerLocalizations
//             .delegate, // Required for year picker localization
//       ],
//       supportedLocales: const [
//         Locale('en', ''), // Add locales as needed
//       ],
//       theme: ThemeData(
//           textTheme:
//               GoogleFonts.merriweatherTextTheme(Theme.of(context).textTheme)),
//       debugShowCheckedModeBanner: false,
//       home: LogIn(),
//     );
//   }
// }
