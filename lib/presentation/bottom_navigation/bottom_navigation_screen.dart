import 'package:flutter/material.dart';
import 'package:movie_app/presentation/movie/movie_list_screen.dart';

import '../favorite/favorite_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  Icon _movieIcon(int index) {
    if (index == _currentIndex) {
      return const Icon(Icons.movie, color: Colors.red); // 선택되었을 때 아이콘
    } else {
      return const Icon(Icons.movie, color: Colors.grey); // 선택되지 않았을 때 아이콘
    }
  }

  Icon _favoriteIcon(int index) {
    if (index == _currentIndex) {
      return const Icon(Icons.favorite, color: Colors.red); // 선택되었을 때 아이콘
    } else {
      return const Icon(Icons.favorite, color: Colors.grey); // 선택되지 않았을 때 아이콘
    }
  }

  // 각 화면에 해당하는 위젯 리스트
  final List<Widget> _children = [
    const MovieListScreen(),
    const FavoriteScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _children[_currentIndex], // 현재 선택된 화면을 표시
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // 탭 선택시 호출
          currentIndex: _currentIndex, // 현재 선택된 탭 인덱스
          items:  [
            BottomNavigationBarItem(
              icon: _movieIcon(0),
              label: '영화',
            ),
            BottomNavigationBarItem(
              icon: _favoriteIcon(1),
              label: '즐겨찾기',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.alarm),
            //   label: '알림',
            // )
          ],
        ),
      ),
    );
  }
}
