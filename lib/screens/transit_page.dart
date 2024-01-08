import 'package:flutter/material.dart';
import 'current_trip_screen.dart';
import 'info_page.dart';

class TransitPage extends StatelessWidget {
  final VoidCallback onScrollToTop;

  const TransitPage({Key? key, required this.onScrollToTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          CurrentTripScreen(),
          InfoPage(onScrollToTop: onScrollToTop),
        ],
      ),
    );
  }
}
