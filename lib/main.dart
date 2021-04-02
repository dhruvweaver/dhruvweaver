import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhruv Weaver',
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        fontFamily: 'Jost',
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 36),
          bodyText2: TextStyle(fontSize: 18),
          headline3: TextStyle(fontSize: 18, color: Colors.indigo.shade900),
        ),
      ),
      home: MyHomePage(title: 'Dhruv Weaver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final url = 'https://github.com/dhruvweaver';

                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Text(
                        'Github',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Text(
                    ' - where you can see my projects',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
