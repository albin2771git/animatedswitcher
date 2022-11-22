import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isflip = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedSwitcher(
                duration: Duration(
                  milliseconds: 3000,
                ),
                reverseDuration: Duration(milliseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: isflip
                    ? Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                        child: Center(child: Text("Container 1")),
                        key: Key('1'))
                    : Container(
                        width: 300,
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text("Container 2")),
                        key: Key('2'))),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isflip = !isflip;
                });
              },
              child: Text('next'))
        ],
      ),
    );
  }
}
