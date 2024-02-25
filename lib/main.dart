import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/components/map_component.dart';
import 'package:test_drive/model/to_dos_provider.dart';
import 'package:test_drive/page/to_do_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ToDosProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rush Gardening To Do'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Material(
        child: TabBar(
          controller: controller,
          tabs: const <Tab>[
            Tab(icon: Icon(Icons.list)),
            Tab(icon: Icon(Icons.map)),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: const <Widget>[
            ToDoPage(),
            MapComponent(),
          ],
        ),
      ),
    );
  }
}
