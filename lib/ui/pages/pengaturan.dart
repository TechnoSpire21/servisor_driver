part of 'pages.dart';

class Penagaturan extends StatefulWidget {
  const Penagaturan({Key? key}) : super(key: key);
  static const String routeName = "/pengaturan";

  @override
  _PenagaturanState createState() => _PenagaturanState();
}

class _PenagaturanState extends State<Penagaturan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4BF6BE),
      appBar: AppBar(
          brightness: Brightness.dark,
          // toolbarHeight: 137,
          elevation: 0,
          title: Text(
            "Pengaturan",
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
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          ),
          Column(
            children: [
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, DaftarAlamat.routeName);
                },
                child: ListTile(
                  title: Text('Daftar Alamat'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, DaftarPerangkat.routeName);
                },
                child: ListTile(
                  title: Text('Daftar Perangkat'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Keamanan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, PasswordChange.routeName);
                },
                child: ListTile(
                  title: Text('Ubah Kata Sandi'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
