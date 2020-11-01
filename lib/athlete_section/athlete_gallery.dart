import 'dart:math';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AthleteGallery extends StatefulWidget {
  @override
  _AthleteGalleryState createState() => _AthleteGalleryState();
}

class _AthleteGalleryState extends State<AthleteGallery> {
  CarouselController _controller;

  @override
  void initState() {
    _controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = min(800, screenSize.height - 140);
    return CarouselSlider(
      carouselController: _controller,
      items: [
        AthleteItem(
          title: 'Calisthenics',
          subtitle: 'Mastering the body',
          text: 'Regular practice since 2017.',
          imagePath: 'assets/calisthenics.jpg',
          callback: () => _controller.animateToPage(0),
        ),
        AthleteItem(
          title: 'Bike touring',
          subtitle: 'Seeing the in-betweens',
          text:
              'Travelling by bike allows me to see regions and meet people otherwise missed with traditional tourism.',
          imagePath: 'assets/EuroBikeTrip179.jpg',
          callback: () => _controller.animateToPage(1),
        ),
        AthleteItem(
          title: 'Hiking',
          subtitle: 'Connecting with nature',
          text:
              'I love hiking/camping trips to take a break from every day life.',
          imagePath: 'assets/hiking.jpg',
          callback: () => _controller.animateToPage(2),
        ),
      ],
      options: CarouselOptions(
        // enableInfiniteScroll: false,
        // scrollPhysics: NeverScrollableScrollPhysics(),
        viewportFraction: min(0.75, 2 * height / width),
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayInterval: Duration(seconds: 6),
        height: height,
        enlargeCenterPage: true,
        // aspectRatio: 16 / 9,
      ),
    );
  }
}

class AthleteItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;
  final String imagePath;
  final VoidCallback callback;
  AthleteItem({
    @required this.title,
    @required this.subtitle,
    @required this.text,
    @required this.imagePath,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Color(0x55595362), BlendMode.color),
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
        child: Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                padding: EdgeInsets.all(16),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white38,
                ),
                child: _buildText(context: context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText({
    @required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
