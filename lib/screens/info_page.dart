import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  final VoidCallback onScrollToTop;
  const InfoPage({Key? key, required this.onScrollToTop}) : super(key: key);
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
    List<String> tripSummaryTitle = [
      'GEO SUMMARY',
      'MEDIA',
      'OTHERS...',
    ];
    List<String> tripSummaryHI = [
      '1,457 KM',
      'Picture/Videos',
      'OTHERS...',
    ];
    List<String> tripSummarySubtitle = [
      'Over 11 days',
      '114/56',
      'OTHERS...',
    ];
    final tripSummaryPic = [
      "images/city2.jpg",
      "images/mount1.jpg",
      "images/city4.jpg",
    ];
    List<String> teamBoardText = [
      'Folks, that was fun. Next time with a better car, not that piece of shit!'
          'Haha.',
      'What a trip! Thanks for all the memories! What is next?',
    ];
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.minScrollExtent) {
          // If scrolled to the top, notify the callback
          onScrollToTop();
        }
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: (){},
          backgroundColor: Colors.blue,
          child: const Icon(CupertinoIcons.pen, color: Colors.white,),
        ),
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
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("images/pro2.jpg"),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mountain Climbing Holiday at Alaska',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: Row(
                    children: List.generate(
                        profileImages.length, (index) => Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade100
                      ),
                      height: 50,
                      width: 115,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(2),
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
                                  color: Colors.black,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3,
                            (index) => Container(
                              margin: const EdgeInsets.all(2),
                              height: 300,
                              width: 300,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(tripSummaryPic[index]),
                                  opacity: 0.5,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black38, BlendMode.darken),
                                ),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tripSummaryTitle[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade50,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 110,),
                                    Text(
                                      tripSummaryHI[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Text(
                                      tripSummarySubtitle[index],
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade200,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]
                              ),
                            )),
                  ),
                ),
                const SizedBox(height:14,),
                Text("Team Board",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.grey.shade800
                  ),),
                const SizedBox(height:5,),
                Column(
                  children: List.generate(2, (index) => Column(
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            ),
                            image:  DecorationImage(
                                colorFilter: const ColorFilter.mode(
                                    Colors.black38, BlendMode.darken),
                                fit: BoxFit.cover,
                                image: AssetImage(profileImages[index]))
                        ),
                  ),
                        Container(
                          margin: const EdgeInsets.all(2),
                          height: 100,
                          width: 300,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                           border: Border.all(color: Colors.grey.shade500)
                          ),
                          child: Center(
                            child:  Text(teamBoardText[index],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.grey.shade800
                              ),),
                          ),
                        )
                      ],
                    ),
                      const SizedBox(height:14,),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
