import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _meses = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  final List _anos = [
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030"
  ];

  List<DropdownMenuItem<String>> _dropDropDownMeses;
  List<DropdownMenuItem<String>> _dropDropDownAnos;

  String _mesVenc;
  String _anoVenc;

  @override
  void initState() {
    _dropDropDownMeses = getDropDownMeses();
    _dropDropDownAnos = getDropDownAnos();
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMeses() {
    List<DropdownMenuItem<String>> items = List();
    for (String mes in _meses) {
      items.add(
        DropdownMenuItem(
          value: mes,
          child: Text(mes),
        ),
      );
    }

    return items;
  }

  List<DropdownMenuItem<String>> getDropDownAnos() {
    List<DropdownMenuItem<String>> items = List();
    for (String ano in _anos) {
      items.add(
        DropdownMenuItem(
          value: ano,
          child: Text(ano),
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue[50],
          child: Stack(
            children: <Widget>[
              Center(
                child: Material(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .6,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 65,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Número do Cartão",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Nome do Titular",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Vencimento",
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      DropdownButton(
                                        hint: Text("Mês"),
                                        value: _mesVenc,
                                        items: _dropDropDownMeses,
                                        onChanged: changeDropDownMes,
                                      ),
                                      DropdownButton(
                                        hint: Text("Ano"),
                                        value: _anoVenc,
                                        items: _dropDropDownAnos,
                                        onChanged: changeDropDownAno,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "CVV",
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  "Enviar",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => print("Teste"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 18,
                left: MediaQuery.of(context).size.width * .15,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * .7,
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 35,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.grey[200],
                              ),
                            ),
                            Image.asset(
                              "assets/images/logo.png",
                              height: 50,
                              width: 50,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeDropDownMes(String mes) {
    setState(() {
      _mesVenc = mes;
    });
  }

  void changeDropDownAno(String ano) {
    setState(() {
      _anoVenc = ano;
    });
  }
}
