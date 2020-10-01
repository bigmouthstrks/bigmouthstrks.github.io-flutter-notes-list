import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noteslist/src/pages/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notes_pages.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _currentIndex = 0;
  String email = '';
  String uid = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _setTitle(_currentIndex),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'Acerca de',
                child: Text('Acerca de'),
              ),
              PopupMenuItem(
                value: 'Salir',
                child: Text('Salir'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: _navegar(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.note),
              title: Text('Notas'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.account),
              title: Text('Perfil'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              title: Text('Archivo'),
            ),
          ],
          onTap: (index) {
            setState(() => _currentIndex = index);
          }),
    );
  }

  Future<void> cargarDatosUsuario() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      uid = sp.getStringList('user')[0];
      email = sp.getStringList('email')[1];
    });
  }

  Widget _navegar(int index) {
    switch (index) {
      case 1:
        return Text('Perfil');
      case 2:
        return Text('Archivadas');
      default:
        return NotesPage();
    }
  }

  Widget _setTitle(int index) {
    switch (index) {
      case 1:
        return Text('Perfil');
      case 2:
        return Text('Archivadas');
      default:
        return Text('Notas');
    }
  }

  void handleClick(String value) {
    switch (value) {
      case 'Acerca de':
        _showDialog();
        break;
      case 'Salir':
        _cerrarSesion();
        break;
    }
  }

  void _cerrarSesion() {
    AuthService authService = AuthService();
    authService.cerrarSesionUsuario();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Acerca de 'Notes List'",
              style: TextStyle(color: Theme.of(context).accentColor)),
          content: Text(
              "Ésta aplicación fue creada por: Benjamín Cáceres Ramírez, estudiante de TUI de la USM Viña del Mar."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
