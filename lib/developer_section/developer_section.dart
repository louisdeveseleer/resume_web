import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class DeveloperSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SectionTitle(
            icon: Icons.code,
            title: 'Developer',
          ),
          Text(
            'I\'ve had a passion for programming for a long time.\n'
            'At 16 I learned the basics of C language.\n'
            'At 17 I wrote several programs in my calculator (Casio-BASIC) that were the most advanced my teacher had seen so far.\n'
            'At university I used Matlab and also learned some Assembly.\n'
            'My thesis work made heavy use of ROS to control 4-wheeled robots.\n'
            'During another project I used C# to control a Kinect Camera.\n'
            'I used microcontrollers (Arduino) in projects to control pneumatic valves and wheeled robots.\n'
            'More recently, I got a passion for Flutter, which allows to write applications for iOs, Android, Web and desktop with the same code base.',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  height: 3,
                ),
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
