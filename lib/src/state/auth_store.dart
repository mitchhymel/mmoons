import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

const _SCOPES = [ 'email' ];

abstract class _AuthStore with Store {
  GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: _SCOPES
  );

  @observable
  FirebaseUser firebaseUser;

  @computed
  bool get isLoggedIn => firebaseUser != null;

  @computed
  String get userName => firebaseUser.displayName;

  _AuthStore() {
    tryLoginSilently();
  }

  @action
  Future<void> tryLoginSilently() async {
    final GoogleSignInAccount gsa = await _googleSignIn.signInSilently();
    if (gsa == null) {
      debugPrint('Failed to sign into Google silently.');
    }
    else {
      firebaseUser = await _getFirebaseUserFromGoogleSignInAccount(gsa);
    }
  }

  @action
  Future<void> login() async {
    final GoogleSignInAccount gsa = await _googleSignIn.signIn();
    firebaseUser = await _getFirebaseUserFromGoogleSignInAccount(gsa);
  }

  @action
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    firebaseUser = null;
  }

  Future<FirebaseUser> _getFirebaseUserFromGoogleSignInAccount(
      GoogleSignInAccount gsa) async {
    final GoogleSignInAuthentication gAuth = await gsa.authentication;
    final AuthCredential cred = GoogleAuthProvider.getCredential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken
    );
    final FirebaseAuth auth = FirebaseAuth.instance;
    final AuthResult authResult = await auth.signInWithCredential(cred);
    return authResult.user;
  }

}