import 'package:flutter/material.dart';
import 'package:icon_checkbox/icon_checkbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IconCheckbox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'IconCheckbox Demo'),
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
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // the simplest
            IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            // change Icon color
            IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              checkColor: const Color(0xFFFCD900),
              unCheckColor: Colors.black,
              value: false,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            // change Icon size
            IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              iconSize: 40,
              value: false,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            // change Checkbox frame
            IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: false,
              boxdecoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 15,
            ),
            // Check box with icon appearing when tapped
            IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              value: false,
              checkColor: Colors.white,
              boxdecoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFBFBFBF)),
                  color: const Color(0xFFBFBFBF)),
              onChanged: (value) {},
              boxHeight: 50,
              boxWidth: 50,
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}
