import 'package:flutter/material.dart';
import 'package:the_daily_digest/features/category/presentation/view/health/health_news.dart';

class SideBarDrawer extends StatefulWidget {
  const SideBarDrawer({Key? key}) : super(key: key);

  @override
  State<SideBarDrawer> createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer> {
  void navigateToHealth() {
    // Handle logic for navigating to Health screen
  }
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
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(''),
              ),
              // add a divider
              const Divider(
                thickness: 2,
              ),

              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/homescreen');
                },
              ),

              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('General'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_hospital),
                title: const Text('Health'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/healthscreen');
                },
              ),
              ListTile(
                leading: const Icon(Icons.gavel),
                title: const Text('Politics'),
                onTap: () {
                  // updateCategory('Coming Soon');
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/politicsscreen');
                },
              ),

              ListTile(
                leading: const Icon(Icons.sports_soccer),
                title: const Text('Sports'),
                onTap: () {
                  // updateCategory('Coming Soon');
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/sportsscreen');
                },
              ),

              ListTile(
                leading: const Icon(Icons.computer),
                title: const Text('Technology'),
                onTap: () {
                  // updateCategory('Coming Soon');
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/technologyscreen');
                },
              ),
              // add a divider
              const Divider(
                thickness: 1,
              ),

              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/aboutus');
                },
              ),

              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/contactus');
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
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
