import 'package:flutter/material.dart';

class SideBarDrawer extends StatefulWidget {
  const SideBarDrawer(BuildContext context, {super.key});

  @override
  State<SideBarDrawer> createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: SizedBox(
          height: double.infinity,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cinemate-logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(''),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  // updateCategory('Home');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Now Showing'),
                onTap: () {
                  // updateCategory('Now Showing');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Popular Movies'),
                onTap: () {
                  // updateCategory('Popular Movies');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Coming Soon'),
                onTap: () {
                  // updateCategory('Coming Soon');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
