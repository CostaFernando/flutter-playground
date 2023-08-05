import 'package:flutter/material.dart';
import 'package:flutter_playground/tinder_location_finder/tinder_location_finder_page.dart';

import 'currency_converter/views/currency_converter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/tinder_location_finder': (context) =>
            const TinderLocationFinderPage(),
        '/currency_converter': (context) => const CurrencyConverterPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/tinder_location_finder');
                },
                child: const Text('Tinder location finder')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/currency_converter');
                },
                child: const Text('Currency converter')),
          ],
        ),
      ),
    );
  }
}
