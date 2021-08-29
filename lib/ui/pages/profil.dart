part of 'pages.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);
  static const String routeName = "/profil";

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  bool isLoading = false;
  String username = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await FirebaseFirestore.instance
        .collection('drivers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((ds) {
      username = ds.data()!['name'];
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4BF6BE),
      appBar: AppBar(
          brightness: Brightness.dark,
          // toolbarHeight: 137,
          elevation: 0,
          title: Text(
            "Profil",
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
          ),
          ListView(
            children: [
              SizedBox(
                height: 24,
              ),
              Container(
                child: Card(
                  color: Colors.white30,
                  elevation: 0,
                  child: ListTile(
                    dense: true,
                    onTap: () {
                      Navigator.pushNamed(context, EditProfil.routeName);
                    },
                    leading: Container(
                      width: 50,
                      height: 200,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            ExactAssetImage('assets/images/servisor.jpg'),
                      ),
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: new Border.all(
                          color: Color(0xFF45A1E4),
                          width: 2.0,
                        ),
                      ),
                    ),
                    title: Text(
                      username,
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Edit Profile',
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Color(0xFF45A1E4)),
                    ),
                    // trailing: Icon(Icons.more_vert),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Penagaturan.routeName);
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    leading: Icon(Icons.settings,
                        size: 30, color: Color(0xFF2E3A59)),
                    title: Text(
                      'Pengaturan',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E3A59)),
                    ),
                    subtitle: Text(
                      'Pengaturan data diri, alamat, dan lainnya',
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Color(0xFF2E3A59)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FAQ.routeName);
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    leading: Icon(Icons.help_outline_outlined,
                        size: 30, color: Color(0xFF2E3A59)),
                    title: Text(
                      'FAQ',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E3A59)),
                    ),
                    subtitle: Text(
                      'Informasi mengenai aplikasi kami',
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Color(0xFF2E3A59)),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 3,
                margin: EdgeInsets.all(12),
                child: ListTile(
                    leading:
                        Icon(Icons.logout, size: 30, color: Color(0xFF2E3A59)),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E3A59)),
                    ),
                    subtitle: Text(
                      'Keluar dari akun',
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Color(0xFF2E3A59)),
                    ),
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthServices.signOut().then((value) {
                        if (value == true) {
                          setState(() {
                            isLoading = false;
                          });
                          ActivityServices.showToast(
                              "Logout Success", Colors.green);
                          Navigator.pushReplacementNamed(
                              context, Login.routeName);
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          ActivityServices.showToast(
                              "Logout Failed", Colors.red);
                        }
                      });
                    }),
              ),
            ],
          ),
          isLoading == true ? ActivityServices.loadings() : Container()
        ],
      ),
    );
  }
}
