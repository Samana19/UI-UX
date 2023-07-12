// import 'package:cinemateapp/features/home/presentation/view/bottom_view/dashboard/dashboard_screen.dart';
// import 'package:cinemateapp/features/home/presentation/view/bottom_view/movie%20tickets/movie_tickets_screen.dart';
// import 'package:cinemateapp/features/home/presentation/view/bottom_view/user%20profile/user_profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class BottomNavigations extends ConsumerStatefulWidget {
//   const BottomNavigations({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _BottomNavigationsState();
// }

// class _BottomNavigationsState extends ConsumerState<BottomNavigations> {
//   int _selectedIndex = 0;

//   List<Widget> lstBottomScreen = [
//     const DashboardScreen(),
//     const MovieTicketsScreen(),
//     const UserProfileScreen(),
//   ];

//   bool nowShowing = false;
//   bool comingSoon = false;
//   bool popularMovies = false;

//   void updateCategory(String category) {
//     setState(() {
//       nowShowing = category == 'Now Showing';
//       popularMovies = category == 'Popular Movies';
//       comingSoon = category == 'Coming Soon';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: lstBottomScreen[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.movie),
//             label: "Movie Tickets",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(
//             () {
//               _selectedIndex = index;
//             },
//           );
//         },
//       ),
//     );
//   }
// }
