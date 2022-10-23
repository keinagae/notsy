import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notsy/pages/setup_page.dart';
import 'package:notsy/widgets/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notsy App',
      localizationsDelegates: const [
        AppFlowyEditorLocalizations.delegate,
      ],
      theme: NotsyTheme.getLightTheme(),
      debugShowCheckedModeBanner: false,
      home: SetupPage(),
    );
  }
}
