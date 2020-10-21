import 'package:flutter/material.dart';
import 'package:resume_web_app/personal_section/personal_card.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class PersonalSection extends StatefulWidget {
  const PersonalSection({
    Key key,
  }) : super(key: key);

  @override
  _PersonalSectionState createState() => _PersonalSectionState();
}

class _PersonalSectionState extends State<PersonalSection> {
  Image soignies1;
  Image soignies2;
  Image raleigh1;
  Image raleigh2;
  Image imari1;
  Image imari2;
  Image bella1;
  Image bella2;

  @override
  void initState() {
    super.initState();
    soignies1 = Image.asset('assets/soignies-grandplace.jpg');
    soignies2 = Image.asset('assets/soignies-map.jpg');
    raleigh1 = Image.asset('assets/raleigh-downtown.jpg');
    raleigh2 = Image.asset('assets/raleigh-map.jpg');
    imari1 = Image.asset('assets/imari.jpg');
    imari2 = Image.asset('assets/imari_and_louis.jpg');
    bella1 = Image.asset('assets/bella.jpg');
    bella2 = Image.asset('assets/bella2.jpg');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(soignies1.image, context);
    precacheImage(soignies2.image, context);
    precacheImage(raleigh1.image, context);
    precacheImage(raleigh2.image, context);
    precacheImage(imari1.image, context);
    precacheImage(imari2.image, context);
    precacheImage(bella1.image, context);
    precacheImage(bella2.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: ResponsiveWidget.isSmallScreen(context)
            ? EdgeInsets.all(32.0)
            : EdgeInsets.all(64.0),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.center,
          spacing: 32,
          runSpacing: 64,
          children: [
            PersonalCard(
              text: 'Born in Soignies, Belgium',
              image1: soignies1.image,
              image2: soignies2.image,
              color1: Color(0xff046f57),
              color2: Color(0xff50b08a),
            ),
            PersonalCard(
              text: 'Living in Raleigh, NC',
              image1: raleigh1.image,
              image2: raleigh2.image,
              color1: Color(0xffe7873f),
              color2: Color(0xffeca921),
            ),
            PersonalCard(
              text: 'with wife Imari',
              image1: imari1.image,
              image2: imari2.image,
              color1: Color(0xff245270),
              color2: Color(0xff1775a9),
            ),
            PersonalCard(
              text: 'and cat Bella',
              image1: bella1.image,
              image2: bella2.image,
              color1: Color(0xffc32b2b),
              color2: Color(0xfff25252),
            ),
          ],
        ),
      ),
    );
  }
}
