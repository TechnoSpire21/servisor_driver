part of 'pages.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);
  static const String routeName = "/riwayat";

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF45A1E4),
        elevation: 0,
        title: Text("Riwayat",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: size.height / 2.5,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFF45A1E4), Color(0xFF4BF6BE)],
                tileMode: TileMode.repeated)),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.toptal.com/designers/subtlepatterns/patterns/memphis-mini.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              "Pendapatan Hari ini",
                              style: GoogleFonts.inter(
                                color: Color(0xFF959595),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //     alignment: Alignment.center,
                      //     child: FutureBuilder(
                      //       future: _fetchasupan(),
                      //       builder:
                      //           (BuildContext context, AsyncSnapshot snapshot) {
                      //         return Text(
                      //           "$asupanSementara / $asupanMinimum ml",
                      //           style: TextStyle(
                      //               fontFamily: 'Sansation',
                      //               fontSize: 30,
                      //               color: Color(0xFF0057FF)),
                      //         );
                      //       },
                      //     )),
                      // Container(
                      //   margin: EdgeInsets.only(top: 100),
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     "Target Minuman Harian",
                      //     style: TextStyle(
                      //         fontFamily: 'Sansation',
                      //         fontSize: 20,
                      //         color: Color(0xFF0057FF)),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
