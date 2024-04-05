
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SignInWithGoogle{
  final _auth = FirebaseAuth.instance;
  final _googlesignin = GoogleSignIn();

   Signin() async{

    try{
      final GoogleSignInAccount? googleSignInAccount = await _googlesignin.signIn();
      if(googleSignInAccount != null){
         final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
         final AuthCredential authCredential = GoogleAuthProvider.credential(
           accessToken: googleSignInAuthentication.accessToken,
           idToken: googleSignInAuthentication.idToken,
         );
         await _auth.signInWithCredential(authCredential);
  }
    }on FirebaseAuthException catch(e){
      print(e.message);
      throw e;
    }
    }


     Signout() async{
    await _auth.signOut();
    await _googlesignin.signOut();
  }

  }

