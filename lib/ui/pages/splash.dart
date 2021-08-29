part of 'pages.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static const String routeName = "/splash";

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSplash();
  }

  _loadSplash() {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, checkAuth);
  }

  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      CollectionReference userCollection =
          FirebaseFirestore.instance.collection("users");
      Navigator.pushReplacementNamed(context, MainMenu.routeName);
      ActivityServices.showToast(
          "Welcome Back " + auth.currentUser!.email.toString(),
          Colors.blueAccent[700]);
    } else {
      Navigator.pushReplacementNamed(context, Login.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
              stops: [0.5, 1],
              colors: <Color>[Color(0xFFD4EDFF), Color(0xFFD5FBEE)],
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
            Column(
              children: <Widget>[
                SizedBox(
                  height: size.height / 6,
                ),
                Flexible(
                  flex: 2,
                  child: Image(
                    image: AssetImage("assets/images/servisor-nobg.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text("SERVISOR",
                      style: TextStyle(
                          fontSize: 36,
                          color: Color(0xFF45A1E4),
                          fontFamily: 'LeagueSpartan')),
                  alignment: Alignment.center,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: RichText(
                      text: TextSpan(
                          text: "Driver App",
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF45A1E4))),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
