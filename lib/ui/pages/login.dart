part of 'pages.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  String usernameText = "";
  String passwordText = "";

  bool notShowPassword = true;
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
              margin: EdgeInsets.fromLTRB(
                  pageSize.width * 0.09,
                  pageSize.height * 0.09,
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
                    child: Text(
                      "Selamat Datang Serdivers!",
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E3A59)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: Text(
                      "Masuk untuk melanjutkan",
                      style: GoogleFonts.inter(
                          fontSize: 16, color: Color(0xFF2E3A59)),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: 24,
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
                          Container(
                            margin: EdgeInsets.fromLTRB(pageSize.width * 0.05,
                                0, pageSize.width * 0.05, 0),
                            child: TextFormField(
                              controller: ctrlPassword,
                              obscureText: notShowPassword,
                              decoration: InputDecoration(
                                  hintText: "Masukkan Password Anda",
                                  hintStyle: GoogleFonts.inter(),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      fontSize: 18),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: underlineColor)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: underlineColor)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: underlineColor)),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        notShowPassword = !notShowPassword;
                                      });
                                    },
                                    child: Icon(notShowPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              validator: (value) {
                                passwordText = value.toString();
                                if (passwordText.isEmpty) {
                                  return "Bagian ini tidak boleh kosong!";
                                } else {
                                  return value!.length < 8
                                      ? "Sandi minimum 8 karakter!"
                                      : null;
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
                  // Container(
                  //   child: Text("Lupa Password? Klik disini",
                  //       style: TextStyle(
                  //         fontFamily: GoogleFonts.inter().fontFamily,
                  //         fontSize: 12,
                  //         color: Colors.black,
                  //       )),
                  // ),
                  Container(
                      margin: EdgeInsets.fromLTRB(pageSize.width * 0.05, 0,
                          pageSize.width * 0.05, pageSize.width * 0.05),
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ResetPass.routeName);
                        },
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: GoogleFonts.inter().fontFamily),
                              children: <TextSpan>[
                                TextSpan(text: "Lupa Password? "),
                                TextSpan(
                                    text: "Klik disini.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.lightBlue,
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily))
                              ]),
                        ),
                      )),
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
                        String msg = "";
                        if (_formKey.currentState!.validate()) {
                          try {
                            msg = await AuthServices.signIn(
                                ctrlEmail.text, ctrlPassword.text);
                            print(msg);
                            if (msg == "success") {
                              setState(() {
                                isLoading = false;
                              });
                              ActivityServices.showToast(
                                  "Berhasil Masuk", Colors.blueAccent[700]);
                              // Navigator.pushReplacement(
                              //     context,
                              //     PageTransition(
                              //         type: PageTransitionType.fade,
                              //         child: Login()));
                              Navigator.pushReplacementNamed(
                                  context, MainMenu.routeName);
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          } catch (msg) {
                            setState(() {
                              isLoading = false;
                            });
                            ActivityServices.showToast(
                                "Email atau Password salah", Colors.red);
                          }
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          Fluttertoast.showToast(
                              msg: "Tolong isi email dan password dulu!");
                        }
                      },
                      child: Container(
                        width: pageSize.width * 0.85,
                        alignment: Alignment.center,
                        child: Text("Masuk",
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
