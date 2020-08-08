import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistroForm extends StatefulWidget {
  RegistroForm({Key key}) : super(key: key);

  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime _fechaNacimientoSeleccionada;

  @override
  void initState() {
    _fechaNacimientoSeleccionada = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Text('Registro de usuarios',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
              _crearCampoEmail(),
              _crearCampoNombres(),
              _crearCampoApellidoPaterno(),
              _crearCampoTelefono(),
              _crearCampoFechaNacimiento(),
              Container(
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Registrarse', style: TextStyle(fontSize: 18)),
                  onPressed: () => _registrarse(),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _registrarse() {
    if (_formKey.currentState.validate()) {}
  }

  Widget _crearCampoEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'E-mail'),
      validator: (valor) {
        if (valor.isEmpty) {
          return 'Indique e-mail';
        }
        return null;
      },
    );
  }

  Widget _crearCampoNombres() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombres'),
      validator: (valor) {
        if (valor.isEmpty) {
          return 'Indique nombres';
        }
        return null;
      },
    );
  }

  // DateFormat('dd-MM-yyyy').format(fecha)
  Widget _crearCampoFechaNacimiento() {
    return Row(
      children: <Widget>[
        Text('Fecha de Nacimiento:  ',
            style: TextStyle(fontSize: 15.5, color: Colors.grey[600])),
        Expanded(
            child: Text(
                DateFormat('dd-MM-yyyy').format(_fechaNacimientoSeleccionada),
                style: TextStyle(fontSize: 15.5, color: Colors.grey[600]))),
        FlatButton(
          child: Icon(MdiIcons.calendar),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1920),
                    lastDate: DateTime.now(),
                    locale: Locale('es', 'ES'))
                .then((fecha) {
              setState(() {
                if (fecha != null) _fechaNacimientoSeleccionada = fecha;
              });
            });
          },
        ),
      ],
    );
  }

  Widget _crearCampoApellidoPaterno() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Apellido Paterno'),
      validator: (valor) {
        if (valor.isEmpty != null) {
          return 'Ingrese Apellido Paterno';
        }
        return null;
      },
    );
  }

  Widget _crearCampoTelefono() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Teléfono'),
        validator: (valor) {
          if (valor.isEmpty != null) {
            return 'Ingrese Teléfono';
          }
          return null;
        });
  }
}
