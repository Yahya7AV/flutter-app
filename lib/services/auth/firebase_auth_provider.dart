import 'package:firebase_auth/firebase_auth.dart%20';
import 'package:taosil/services/auth/auth_exceptions.dart';
import 'package:taosil/services/auth/auth_provider.dart';
import 'package:taosil/services/auth/auth_user.dart';
import 'package:taosil/services/auth/firebase_auth_provider.dart'
    show FirebaseAuth, FirebaseAuthException;

class FirebaseAuthProvider implements AuthProvider {
  @override
  Future<AuthUser> createUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> logIn({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() {
    throw UnimplementedError();
  }
}
