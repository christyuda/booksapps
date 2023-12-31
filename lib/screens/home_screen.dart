import 'package:bookapps/provider/navigation_provider.dart';
import 'package:bookapps/screens/home_page.dart';
import 'package:bookapps/screens/my_books.dart';
import 'package:bookapps/screens/settings.dart';
import 'package:bookapps/widgets/Drawer/drawer.dart';
import 'package:bookapps/widgets/navigationBottomBar/nav_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigation_provider = Provider.of<NavigationProvider>(context);
    final token = "";
    saveTokenToSharedPreferences(token);

    return Scaffold(
      body: IndexedStack(
        index: navigation_provider.currentIndex,
        children: [
          // MainTabView(),
          MainPage(),

          MyBooksScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      endDrawer: buildDrawer(),
    );
  }

  Future<void> saveTokenToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
