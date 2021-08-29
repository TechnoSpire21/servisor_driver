part of 'pages.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);
  static const String routeName = "/editprofil";

  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlTelp = TextEditingController();
  final ctrlAlamat = TextEditingController();
  bool isLoading = false;
  String emailPengguna = "";
  String namaPengguna = "";
  String telp = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF4BF6BE),
      appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white30,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Ubah Profil",
            style: GoogleFonts.inter(
                color: Colors.white, fontWeight: FontWeight.bold),
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
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 24, 0, 18),
                alignment: Alignment.topCenter,
                child: ClipOval(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      splashColor: Colors.blueAccent[700],
                      onTap: () {
                        // showFileDialog(context);
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Color(0xFF45A1E4),
                            width: 2.0,
                          ),
                        ),
                        child: SizedBox(
                          child: Semantics(
                              child: Center(
                            child: Container(
                              // alignment: Alignment.center,
                              child: Image(
                                image: ExactAssetImage(
                                    'assets/images/servisor.jpg'),
                              ),
                            ),
                            // child: FutureBuilder(
                            //   future: _fetchimage(),
                            //   builder:
                            //       (BuildContext context, AsyncSnapshot snapshot) {
                            //     if (fotoPengguna == null) {
                            //       return Container(
                            //         alignment: Alignment.center,
                            //         child: Icon(Icons.person, size: 56),
                            //       );
                            //     } else {
                            //       return Image.network(
                            //         "$fotoPengguna",
                            //         width: 100,
                            //       );
                            //     }
                            //     // try {
                            //     //   return Image.network("$fotoPengguna");
                            //     // } catch (e) {
                            //     //   return Container(
                            //     //     alignment: Alignment.center,
                            //     //     child: Icon(Icons.person, size: 56),
                            //     //   );
                            //     // }
                            //   },
                            // ),
                          )),
                          width: size.width / 4.5,
                          height: size.height / 7.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "uhgrug@gmail.com",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Nama",
                            style: GoogleFonts.inter(fontSize: 18),
                          ),
                        ),
                        TextFormField(
                          controller: ctrlName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: "Nama Anda",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fil the field!";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Nomor telepon",
                            style: GoogleFonts.inter(fontSize: 18),
                          ),
                        ),
                        TextFormField(
                          controller: ctrlTelp,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "463463XXXX",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fil the field!";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Alamat",
                            style: GoogleFonts.inter(fontSize: 18),
                          ),
                        ),
                        TextFormField(
                          controller: ctrlAlamat,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            hintText:
                                "Jalan Tinumbu No. 69/420, Makassar, Indonesia",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fil the field!";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            //melanjutkan ke tahap berikutnya
                            // setState(() {
                            //   isLoading = true;
                            // });
                            // } else {
                            //kosongkan aja
                            // Fluttertoast.showToast(
                            //     msg: "Please check the fields!",
                            //     backgroundColor: Colors.red);
                            // }
                          },
                          icon: Icon(Icons.save),
                          label: Text("Simpan"),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF45A1E4), elevation: 4),
                        ),
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  _fetchProfil() async {
    final pengguna = await FirebaseAuth.instance.currentUser!.uid;
    if (pengguna != null) {
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(pengguna)
          .get()
          .then((ds) {
        namaPengguna = ds.data()!['name'];
        emailPengguna = ds.data()!['email'];
      });
    }
  }
}
