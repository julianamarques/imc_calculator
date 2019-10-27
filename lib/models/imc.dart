class IMC {
  double _height;
  double _weight;
  double _imcValue;
  String _imcDegree;

  IMC();

  String get imcDegree {
    if(_imcValue == null) {
      _imcDegree = "";
    }

    else {
      if(_imcValue < 17) {
        _imcDegree = "Você está muito abaixo do peso";
      }

      else if(_imcValue >= 17 && _imcValue < 18.49) {
        _imcDegree = "Você está abaixo do peso";
      }

      else if(_imcValue >= 18.5 && _imcValue <= 24.99) {
        _imcDegree = "Seu peso está normal";
      }

      else if(_imcValue >= 25 && _imcValue <= 29.99) {
        _imcDegree = "Você está acima do peso";
      }

      else if(_imcValue >= 30 && _imcValue <= 34.99) {
        _imcDegree = "Você está com grau de obesidade I";
      }

      else if(_imcValue >= 35 && _imcValue <= 39.99) {
        _imcDegree = "Você está com grau de obesidade II (obesidade severa)";
      }

      else if(_imcValue >= 40) {
        _imcDegree = "Você está com grau de obesidade III (obesidade mórbida)";
      }
    }

    return _imcDegree;
  }

  double get imcValue {
    this._imcValue = this._weight / (this._height * this._height);

    return this._imcValue;
  }

  set imcValue(double value) {
    _imcValue = value;
  }

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  double get height => _height;

  set height(double value) {
    _height = value / 100;
  }
}