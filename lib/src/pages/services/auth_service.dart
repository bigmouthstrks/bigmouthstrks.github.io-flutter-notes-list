import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get usuario {
    return _firebaseAuth.authStateChanges();
  }

  // Crear usuarios
  Future crearUsuario(String email, String password) async {
    try {
      UserCredential authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = authResult.user;
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setStringList('user', [firebaseUser.uid, firebaseUser.email]);
      return firebaseUser;
    } catch (ex) {
      if (ex.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        Future.error('E-mail ya está en uso');
      }
      return Future.error(ex.code);
    }
  }

  // Login
  Future iniciarSesionUsuario(String email, String password) async {
    try {
      UserCredential authResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = authResult.user;
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setStringList('user', [firebaseUser.uid, firebaseUser.email]);
      return firebaseUser;
    } catch (ex) {
      if (ex.code == 'ERROR_WRONG_PASSWORD') {
        Future.error('Credenciales incorrectas');
      }
      return Future.error(ex.code);
    }
  }

  // Logout
  Future cerrarSesionUsuario() async {
    return await _firebaseAuth.signOut();
  }
}
