import 'package:flutter/material.dart';
import 'package:imc_calculator/models/imc.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _kFontFam = 'BalanceScaleIcon';
  static const IconData balance_scale = const IconData(0xf24e, fontFamily: _kFontFam);

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  String _imcValue = "";
  IMC _imc = IMC();
  GlobalKey<FormState> _formKey = GlobalKey();

  void _resetFields() {
    _heightController.text = "";
    _weightController.text = "";

    setState(() {
      _imcValue = "";
      _imc.imcValue = null;
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculateIMC() {
    _imc.weight = double.parse(_weightController.text);
    _imc.height = double.parse(_heightController.text);

    setState(() {
      _imcValue = "Seu IMC é ${_imc.imcValue.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding:EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(balance_scale, size: 120, color: Colors.green,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Peso (KG)"),
                style: TextStyle(fontSize: 22),
                controller: _weightController,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Insira seu peso";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura (CM)"),
                style: TextStyle(fontSize: 22),
                controller: _heightController,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Insira seu peso";
                  }
                },
              ),
              Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: RaisedButton(
                    child: Text("CALCULAR", style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        _calculateIMC();
                      }
                    },
                  )
              ),
              Text(_imcValue,
                style: TextStyle(color: Colors.green, fontSize: 25),
                textAlign: TextAlign.center,),
              Text(_imc.imcDegree,
                style: TextStyle(color: Colors.green, fontSize: 25),
                textAlign: TextAlign.center,),
            ],
          ),
        )
      )
    );
  }
}
