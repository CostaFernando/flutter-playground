import 'package:flutter/material.dart';

class TinderLocationFinderPage extends StatelessWidget {
  const TinderLocationFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tinder location finder'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 238, 115, 108),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset('assets/images/tinder_logo.png'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Location Changer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Plugin app for Tinder',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login with Facebook')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
