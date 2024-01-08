import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'info_page.dart';

class CurrentTripScreen extends StatelessWidget {
  const CurrentTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileImages = [
      "images/pro1.jpg",
      "images/pro2.jpg",
      "images/pro3.jpg",
    ];
    List<String> profileNames = [
      'Dan',
      'Anne',
      'John',
    ];
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.maxScrollExtent) {
          // If scrolled to the bottom, navigate to the next page (BlankPage)
          Navigator.of(context).push(_createPageRoute());
        }
        return false;
      },
      child: Hero(
        tag: 'tripHeroTag',
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.grey.shade500,
              size: 39,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.cancel),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/mount3.jpg"),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'JAN 7-24',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade50,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'Mountain Climbing Holiday at Alaska',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: List.generate(
                              profileImages.length, (index) => Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade800
                            ),
                            height: 50,
                            width: 115,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(1),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(profileImages[index]),
                                  ),
                                  Text(
                                    profileNames[index],
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  InfoPage(
        onScrollToTop: () { Navigator.of(context).pop();},),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        const fadeCurve = Curves.easeOut; // Change the curve here

        var slideTween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: fadeCurve));

        var offsetAnimation = animation.drive(slideTween);
        var fadeAnimation = animation.drive(fadeTween);

        return FadeTransition(
          opacity: fadeAnimation,
          child: Transform.translate(
            offset: offsetAnimation.value,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 1000),
    );
  }

}

