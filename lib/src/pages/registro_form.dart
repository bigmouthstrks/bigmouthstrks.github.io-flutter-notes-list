import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistroForm extends StatefulWidget {
  RegistroForm({Key key}) : super(key: key);

  @override
  _RegistroFormState createState() => _RegistroFormState();
}

class _RegistroFormState extends State<RegistroForm> {
  DateTime _fechaNacimientoSeleccionada;

  @override
  void initState() {
    _fechaNacimientoSeleccionada = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        leading: Icon(MdiIcons.login),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              _crearCampoEmail(),
              _crearCampoNombres(),
              _crearCampoApellidoPaterno(),
              _crearCampoTelefono(),
              Divider(),
              _crearCampoFechaNacimiento(),
              Container(
                child: RaisedButton(
                  color: Color(blue),
                  child: Text('Registrarse'),
                  onPressed: () => _registrarse(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registrarse(){};

  Widget _crearCampoEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'E-mail'),
    );
  }

  Widget _crearCampoNombres() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombres'),
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
      decoration: InputDecoration(labelText: 'Apellido Materno'),
    );
  }

  Widget _crearCampoTelefono() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Teléfono'),
    );
  }
}
