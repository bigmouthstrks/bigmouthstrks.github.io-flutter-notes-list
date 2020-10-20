import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noteslist/src/pages/registro_form.dart';
import 'package:noteslist/src/pages/services/auth_service.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  String error = '';
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio de sesión'),
          centerTitle: true,
        ),
        key: _scaffoldKey,
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        height: 160,
                        width: 160,
                      ),
                      _crearCampoEmail(),
                      _crearCampoPassword(),
                      _textError(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              color: Theme.of(context).secondaryHeaderColor,
                              child: Text(
                                'Registrarme',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                final route = MaterialPageRoute(
                                    builder: (context) => RegistroForm());
                                Navigator.push(context, route);
                              },
                            ),
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'Entrar',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () => _iniciarSesion(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _iniciarSesion() {
    AuthService authService = new AuthService();
    print(emailCtrl.text);
    print(pwdCtrl.text);
    if (_formKey.currentState.validate()) {
      authService
          .iniciarSesionUsuario(
        emailCtrl.text.trim(),
        pwdCtrl.text.trim(),
      )
          .catchError((exError) {
        setState(() {
          error = exError;
        });
      });
    }
  }

  Widget _crearCampoEmail() {
    return TextFormField(
        controller: emailCtrl,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'E-mail', suffixIcon: Icon(MdiIcons.email)),
        validator: (valor) {
          if (valor.isEmpty) {
            return 'Ingrese su e-mail';
          }
          if (!RegExp(_emailRegex).hasMatch(valor)) {
            return 'E-mail no válido';
          }
          return null;
        });
  }

  Widget _crearCampoPassword() {
    return TextFormField(
        controller: pwdCtrl,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(MdiIcons.formTextboxPassword)),
        validator: (valor) {
          if (valor.isEmpty) {
            return 'Ingrese una contraseña';
          }
          if (valor.length < 6) {
            return 'La contraseña debe ser mayor a 6 carácteres';
          }
          return null;
        });
  }

  Widget _textError() {
    return Container(
      child: Text(error, style: TextStyle(color: Colors.red)),
    );
  }
}
