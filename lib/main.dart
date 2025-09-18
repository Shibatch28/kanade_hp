import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:google_fonts/google_fonts.dart';

import "view/screen/main_screen.dart";
import "theme/app_theme.dart";
import "cubit/navigation_cubit.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Google Fontsを事前に読み込み
  await GoogleFonts.pendingFonts([GoogleFonts.notoSerifJp()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '近藤 奏のホームページ',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NavigationCubit(),
        child: const MainApp(),
      ),
    );
  }
}
