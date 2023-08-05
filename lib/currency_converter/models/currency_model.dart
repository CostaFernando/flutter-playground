class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  const CurrencyModel({
    required this.name,
    required this.real,
    required this.dolar,
    required this.euro,
    required this.bitcoin,
  });

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      const CurrencyModel(
        name: 'real',
        real: 1.0,
        dolar: 0.18,
        euro: 0.15,
        bitcoin: 0.000016,
      ),
      const CurrencyModel(
        name: 'dolar',
        real: 5.65,
        dolar: 1.0,
        euro: 0.85,
        bitcoin: 0.000088,
      ),
      const CurrencyModel(
        name: 'euro',
        real: 6.62,
        dolar: 1.17,
        euro: 1.0,
        bitcoin: 0.00010,
      ),
      const CurrencyModel(
        name: 'bitcoin',
        real: 64114.30,
        dolar: 11351.30,
        euro: 9683.80,
        bitcoin: 1.0,
      ),
    ];
  }
}
