import 'package:flutter/material.dart';

class Component {
  Widget itemList({Color color, String label, double value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 100,
        color: Colors.grey[200],
        child: Row(
          children: <Widget>[
            Container(
              width: 5,
              height: double.infinity,
              color: color,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(label, style: TextStyle(fontSize: 11),),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Text("R\$", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100, color: Colors.grey[600]),),
                          Spacer(),
                          Text(value.toStringAsPrecision(3).replaceFirst(".", ","), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100, color: Colors.grey[600])),
                        ],
                      ),
                    ),
                    Container(height: 10,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
