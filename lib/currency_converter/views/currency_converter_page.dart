import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/currency_model.dart';

List<CurrencyModel> currencies = CurrencyModel.getCurrencies();

class CurrencyConverterPage extends StatelessWidget {
  const CurrencyConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency converter'),
      ),
      body: const CurrencyConverterForm(),
    );
  }
}

class CurrencyConverterForm extends StatefulWidget {
  const CurrencyConverterForm({super.key});

  @override
  State<CurrencyConverterForm> createState() => _CurrencyConverterFormState();
}

class _CurrencyConverterFormState extends State<CurrencyConverterForm> {
  String fromCurrency = currencies[0].name;
  String toCurrency = currencies[1].name;
  final fromCurrencyAmount = TextEditingController(text: '0.00');
  final toCurrencyAmount = TextEditingController(text: '0.00');

  void convert() {
    CurrencyModel currency =
        currencies.firstWhere((currency) => currency.name == fromCurrency);
    double amount = double.parse(fromCurrencyAmount.text);

    Map<String, double> currencyMap = {
      'real': currency.real,
      'dolar': currency.dolar,
      'euro': currency.euro,
      'bitcoin': currency.bitcoin,
    };

    toCurrencyAmount.text =
        (currencyMap[toCurrency]! * amount).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(height: 50),
            ClipOval(
              child: Image.asset(
                'assets/images/currency_converter_logo.png',
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: DropdownButton(
                      isExpanded: true,
                      value: fromCurrency,
                      items: currencies
                          .map((e) => DropdownMenuItem(
                                value: e.name,
                                child: Text(e.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          fromCurrency = value.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: fromCurrencyAmount,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: DropdownButton(
                      isExpanded: true,
                      value: toCurrency,
                      items: currencies
                          .map((e) => DropdownMenuItem(
                                value: e.name,
                                child: Text(e.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          toCurrency = value.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: toCurrencyAmount,
                      readOnly: true,
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
