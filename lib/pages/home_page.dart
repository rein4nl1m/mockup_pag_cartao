import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  String _mesVencAux;
  String _anoVencAux;
  String _mesVenc = "MM";
  String _anoVenc = "AAAA";
  String _numberCard = "#### #### #### ####";
  String _titularCard = "Nome Completo";
  String _cvvCard = "";
  bool isCvvFocused = false;
  FocusNode _cvvFocus = FocusNode();

  @override
  void initState() {
    _dropDropDownMeses = getDropDownMeses();
    _dropDropDownAnos = getDropDownAnos();
    _cvvFocus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _cvvFocus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    isCvvFocused = _cvvFocus.hasFocus;
    debugPrint("Focus: " + _cvvFocus.hasFocus.toString());
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
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: [
                            MaskedTextInputFormatter(
                              mask: 'xxxx xxxx xxxx xxxx',
                              separator: ' ',
                            ),
                          ],
                          textInputAction: TextInputAction.next,
                          onChanged: (text) {
                            setState(() {
                              _numberCard = text;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Nome do Titular",
                            border: OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: (text) {
                            setState(() {
                              _titularCard = text;
                            });
                          },
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
                                        value: _mesVencAux,
                                        items: _dropDropDownMeses,
                                        onChanged: changeDropDownMes,
                                      ),
                                      DropdownButton(
                                        hint: Text("Ano"),
                                        value: _anoVencAux,
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
                                      border: OutlineInputBorder(),
                                    ),
                                    focusNode: _cvvFocus,
                                    inputFormatters: [
                                      MaskedTextInputFormatter(
                                        mask: 'xxx',
                                        separator: ' ',
                                      ),
                                    ],
                                    onChanged: (text) {
                                      setState(() {
                                        _cvvCard = text;
                                      });
                                    },
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
                top: MediaQuery.of(context).size.height * .03,
                left: MediaQuery.of(context).size.width * .15,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  child: isCvvFocused ? backCard() : frontCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget frontCard() {
    return Container(
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
              Text(
                "Visa",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$_numberCard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Nome do Titular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(),
              Text(
                "Vencimento",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "$_titularCard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(),
              Text(
                "$_mesVenc / $_anoVenc",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget backCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.grey,
      ),
      width: MediaQuery.of(context).size.width * .7,
      height: 150,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            color: Colors.black,
            height: 30,
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "CVV",
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 5),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    height: 30,
                    child: Text("$_cvvCard"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Visa",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeDropDownMes(String mes) {
    setState(() {
      _mesVenc = _mesVencAux = mes;
    });
  }

  void changeDropDownAno(String ano) {
    setState(() {
      _anoVenc = _anoVencAux = ano;
    });
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
