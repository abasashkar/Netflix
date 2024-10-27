import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:netflix_app/firebase_options.dart';
import 'package:netflix_app/provider/botomnav_provider.dart';
import 'package:netflix_app/provider/login_provider.dart';
import 'package:netflix_app/provider/searchpage_provider.dart';
import 'package:netflix_app/screens/loginpage.dart';
import 'package:netflix_app/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => SearchpageProvider()),
          ChangeNotifierProvider(create: (_) => BottomProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Netflix App',
          theme: ThemeData.dark(useMaterial3: true),
          home: const Loginpage(),
        ));
  }
}
