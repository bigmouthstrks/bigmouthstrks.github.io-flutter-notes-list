import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noteslist/src/pages/agrergar_nota.dart';
import 'package:noteslist/src/pages/services/firestore_service.dart';
import 'package:noteslist/src/pages/ver_nota.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  String email = '';
  String uid = '';

  @override
  void initState() {
    cargarDatosUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _fetch(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data.documents.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  var nota = snapshot.data.documents[index];
                  return ListTile(
                      leading: Icon(MdiIcons.note),
                      title: Text(nota['titulo'].toString()),
                      subtitle: Text(nota['descripcion'].toString()),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerNota()),
                          ));
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgregarNota()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Future<void> cargarDatosUsuario() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      uid = sp.getStringList('user')[0];
      email = sp.getStringList('user')[1];
    });
  }

  Stream<QuerySnapshot> _fetch() {
    return FirestoreService().notas(uid);
  }
}
