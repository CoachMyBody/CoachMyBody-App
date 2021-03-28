import 'package:flutter/material.dart';

class BtnNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: new Text('Title'),
            backgroundColor: Colors.black12,
          ),
    
          new BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: new Text('Title'),
            backgroundColor: Colors.black12,
            

          ),
    
          new BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: new Text('Title'),
            backgroundColor: Colors.black12,

          ),
    
          new BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: new Text('Title'),
            backgroundColor: Colors.black12,

          )
        ]
    
      );
  }
}