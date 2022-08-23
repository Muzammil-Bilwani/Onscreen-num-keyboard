import 'package:flutter/material.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onscreen Num Keyboard',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'On Screen Keyboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Center(
              child: Column(children: [
        const Spacer(),
        Text(text,
            style: Theme.of(context).textTheme.headline6?.apply(
                color: Colors.black, fontSizeFactor: 2.3, fontWeightDelta: 2)),
        const Spacer(),
        NumericKeyboard(
            onKeyboardTap: onKeyboardTap,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 28,
            ),
            rightButtonFn: () {
              setState(() {
                text = text.substring(0, text.length - 1);
              });
            },
            rightIcon: const Icon(
              Icons.backspace_outlined,
              color: Colors.blueGrey,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween),
      ]))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
