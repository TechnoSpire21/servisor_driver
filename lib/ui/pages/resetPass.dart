part of 'pages.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);
  static const String routeName = "/resetpass";

  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final ctrlEmail = TextEditingController();

  String usernameText = "";

  bool isLoading = false;
  Color underlineColor = Color(0xFF6F6F6F);

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.25, 1],
              colors: <Color>[Color(0xFF45A1E4), Color(0xFF4BF6BE)],
              tileMode: TileMode.repeated),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image24.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: pageSize.height / 1.9,
              margin: EdgeInsets.fromLTRB(
                  pageSize.width * 0.09,
                  pageSize.height * 0.15,
                  pageSize.width * 0.09,
                  pageSize.height * 0.1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF8CD5FF),
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  border: Border.all(color: Color(0xFF8CD5FF))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 5, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xFF2E3A59),
                          ),
                          Text(
                            "Kembali",
                            style: GoogleFonts.inter(
                                fontSize: 16, color: Color(0xFF2E3A59)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 5, 8),
                    child: Text(
                      "Lupa Password?",
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E3A59)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: Text(
                      "Masukan email Anda untuk reset Password",
                      style: GoogleFonts.inter(
                          fontSize: 16, color: Color(0xFF2E3A59)),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(pageSize.width * 0.05),
                            child: TextFormField(
                              controller: ctrlEmail,
                              decoration: InputDecoration(
                                  hintText: "Masukkan email Anda",
                                  hintStyle: GoogleFonts.inter(),
                                  labelText: "Email",
                                  labelStyle: GoogleFonts.inter(
                                    fontSize: 18,
                                  ),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: underlineColor)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: underlineColor)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: underlineColor))),
                              validator: (value) {
                                usernameText = value.toString();
                                if (usernameText.isEmpty) {
                                  return "Bagian ini tidak boleh kosong!";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        pageSize.width * 0.12, 0, pageSize.width * 0.12, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await AuthServices.resetPassword(ctrlEmail.text)
                            .then((value) {
                          if (value == true) {
                            setState(() {
                              isLoading = false;
                            });
                            ActivityServices.showToast(
                                "Permintaan Terkirim ke Email Anda",
                                Colors.green);
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ActivityServices.showToast(
                                "Gagal Mengirim Permintaan", Colors.red);
                          }
                        });
                      },
                      child: Container(
                        width: pageSize.width * 0.85,
                        alignment: Alignment.center,
                        child: Text("Kirim Permintaan",
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
