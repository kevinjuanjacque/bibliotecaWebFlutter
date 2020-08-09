import 'package:app_flutter/page/documents.dart';
import 'package:app_flutter/page/search.dart';
import 'package:app_flutter/widgets/drawer_lateral.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());
final textPass = DrawerLateral();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeInheneretWidget(
      textPass: textPass,
      child: AnimatedBuilder(
        animation: textPass,
        builder: (context, _) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (BuildContext context) => HomePage(),
                'documents': (BuildContext context) => Documents(),
                'busqueda': (BuildContext context) => Search(),
              });
        },
      ),
    );
  }
}

class HomeInheneretWidget extends InheritedWidget {
  final Widget child;
  final DrawerLateral textPass;

  HomeInheneretWidget({@required this.child, this.textPass});

  static HomeInheneretWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
