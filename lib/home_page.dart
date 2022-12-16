import 'package:flutter/material.dart';
import 'package:shared/shared_pref.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreference"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return const SharedPreference();
                },
              ));
            },
            child: const Text("SharedPreference Page")),
      ),
    );
  }
}
