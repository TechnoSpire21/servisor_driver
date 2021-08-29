part of 'pages.dart';

class Pesan extends StatefulWidget {
  const Pesan({Key? key}) : super(key: key);
  static const String routeName = "/pesan";

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4BF6BE),
      appBar: AppBar(
          brightness: Brightness.dark,
          // toolbarHeight: 137,
          elevation: 0,
          title: Text(
            "Pesan",
            style: GoogleFonts.inter(fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.4,
                      1,
                    ],
                    // colors: [
                    //   Color(0xFF45A1E4),
                    //   Color(0xFF4BF6BE),
                    // ],
                    colors: <Color>[Color(0xFF45A1E4), Color(0xFF4BF6BE)],
                    tileMode: TileMode.repeated)),
          )),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          )
        ],
      ),
    );
  }
}
