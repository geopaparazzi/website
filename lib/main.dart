import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geopaparazzi_website/org/hydrologis/geopaparazzi/website/colors.dart';
import 'package:geopaparazzi_website/org/hydrologis/geopaparazzi/website/ui.dart';

void main() => runApp(GeopaparazziWebsiteApp());

class GeopaparazziWebsiteApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geopaparazzi, because not all paparazzis are evil!',
      theme: ThemeData(
        primarySwatch: GeopaparazziColors.mainDecorationsMc,
        accentColor: GeopaparazziColors.mainSelectionMc,
        canvasColor: GeopaparazziColors.mainBackground,
        brightness: Brightness.light,
        fontFamily: 'Arial',
//        textTheme: TextTheme(
//          body1: TextStyle(),
//          body2: TextStyle(),
//        ).apply(
//          bodyColor: Colors.black54,
//          displayColor: Colors.black54,
//        ),
      ),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home:
          MainPage(title: 'Geopaparazzi, because not all paparazzis are evil!'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final textColor = Colors.black54;

    bool isLarge = MediaQuery.of(context).size.width > 600;

    if (isLarge) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: SmashUI.defaultPadding(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: SmashUI.defaultPadding(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(child: getGeopaparazzi(textColor)),
                      Expanded(child: getSmash(textColor)),
                    ],
                  ),
                ),
                Padding(
                  padding: SmashUI.defaultPadding(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(child: getGss(textColor)),
                      Expanded(child: getSocial(textColor)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: SmashUI.defaultPadding(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: SmashUI.defaultPadding(),
                  child: getGeopaparazzi(textColor),
                ),
                Padding(
                  padding: SmashUI.defaultPadding(),
                  child: getSmash(textColor),
                ),
                Padding(
                  padding: SmashUI.defaultPadding(),
                  child: getGss(textColor),
                ),
                Padding(
                  padding: SmashUI.defaultPadding(),
                  child: getSocial(textColor),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget getSocial(Color textColor) {
    return Padding(
      padding: SmashUI.defaultPadding(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SmashUI.DEFAULT_PADDING),
        ),
        elevation: 3,
        child: SizedBox(
          height: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.deepOrange,
                child: ListTile(
                  title: SmashUI.titleText("Share and care", color: textColor),
                  subtitle: SmashUI.normalText("Find and share knowledge",
                      color: textColor),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: SmashUI.normalText(
                      'Mailinglist',
                      color: textColor,
                    ),
                    onTap: () => launchUrl(
                        'https://groups.google.com/forum/#!forum/geopaparazzi-users'),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: SmashUI.normalText(
                      'Facebook group',
                      color: textColor,
                    ),
                    onTap: () => launchUrl(
                        'https://www.facebook.com/groups/350587351732480/'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGss(Color textColor) {
    return Padding(
      padding: SmashUI.defaultPadding(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SmashUI.DEFAULT_PADDING),
        ),
        elevation: 3,
        child: SizedBox(
          height: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.yellow,
                child: ListTile(
                  title: SmashUI.titleText("Geopaparazzi Survey Server",
                      color: textColor),
                  subtitle: SmashUI.normalText("Sync your survey in the cloud.",
                      color: textColor),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: SmashUI.normalText(
                      'User manual',
                      bold: true,
                      color: textColor,
                    ),
                    onTap: () => launchUrl('./gss/index.html'),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: SmashUI.normalText(
                      'Related projects',
                      color: textColor,
                    ),
                    onTap: () => launchUrl('https://github.com/geopaparazzi'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSmash(Color textColor) {
    return Padding(
      padding: SmashUI.defaultPadding(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SmashUI.DEFAULT_PADDING),
        ),
        elevation: 3,
        child: SizedBox(
          height: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: SmashColors.mainDecorations,
                child: ListTile(
                  title: SmashUI.titleText("SMASH", color: textColor),
                  subtitle: SmashUI.normalText(
                    "The digital field mapping app for IOS and Android.",
                    color: textColor,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: new InkWell(
                      child: SmashUI.titleText(
                        'User manual',
                        bold: true,
                        color: textColor,
                      ),
                      onTap: () => launchUrl('./smash/index.html')),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: SmashUI.normalText(
                      'Source code',
                      color: textColor,
                    ),
                    onTap: () => launchUrl('https://github.com/moovida/smash'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGeopaparazzi(Color textColor) {
    return Padding(
      padding: SmashUI.defaultPadding(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SmashUI.DEFAULT_PADDING),
        ),
        elevation: 3,
        child: SizedBox(
          height: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: GeopaparazziColors.mainDecorations,
                child: ListTile(
                  title: SmashUI.titleText("Geopaparazzi", color: textColor),
                  subtitle: SmashUI.normalText(
                    "Because not all paparazzis are evil!",
                    color: textColor,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: new InkWell(
                      child: SmashUI.titleText(
                        'User manual',
                        bold: true,
                        color: textColor,
                      ),
                      onTap: () => launchUrl('./geopaparazzi/index.html')),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: SmashUI.normalText(
                      'Source code',
                      color: textColor,
                    ),
                    onTap: () => launchUrl(
                        'https://github.com/geopaparazzi/geopaparazzi'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> launchUrl(String url) async {
    html.window.location.assign(url);
//    html.window.open(url, "url");

//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
  }
}
