import 'package:bookapps/provider/book_providers.dart';
import 'package:bookapps/provider/navigation_provider.dart';
import 'package:bookapps/routes/app_routes.dart';
import 'package:bookapps/screens/book_detail.dart';
import 'package:bookapps/screens/home_screen.dart';
import 'package:bookapps/screens/my_books.dart';
import 'package:bookapps/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>(
          create: (context) => BookProvider(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Buku ku',
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (context) => HomeScreen(),
          AppRoutes.bookDetail: (context) => BookDetailScreen(),
          AppRoutes.myBooks: (context) => MyBooksScreen(),
          AppRoutes.settings: (context) => SettingsScreen(),
        },
      ),
    );
  }
}
