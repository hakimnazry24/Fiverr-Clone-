import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';
import "package:flutter_app/welcomepage.dart";
import "package:flutter_app/firebase/firebase_options.dart";
import "package:google_fonts/google_fonts.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        theme: ThemeData(
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromRGBO(111, 250, 167, 1),
          )),
          colorScheme: ColorScheme.fromSeed(
            secondary: const Color.fromARGB(255, 223, 255, 223),
            primary: const Color.fromRGBO(111, 250, 167, 1),
            seedColor: const Color.fromARGB(255, 223, 255, 223),
          ),
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: GoogleFonts.roboto(
              fontSize: 20,
              fontStyle: FontStyle.normal,
            ),
            bodyMedium: GoogleFonts.roboto(),
            displaySmall: GoogleFonts.pacifico(),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const WelcomePage());
  }
}
