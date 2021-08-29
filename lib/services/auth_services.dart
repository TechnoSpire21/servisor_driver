part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("drivers");
  // static DocumentReference userDoc;

  static Future<String> signUp(Drivers drivers) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String token;
    String driverId;
    String msg = "";

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: drivers.email, password: drivers.password);

    driverId = userCredential.user!.uid;
    token = (await FirebaseMessaging.instance.getToken())!;

    await userCollection.doc(driverId).set({
      'driverId': driverId,
      'name': drivers.name,
      'email': drivers.email,
      'password': drivers.password,
      'confirmpass': drivers.confirmpass,
      'telp': drivers.telp,
      'foto': drivers.foto,
      'token': token,
      'isOn': '1',
      'createdAt': dateNow,
      'updatedAt': dateNow,
    }).then((value) {
      msg = "success";
    }).catchError((onError) {
      msg = onError;
    });

    return msg;
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String driverId;
    String msg = "";
    String token;

    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    driverId = userCredential.user!.uid;
    token = (await FirebaseMessaging.instance.getToken())!;

    await userCollection.doc(driverId).update({
      'isOn': '1',
      'token': token,
      'updatedAt': dateNow,
    }).then((value) {
      msg = "success";
    }).catchError((onError) {
      msg = onError;
    });

    return msg;
  }

  static Future<bool> signOut() async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String driverId = auth.currentUser!.uid;

    await auth.signOut().whenComplete(() {
      userCollection.doc(driverId).update({
        'isOn': '0',
        'token': '-',
        'updatedAt': dateNow,
      });
    });

    return true;
  }

  static Future<bool> resetPassword(String email) async {
    await Firebase.initializeApp();

    await auth.sendPasswordResetEmail(email: email);

    return true;
  }
}
