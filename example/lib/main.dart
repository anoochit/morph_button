// ignore_for_file: deprecated_member_use

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
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              return DialButton(
                title: '${index + 1}',
              );
            },
          ),
        ),
      ),
    );
  }
}

class DialButton extends StatelessWidget {
  const DialButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MorphButton(
        width: constraints.maxWidth,
        height: constraints.maxWidth,
        pressedColor: Theme.of(context).colorScheme.primary,
        initialColor: Theme.of(context).colorScheme.inversePrimary,
        initialRadius: 12.0,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .apply(color: Colors.white),
        ),
        onTap: () {},
      );
    });
  }
}
