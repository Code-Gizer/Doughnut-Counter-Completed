import 'package:counter/const.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class DoughnutScreen extends StatefulWidget {
  @override
  _DoughnutScreenState createState() => _DoughnutScreenState();
}

class _DoughnutScreenState extends State<DoughnutScreen> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doughnut Counter'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('images/doughnut.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Counter(
                onTap: () {
                  setState(() {
                    _value--;
                    if (_value < 0) {
                      _value = 0;
                    }
                  });
                },
                counterIcon: Icons.remove,
              ),
              Text(
                '$_value per day',
                style: kCounterStyle,
              ),
              Counter(
                onTap: () {
                  setState(() {
                    _value++;
                    if (_value > 10) {
                      Toast.show(
                        'You have eaten more doughnuts you will have to exercise to eat more!!',
                        context,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.CENTER,
                        backgroundRadius: 5,
                      );
                    }
                  });
                },
                counterIcon: Icons.add,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final IconData counterIcon;
  final Function onTap;
  Counter({this.counterIcon, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(counterIcon),
      onPressed: onTap,
    );
  }
}
