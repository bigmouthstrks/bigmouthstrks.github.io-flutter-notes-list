import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noteslist/src/pages/services/auth_service.dart';

class RegistroForm extends StatefulWidget {
  RegistroForm({Key key}) : super(key: key);

  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();
  TextEditingController pwdConfirmCtrl = TextEditingController();
  TextEditingController telefonoCtrl = TextEditingController();
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro de usuarios'),
          centerTitle: true,
        ),
        key: _scaffoldKey,
        body: Container(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    height: 160,
                    width: 160,
                  ),
                  Text(
                      '*Complete los campos a continuación para registrarse en la aplicación',
                      style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  _crearCampoEmail(),
                  _crearCampoPassword(),
                  _crearCampoPasswordConfirm(),
                  _crearCampoTelefono(),
                  _btnRegistrarse(),
                  _textError(),
                ],
              ),
            ),
          ),
        ));
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

  Widget _crearCampoPasswordConfirm() {
    return TextFormField(
        controller: pwdConfirmCtrl,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Confirmación de Contraseña',
          suffixIcon: Icon(MdiIcons.formTextboxPassword),
        ),
        validator: (valor) {
          if (valor.isEmpty) {
            return 'Ingrese una contraseña';
          }
          if (valor.length < 6) {
            return 'La contraseña debe ser mayor a 6 carácteres';
          }
          if (valor != pwdCtrl.text) {
            return 'Las contraseñas no coinciden';
          }
          return null;
        });
  }

  Widget _crearCampoTelefono() {
    return TextFormField(
        controller: telefonoCtrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Teléfono', suffixIcon: Icon(Icons.phone)),
        validator: (valor) {
          if (valor.isEmpty) {
            return 'Ingrese su número de teléfono';
          }
          if (valor.length < 8) {
            return 'El teléfono debe ser mayor o igual a 8 carácteres';
          }
          return null;
        });
  }

  Widget _btnRegistrarse() {
    return Container(
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text('Registrarse', style: TextStyle(fontSize: 18)),
        onPressed: () {
          AuthService authService = new AuthService();
          if (_formKey.currentState.validate()) {
            authService
                .crearUsuario(emailCtrl.text.trim(), pwdCtrl.text.trim())
                .then((valor) {
              Navigator.pop(context);
            }).catchError((exError) {
              setState(() {
                error = exError;
              });
            });
          }
        },
      ),
    );
  }

  Widget _textError() {
    return Container(
      child: Text(error, style: TextStyle(color: Colors.red)),
    );
  }
}
