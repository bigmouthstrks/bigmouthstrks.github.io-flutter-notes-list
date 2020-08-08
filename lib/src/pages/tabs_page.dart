import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabsPageState();
  }
}

class TabsPageState extends State<TabsPage> {
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
              icon: Icon(MdiIcons.note),
              title: Text('Notas'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favoritos'),
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

  Widget _navegar(int index) {
    switch (index) {
      case 1:
        return Text('Favoritas');
      case 2:
        return Text('Archivadas');
      default:
        return Text('Mis notas');
    }
  }
}
