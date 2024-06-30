import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Fiverr")),
        ListTile(
          title: Text("Item 1"),
        ),
        ListTile(
          title: Text("Item 2"),
        )
      ],
    ));
  }
}
