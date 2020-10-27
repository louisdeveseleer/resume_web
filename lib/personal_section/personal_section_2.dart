import 'package:flutter/material.dart';
import 'package:resume_web_app/personal_section/personal_card.dart';
import 'package:resume_web_app/theme.dart';

class PersonalSection2 extends StatelessWidget {
  final PersonalCard personalCard1 = PersonalCard(
    text: 'Born in Soignies, Belgium',
    imagePath1: 'assets/soignies-grandplace.jpg',
    imagePath2: 'assets/soignies-map.jpg',
  );
  final PersonalCard personalCard2 = PersonalCard(
    text: 'Living in Raleigh, NC',
    imagePath1: 'assets/raleigh-downtown.jpg',
    imagePath2: 'assets/raleigh-map.jpg',
  );
  final PersonalCard personalCard3 = PersonalCard(
    text: 'with wife Imari',
    imagePath1: 'assets/imari.jpg',
    imagePath2: 'assets/imari_and_louis.jpg',
  );
  final PersonalCard personalCard4 = PersonalCard(
    text: 'and cat Bella',
    imagePath1: 'assets/bella.jpg',
    imagePath2: 'assets/bella2.jpg',
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double widthLimit1 = 1100;
    double widthLimit2 = 700;
    return Column(
      children: [
        if (width < widthLimit2)
          SizedBox(
            height: 32,
          ),
        Center(
          child: Container(
              width: Styles.maxContentWidth,
              height: width > widthLimit1
                  ? 700
                  : width > widthLimit2
                      ? 800
                      : 1600,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 64,
              ),
              child: width > widthLimit1
                  ? Stack(
                      children: [
                        Align(
                          alignment: Alignment(-1, -1),
                          child: personalCard1,
                        ),
                        Align(
                          alignment: Alignment(-0.4, 1),
                          child: personalCard2,
                        ),
                        Align(
                          alignment: Alignment(0.4, 1),
                          child: personalCard3,
                        ),
                        Align(
                          alignment: Alignment(1, -1),
                          child: personalCard4,
                        ),
                      ],
                    )
                  : width > widthLimit2
                      ? Stack(
                          children: [
                            Align(
                              alignment: Alignment(-1, -1),
                              child: personalCard1,
                            ),
                            Align(
                              alignment: Alignment(1, -1),
                              child: personalCard2,
                            ),
                            Align(
                              alignment: Alignment(-0.8, 1),
                              child: personalCard3,
                            ),
                            Align(
                              alignment: Alignment(0.8, 1),
                              child: personalCard4,
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            Align(
                              alignment: Alignment(-1, -1),
                              child: personalCard1,
                            ),
                            Align(
                              alignment: Alignment(1, -0.33),
                              child: personalCard2,
                            ),
                            Align(
                              alignment: Alignment(-1, 0.33),
                              child: personalCard3,
                            ),
                            Align(
                              alignment: Alignment(1, 1),
                              child: personalCard4,
                            ),
                          ],
                        )),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
