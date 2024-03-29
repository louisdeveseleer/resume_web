import 'package:flutter/material.dart';
import 'package:resume_web_app/personal_section/personal_card.dart';
import 'package:resume_web_app/theme.dart';

class PersonalSection extends StatelessWidget {
  final List<GlobalKey> _key = List.generate(4, (index) => GlobalKey());
  final PersonalCard personalCard1 = PersonalCard(
    text: 'Born in Soignies, Belgium',
    imagePath1: 'assets/soignies.jpg',
    imagePath2: 'assets/soignies-map.jpg',
  );
  final PersonalCard personalCard2 = PersonalCard(
    text: 'Living in Raleigh, NC',
    imagePath1: 'assets/raleigh-downtown.jpg',
    imagePath2: 'assets/raleigh-map.jpg',
  );
  final PersonalCard personalCard3 = PersonalCard(
    text: 'Flutter passionnate',
    imagePath1: 'assets/flutter1.jpg',
    imagePath2: 'assets/flutter2.png',
  );
  final PersonalCard personalCard4 = PersonalCard(
    text: 'Avid mover',
    imagePath1: 'assets/cali2.jpg',
    imagePath2: 'assets/cali1.jpg',
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
                          key: _key[0],
                          alignment: Alignment(-1, -1),
                          child: personalCard1,
                        ),
                        Align(
                          key: _key[1],
                          alignment: Alignment(-0.4, 1),
                          child: personalCard2,
                        ),
                        Align(
                          key: _key[2],
                          alignment: Alignment(0.4, 1),
                          child: personalCard3,
                        ),
                        Align(
                          key: _key[3],
                          alignment: Alignment(1, -1),
                          child: personalCard4,
                        ),
                      ],
                    )
                  : width > widthLimit2
                      ? Stack(
                          children: [
                            Align(
                              key: _key[0],
                              alignment: Alignment(-1, -1),
                              child: personalCard1,
                            ),
                            Align(
                              key: _key[1],
                              alignment: Alignment(1, -1),
                              child: personalCard2,
                            ),
                            Align(
                              key: _key[2],
                              alignment: Alignment(-0.8, 1),
                              child: personalCard3,
                            ),
                            Align(
                              key: _key[3],
                              alignment: Alignment(0.8, 1),
                              child: personalCard4,
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            Align(
                              key: _key[0],
                              alignment: Alignment(-1, -1),
                              child: personalCard1,
                            ),
                            Align(
                              key: _key[1],
                              alignment: Alignment(1, -0.33),
                              child: personalCard2,
                            ),
                            Align(
                              key: _key[2],
                              alignment: Alignment(-1, 0.33),
                              child: personalCard3,
                            ),
                            Align(
                              key: _key[3],
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
