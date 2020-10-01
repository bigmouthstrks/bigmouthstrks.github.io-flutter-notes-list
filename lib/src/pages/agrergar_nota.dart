import 'package:flutter/material.dart';
import 'package:noteslist/src/pages/services/firestore_service.dart';

class AgregarNota extends StatefulWidget {
  AgregarNota({Key key}) : super(key: key);

  @override
  _AgregarNotaState createState() => _AgregarNotaState();
}

class _AgregarNotaState extends State<AgregarNota> {
  TextEditingController tituloCtrl = new TextEditingController();
  TextEditingController descripcionCtrl = new TextEditingController();
  TextEditingController contenidoCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Nota'),
        centerTitle: true,
      ),
      body: Form(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: tituloCtrl,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Título:',
              ),
            ),
            TextField(
              controller: descripcionCtrl,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Descripción:',
              ),
            ),
            TextField(
              controller: contenidoCtrl,
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: InputDecoration(
                labelText: 'Contenido:',
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('Agregar'),
              onPressed: () => _agregarNota(),
            )
          ],
        ),
      )),
    );
  }

  _agregarNota() {
    FirestoreService()
        .agregarNota(tituloCtrl.text, descripcionCtrl.text, contenidoCtrl.text);
    Navigator.pop(context);
  }
}
