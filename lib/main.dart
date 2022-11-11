import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'scanner.dart';
import 'word_list.dart';
import 'db_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange
      ),
      home: const MyHomePage(title: 'Lerningo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late SQLiteDbProvider _sqliteService;

  late int userScore = 0;

  @override
  void initState() {
    super.initState();
    _sqliteService = SQLiteDbProvider.db;
    _sqliteService.initDB();
    updateUserScore();
  }

  updateUserScore() {
    _sqliteService.getUserScore().then((value) =>
      {
      setState(() {
      userScore = value!;
      })
    }
  ,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 20, right: 20.0),
              child: Text('Your Word Score: $userScore')
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  SQLiteDbProvider.db.getAllWords().then((words) => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WordList(words)),
                  )
                  });
                },
                child: const Icon(
                  Icons.list,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/home.png'),
            const Padding(padding: EdgeInsets.only(top: 15),
                child: Text('Lerningo', style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.black87),)),
            const Padding(padding: EdgeInsets.only(top: 15, bottom: 45),
                child: Text('Find It. Scan It', style: TextStyle(fontSize: 20, color: Colors.black54),)),
            ElevatedButton( onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner(updateUserScore)),
              );
            }, style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              child: const Text('START NOW'), )
          ],
        ),
      ),
    );
  }
}

/*
ElevatedButton(
            child: Text('Scan'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner()),
              );
            })

 */