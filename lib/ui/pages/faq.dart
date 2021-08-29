part of 'pages.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);
  static const String routeName = "/faq";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4BF6BE),
      appBar: AppBar(
        brightness: Brightness.light,
        // toolbarHeight: 137,
        elevation: 0,
        title: Text(
          "FAQs",
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 1],
                  colors: <Color>[Color(0xFF45A1E4), Color(0xFF4BF6BE)],
                  tileMode: TileMode.repeated)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: ListView(
              children: [
                Text(
                  'Apakah itu Servisor?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Aplikasi mobile untuk melakukan perbaikan/servis komputer dan laptop. Aplikasi ini menghubungkan mereka yang membutuhkan jasa servis dengan mereka yang memiliki keahlian teknis.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
