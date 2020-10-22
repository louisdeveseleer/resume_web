import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
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
            icon: Icons.contact_mail,
            title: 'Contact',
          ),
          Wrap(
            children: [
              ContactBlock(
                title: 'Email',
                information: 'louis.deveseleer@gmail.com',
                iconData: Icons.email,
              ),
              ContactBlock(
                title: 'Phone',
                information: '+1 919 746 6263',
                iconData: Icons.phone,
              ),
            ],
          ),
          SizedBox(
            height: 96,
          ),
        ],
      ),
    );
  }
}

class ContactBlock extends StatelessWidget {
  final String title;
  final String information;
  final IconData iconData;
  ContactBlock({
    @required this.title,
    @required this.information,
    @required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(16),
      child: ExpansionTileCard(
        baseColor: Colors.grey[200],
        expandedColor: Color(0xfffff7e8),
        initialPadding: EdgeInsets.zero,
        finalPadding: EdgeInsets.zero,
        initialElevation: 2,
        elevation: 4,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        leading: Icon(iconData),
        title: Text(
          title,
        ),
        children: [
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Divider(
                  thickness: 1,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SelectableText(
                      information,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
