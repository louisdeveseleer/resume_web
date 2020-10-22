import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_web_app/engineer_section/my_timeline_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class EngineerSection extends StatelessWidget {
  const EngineerSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xfffac62b),
            Color(0xfffd9812),
          ],
        ),
      ),
      child: Column(
        children: [
          SectionTitle(
            icon: FontAwesomeIcons.cogs,
            title: 'Engineer',
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: Styles.maxContentWidth,
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                MyTimelineTile(
                  isFirst: true,
                  date: '2018 - present',
                  title: 'R&D Manager',
                  subtitle: 'Feton international, Belgium/USA',
                  extras: [
                    ExtraLine(
                      imagePath: 'assets/Universal-Filler-Open.jpg',
                      text:
                          'Development of a dozen new products - market research, design, production, documentation.',
                    ),
                    ExtraLine(
                      imagePath: 'assets/feton_website.jpg',
                      text: 'Creation of a new website - www.fetonfillers.com',
                    ),
                    ExtraLine(
                        imagePath: 'assets/Feton-atelier.jpg',
                        text:
                            'Improvement of assembly and packaging processes.'),
                    ExtraLine(
                        imagePath: 'assets/Feton-Customers-Worldwide.jpg',
                        text:
                            'Development of new markets and management of customer service.'),
                    ExtraLine(
                        imagePath: 'assets/Feton-logo.jpg',
                        text: 'Products pricing and sales analysis.'),
                  ],
                ),
                MyTimelineTile(
                  date: '2015 - 2016',
                  title: 'Energy Sector Coordination',
                  subtitle:
                      'Ministry of Infrastructure, Energy Department, Rwanda',
                  extras: [
                    ExtraLine(
                      imagePath: 'assets/enabel.png',
                      text:
                          'Mission with Enabel to increase quality of coordination and policy dialogue in the energy sector.',
                    ),
                    ExtraLine(
                      imagePath: 'assets/rwanda_energy_balance.jpg',
                      text:
                          'Update of Rwandan Energy Balance and support to improve sustainable forest management.',
                    ),
                    ExtraLine(
                      imagePath: 'assets/Prince2-feature.png',
                      text: 'PRINCE2 Project Management certification',
                    ),
                  ],
                ),
                MyTimelineTile(
                  date: '2013 - 2015',
                  title: 'Research Engineer',
                  subtitle: 'Vesuvius, R&D Department, Belgium',
                  extras: [
                    ExtraLine(
                      imagePath: 'assets/vesuvius-sem.jpg',
                      text:
                          'Design and testing of machines for steel continuous casting.',
                    ),
                  ],
                ),
                MyTimelineTile(
                  date: '2011 - 2013',
                  title:
                      'Master of Science in Mechanical Engineering and Automation',
                  subtitle:
                      'FPMs, Umons, Belgium | TÜM, Germany | UFSC, Brazil',
                  extras: [
                    ExtraLine(
                      imagePath: 'assets/MasterDiplome.jpg',
                      text:
                          'High Distinction and Prize for Best Master Thesis in Automation.',
                    ),
                  ],
                ),
                MyTimelineTile(
                  isLast: true,
                  date: '2008 - 2011',
                  title: 'Bachelor of Science in Engineering',
                  subtitle: 'FPMs, Umons, Belgium',
                  extras: [
                    ExtraLine(
                      imagePath: 'assets/BachelorDiploma.jpg',
                      text: 'High distinction.',
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
