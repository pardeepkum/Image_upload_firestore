
import 'package:flutter/material.dart';
import 'package:skincare_app/screen/home_screen.dart';
import 'package:skincare_app/stock_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children:  [
          HomeScreen(),
          const StockScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xff964F66),
        unselectedItemColor: Colors.grey,
        onTap: null,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.easeInOut,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.search),
                    Text(
                      'Routine',
                      style: TextStyle(
                        color: _currentIndex == 0 ? const Color(0xff964F66) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.easeInOut,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.3),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.people_alt_outlined),
                    Text(
                      'Streaks',
                      style: TextStyle(
                        color: _currentIndex == 1 ? const Color(0xff964F66) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),


    );
  }
}
