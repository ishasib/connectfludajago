import 'package:flutter/material.dart';
import 'package:flutterapp/student.dart';

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
      title: 'Connect Flutter with Django',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Connect Flutter with Django'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student studentService = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: studentService.getAllStudent(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            snapshot.data?[i]['stuname'],
                            style: TextStyle(fontSize: 30.0),
                          ),
                          subtitle: Text(
                            snapshot.data?[i]['email'],
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            },
          ),
        ));
  }
}
