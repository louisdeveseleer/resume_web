import 'dart:html';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          width: Styles.maxContentWidth,
          child: Column(
            children: [
              SectionTitle(
                icon: Icons.contact_page,
                title: 'Contact',
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Color(0xffccaa8f),
                      child: ContactBlock(
                        title: 'Email',
                        information: 'louis.deveseleer@gmail.com',
                        iconData: Icons.email,
                      ),
                    ),
                    Container(
                      color: Color(0xffccaa8f),
                      child: ContactBlock(
                        title: 'Phone',
                        information: '+1 919 746 6263',
                        iconData: Icons.phone,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  bool _copyToClipboardHack(String text) {
    final textarea = new TextAreaElement();
    document.body.append(textarea);
    textarea.style.border = '0';
    textarea.style.margin = '0';
    textarea.style.padding = '0';
    textarea.style.opacity = '0';
    textarea.style.position = 'absolute';
    textarea.readOnly = true;
    textarea.value = text;
    textarea.select();
    final result = document.execCommand('copy');
    textarea.remove();
    return result;
  }

  final snackBar = SnackBar(content: Text('Text copied to clipboard.'));

  @override
  Widget build(BuildContext context) {
    bool isSmall = ResponsiveWidget.isSmallScreen(context);
    return Center(
      child: Container(
        width: 420,
        padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: min(
                60, max(8, (MediaQuery.of(context).size.height - 600) / 4))),
        child: isSmall
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FittedBox(
                    child: SelectableText(
                      information,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      _copyToClipboardHack(information);
                    },
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    iconData,
                    size: isSmall ? 32 : 64,
                  ),
                  SizedBox(
                    width: 16,
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: SelectableText(
                          information,
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          _copyToClipboardHack(information);
                        },
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
