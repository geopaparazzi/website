import 'dart:html' as html;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geopaparazzi_website/org/hydrologis/geopaparazzi/website/colors.dart';
import 'package:geopaparazzi_website/org/hydrologis/geopaparazzi/website/ui.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong/latlong.dart';

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
      home: MainPage(title: 'Geopaparazzi, because not all paparazzis are evil!'),
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
  List<String> assetImages = [
    "assets/00.png",
    "assets/01.jpg",
    "assets/02.jpg",
    "assets/03.jpg",
    "assets/04.jpg",
    "assets/05.png",
    "assets/06.png",
    "assets/07.png",
    "assets/08.png",
    "assets/09.png",
  ];

//  MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.black54;
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: Stack(
        children: <Widget>[
//          FlutterMap(
//            options: new MapOptions(
//              center: LatLng(42.0, 11.0),
//              zoom: 10,
//              minZoom: 0,
//              maxZoom: 18,
//            ),
//            mapController: _mapController,
//            layers: [
//              new TileLayerOptions(
////                urlTemplate: "https://tile.stamen.com/watercolor/10/541/378.jpg",
//                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                subdomains: const ['a', 'b', 'c'],
//                tms: false,
//                keepBuffer: 2,
//                maxZoom: 18,
//                tileProvider: NetworkTileProvider(),
//              ),
//            ],
//          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: SmashUI.defaultPadding(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CarouselSlider(
                    enlargeCenterPage: true,
                    aspectRatio: 2,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    height: 500.0,
                    items: assetImages.map((assetPath) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                            width: 800.0,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: SmashUI.defaultPadding(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
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
                                        leading: Icon(
                                          MdiIcons.bookInformationVariant,
                                          size: 36,
                                        ),
                                        title: SmashUI.titleText("Documentation", color: textColor),
                                        subtitle: SmashUI.normalText(
                                          "Check out the user manual!",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: new InkWell(
                                            child: SmashUI.titleText(
                                              'Current version',
                                              bold: true,
                                              color: textColor,
                                            ),
                                            onTap: () => launchUrl('./v600/index.html')),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                            child: SmashUI.normalText(
                                              'Previous version 5.6.5',
                                              color: textColor,
                                            ),
                                            onTap: () => launchUrl('./v565/index.html')),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
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
                                        leading: Icon(
                                          MdiIcons.fileCode,
                                          color: textColor,
                                          size: 48,
                                        ),
                                        title: SmashUI.titleText("Get the source code", color: textColor),
                                        subtitle: SmashUI.normalText("It's free and open source", color: textColor),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          child: SmashUI.normalText(
                                            'Source code repository',
                                            color: textColor,
                                          ),
                                          onTap: () => launchUrl('https://github.com/geopaparazzi/geopaparazzi'),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: SmashUI.defaultPadding(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
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
                                        leading: Icon(
                                          MdiIcons.apple,
                                          color: textColor,
                                          size: 48,
                                        ),
                                        title: SmashUI.titleText("S.M.A.S.H.", color: textColor),
                                        subtitle: SmashUI.normalText(
                                          "Need it on IOS? It is slowly coming...",
                                          color: textColor,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: new InkWell(
                                            child: Image.asset(
                                              "assets/smash_icon.png",
                                              fit: BoxFit.cover,
                                              width: 200.0,
                                            ),
                                            onTap: () => launchUrl(
                                                'https://www.slideshare.net/moovida/geopaparazzi-state-of-the-art-of-the-digital-field-mapping-application-167930916')),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
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
                                        leading: Icon(
                                          MdiIcons.shareVariant,
                                          color: textColor,
                                          size: 48,
                                        ),
                                        title: SmashUI.titleText("Share and care", color: textColor),
                                        subtitle: SmashUI.normalText("Find and share knowledge", color: textColor),
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
                                          onTap: () => launchUrl('https://groups.google.com/forum/#!forum/geopaparazzi-users'),
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
                                          onTap: () => launchUrl('https://www.facebook.com/groups/350587351732480/'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: ,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
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
