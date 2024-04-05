
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Firebaseservice{

  final _auth = FirebaseAuth.instance;
  final _googlesignin = GoogleSignIn();


  signinwithgoogle() async{

    try{
      final GoogleSignInAccount? googleSignInAccount = await _googlesignin.signIn();
      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }

    }on FirebaseAuthException catch(e){
      print(e.message);
      throw e;
    }
  }

  signout()async{
    await _auth.signOut();
    await _googlesignin.signOut();
  }

}
