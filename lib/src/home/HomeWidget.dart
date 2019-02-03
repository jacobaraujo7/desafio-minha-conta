import 'package:desafioanimation/src/home/component/CardModal.dart';
import 'package:desafioanimation/src/home/component/Component.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with Component, SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animTranslation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final size = MediaQuery.of(context).size;
    animTranslation = Tween(begin: size.height * 0.3, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onTap() {
      if (animationController.value > 0.0) {
        animationController.reverse();
      } else {
        animationController.forward();
      }
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: Text(
          "Saldo",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              itemList(color: Colors.blue, value: 0.0, label: "Disponível"),
              Container(height: 24),
              itemList(color: Colors.amber, value: 0.0, label: "A recebar"),
              Container(
                height: 24,
              ),
              itemList(color: Colors.red, value: 0.0, label: "Bloquear"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Última atualização: 22/01/2017 às 22:57\n(Saldo Sujeito a alterações)",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget child) {
                  return Container(
                    height: animationController.value * (size.height * 0.2),
                  );
                },
              ),
            ],
          ),


          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return animationController.value == 0.0
                  ? Container()
                  : GestureDetector(
                      onTap: _onTap,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black26,
                      ),
                    );
            },
          ),



          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: animTranslation,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CardModal(
                    onTap: _onTap,
                  )),
              builder: (BuildContext context, Widget child) {
                return Transform.translate(
                  offset: Offset(0.0, animTranslation.value),
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
