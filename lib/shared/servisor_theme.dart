part of 'shared.dart';

class ServisorTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xFF45A1E4),
      accentColor: Color(0xFF13EAA1),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
    );
  }
}
