import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noteslist/src/pages/notes_page.dart';

class TabsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return TabsPageState();
  }
}

class TabsPageState extends State<TabsPage>{
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _navegar(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Cifras'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Contacto'),
          ),
        ],
        onTap: (index){
          setState(()=> _currentIndex = index);
        }
      ),
    );
  }

  Widget _navegar(int index){
    switch (index) {
      case 1:
        return Text('Cifras');
      case 2:
        return Text('Contacto');
      default:
        return NotesPage();
    }
  }
}
