import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'const.dart';
import 'package:snapshot/snapshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SlimyCardEffect(),
      debugShowCheckedModeBanner: false,
    );
  }
}

List _selectedIndexs = [];

class SlimyCardEffect extends StatefulWidget {
  const SlimyCardEffect({Key key}) : super(key: key);

  @override
  State<SlimyCardEffect> createState() => _SlimyCardEffectState();
}

class _SlimyCardEffectState extends State<SlimyCardEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Slimy Card Effect",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: const Color.fromRGBO(255, 103, 189, 1),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                c1,
                c2,
              ])),
          child: Padding(
            padding: const EdgeInsets.only(top: 180),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                final isSelected = _selectedIndexs.contains(index);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedIndexs.remove(index);
                      } else {
                        _selectedIndexs.add(index);
                      }
                    });
                  },
                  child: Column(
                    children: [
                      SlimyCard(
                        color: const Color.fromRGBO(255, 103, 189, 1),
                        borderRadius: 15,
                        width: 250,
                        topCardHeight: 200,
                        bottomCardHeight: 130,
                        slimeEnabled: true,
                        topCardWidget: topWidget(),
                        bottomCardWidget: bottomWidget(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}

topWidget() {
  return SafeArea(
    child: Column(children: [
      SizedBox(
          height: 100,
          child: Image.asset(
            'assets/joker.png',
          )),
      const SizedBox(
        height: 5,
      ),
      const Text(
        'The Joker',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
            shadows: [Shadow(blurRadius: 8, offset: Offset(0, 3))]),
      ),
      const SizedBox(
        height: 5,
      )
    ]),
  );
}

bottomWidget() {
  return SafeArea(
      child: Container(
    child: const Text(
      'He is a Villain for Batman',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
          shadows: [Shadow(blurRadius: 8, offset: Offset(0, 3))]),
    ),
  ));
}
