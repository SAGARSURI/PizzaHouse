import 'package:flutter/material.dart';
import 'blocs/provider.dart';

class PizzaHouse extends StatelessWidget {
  var pizzaName = "";
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza House"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[menu1(_bloc), menu2(_bloc), orderOffice(_bloc)],
        ),
      ),
    );
  }

  menu1(Bloc bloc) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text("Neapolitan"),
              onPressed: () {
                bloc.orderItem("Neapolitan");
                pizzaName = "Neapolitan";
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("California-style"),
              onPressed: () {
                bloc.orderItem("California-style");
                pizzaName = "California-style";
              },
            ),
          )
        ],
      ),
    );
  }

  menu2(Bloc bloc) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text("Sushi"),
              onPressed: () {
                bloc.orderItem("Sushi");
                pizzaName = "Sushi";
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("Marinara"),
              onPressed: () {
                bloc.orderItem("Marinara");
                pizzaName = "Marinara";
              },
            ),
          )
        ],
      ),
    );
  }

  orderOffice(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.orderOffice,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                snapshot.data,
                fit: BoxFit.fill,
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
              ),
              Text("Yay! Collect your $pizzaName pizza")
            ],
          );
        } else if (snapshot.hasError) {
          return Column(
            children: <Widget>[
              Image.network("http://megatron.co.il/en/wp-content/uploads/sites/2/2017/11/out-of-stock.jpg",
              fit: BoxFit.fill),
              Text(
                snapshot.error,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          );
        }
        return Text("No item in order office");
      },
    );
  }
}
