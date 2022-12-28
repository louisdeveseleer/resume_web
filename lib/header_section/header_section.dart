import 'package:dough/dough.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/header_section/bouncing_profile_pic.dart';
import 'package:resume_web_app/widgets/click_region.dart';
import 'package:resume_web_app/widgets/launch_url.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 530,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff7a7d6b),
                Color(0xff595e52),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        'Louis Deveseleer',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: Colors.white60),
                      ),
                    ),
                    Text(
                      'Mobile app developer (Flutter)',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white60),
                    ),
                    ClickRegion(
                      onClick: () async {
                        String downloadUrl = await getCVDownloadUrl();
                        print(downloadUrl);
                        launchURL(downloadUrl);
                      },
                      child: Text(
                        'pdf version',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              isSmall
                  ? BouncingProfilePic()
                  : PressableDough(
                      child: BouncingProfilePic(),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<String> getCVDownloadUrl() async {
  var ref = FirebaseStorage.instance
      .ref()
      .child('CV Louis Deveseleer - Flutter developper June 2022.pdf');
  String url = (await ref.getDownloadURL()).toString();
  return url;
}
