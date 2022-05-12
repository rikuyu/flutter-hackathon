import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ui/event/event_page.dart';
import 'package:flutter_hackathon/ui/login/log_in_page.dart';
import 'package:flutter_hackathon/ui/profile/profile_page.dart';
import 'package:flutter_hackathon/ui/search/search_page.dart';
import 'package:flutter_hackathon/ui/utils/scrool_hide_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/utils/utils.dart';
import 'login/log_in_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(logInViewModelProvider.notifier).isLogIn();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, hintColor: Colors.orange),
      home: status is Success ? const MainPage() : const LogInPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  ScrollController controller = ScrollController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: IndexedStack(
            children: [
              EventPage(controller: controller),
              const SearchPage(),
              const ProfilePage(),
            ],
            index: _selectedIndex,
          ),
        ),
      ),
      bottomNavigationBar: ScrollHideWidget(
        controller: controller,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.event_note_outlined),
                activeIcon: Icon(Icons.event_note),
                label: 'Event'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                activeIcon: Icon(Icons.location_on),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: 'Profile')
          ],
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          unselectedIconTheme:
              const IconThemeData(size: 22, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
