import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wanderlust_favourites/screens/location.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 5, 14),
  background: const Color.fromARGB(255, 6, 6, 7),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: theme,
      home: const LocationsScreen(),
    );
  }
}
