import 'package:flutter/material.dart';
import 'package:morph_button/morph_button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: MorphButton(
          width: 200.0,
          height: 200.0,
          pressedColor: Theme.of(context).colorScheme.primary,
          initialColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          initialRadius: 24.0,
          title: const Text(
            'Click Me',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
