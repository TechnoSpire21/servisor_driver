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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height / 3,
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
                    height: MediaQuery.of(context).size.height / 4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Stack(
                        children: [
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
                          Container(
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pendapatan Hari Ini:',
                                  style: TextStyle(
                                    color: Color(0xFF959595),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Rp250.000,-',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Jumlah Pesanan Hari Ini:',
                                  style: TextStyle(
                                    color: Color(0xFF959595),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '5 Pesanan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(top: 35),
                      //     child: FutureBuilder(
                      //       future: _fetchasupan(),
                      //       builder:
                      //           (BuildContext context, AsyncSnapshot snapshot) {
                      //         try {
                      //           double progress =
                      //               (double.parse("$asupanSementara") /
                      //                   double.parse("$asupanMinimum"));
                      //           if (snapshot.connectionState ==
                      //               ConnectionState.waiting) {
                      //             return ActivityServices.loadings();
                      //           } else {
                      //             return CustomProgressBar(
                      //                 size.width / 1.9, progress * 100, 100);
                      //           }
                      //         } catch (e) {
                      //           return ActivityServices.loadings();
                      //         }
                      //       },
                      //     )),
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
                    ),
                  ),
                ),
              ],
            ),
          ),
            Column(
              children: [
                Text('tes'),
                Text('tes'),
                Text('tes'),
                Text('tes'),
              ],
            )
        ],
      ),
    );
  }
}
