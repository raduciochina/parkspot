import 'package:flutter/material.dart';
import 'package:parkspot/features/bookings/ui/bookings.dart';
import 'package:parkspot/features/more/ui/more.dart';
import 'package:parkspot/features/parking/ui/find_parking.dart';

class AppNavigation extends StatefulWidget {
  final int currentIndex;

  const AppNavigation({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final List<Widget> _children = [
    const FindParking(),
    const Bookings(),
    const More(),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  final List<BottomNavigationBarItem> _bottomBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.local_parking,
        size: 22,
      ),
      label: 'Find',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'Bookings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'More',
    ),
  ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0.2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        items: _bottomBarItems,
        onTap: onTap,
      ),
      body: _children[_currentIndex],
    );
  }
}
