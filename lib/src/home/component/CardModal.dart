import 'package:flutter/material.dart';

class CardModal extends StatefulWidget {

  final Function onTap;

  const CardModal({Key key, this.onTap}) : super(key: key);

  @override
  _CardModalState createState() => _CardModalState();
}

class _CardModalState extends State<CardModal> {
  PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      width: double.infinity,
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 10,
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: Text(
                  "NOVIDADE PRA VOCÊ",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            height: 4,
          ),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 3,
          ),
          Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              child: Text(
                "Você já conhece o aplicativo minha Conta?",
                textAlign: TextAlign.center,
              )),
          Container(
            height: 10,
          ),
          Container(
            height: 90,
            child: PageView(
              controller: controller,
              children: <Widget>[
                PageItem(
                    icon: Icons.phonelink_ring,
                    text:
                        "Nele, você consulta o saldo e faz transferência para o seu cartão pré-pago."),
                PageItem(
                    icon: Icons.credit_card,
                    text:
                        "Além disso, acompanhe suas vendas e transfira o saldo para sua conta bancária."),
              ],
            ),
          ),
          Container(
              child: DotItem(
            controller: controller,
          )),
          Container(
            height: 10,
          ),
          Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text("Download na Play Store"),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}

class DotItem extends StatefulWidget {
  final PageController controller;

  const DotItem({Key key, this.controller}) : super(key: key);

  @override
  _DotItemState createState() => _DotItemState();
}

class _DotItemState extends State<DotItem> {
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        selected = widget.controller.page.round();
      });
    });
  }

  _item(int index) {
    return GestureDetector(
      onTap: () {
          if(index != selected){
            widget.controller.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          }
      },
          child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: index == selected ? Colors.green : Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _item(0),
          Container(
            width: 10,
          ),
          _item(1),
        ],
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const PageItem({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey,
          size: 40,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 4, bottom: 20, left: 30, right: 30),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
      ],
    );
  }
}
