

import 'package:budget_tracker/Database/database.dart';
import 'package:budget_tracker/Screens/home.dart';
import 'package:budget_tracker/Theme.dart';
import 'package:drift/drift.dart' as drift;
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return DynamicColorBuilder( builder: (lightColorScheme, darkColorScheme){
      return Provider(
        create: (_) => AppDatabase(),
        child: MaterialApp(
          debugShowCheckedModeBanner:false, 
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {          
            TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          },
        ),
          
            colorScheme: lightColorScheme,
            useMaterial3: true,
            cardTheme: CardTheme(
              surfaceTintColor: colorSchemeLight.tertiary,
              shadowColor: Colors.transparent,
            )
            ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
            cardTheme: CardTheme(
              surfaceTintColor: colorSchemeLight.surfaceContainerLow,
              shadowColor: Colors.transparent,
            ),
            ),
          home: const HomeScreen(),
          
        
        ),
      );

    }
      
    );
  }
}

class MyHomePage extends  StatefulWidget{
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late AppDatabase _db;

  @override
  void initState() {
    _db= AppDatabase();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final newItem = BudgetTrackerItemsCompanion(
            money: drift.Value('100'),
            incomeOrExpense: drift.Value('Income'),
            createdAt: drift.Value(DateTime.now()),
            imageURL: drift.Value('https://example.com/image.png'),
            isBoolean:drift.Value(true),
            description:drift.Value('Sample Description'),
          );
          _db.insertData(newItem);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
