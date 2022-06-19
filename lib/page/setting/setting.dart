import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const route = 'setting_screen';

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Apps'),
      ),
      body: const Center(
        child: Text('Setting Screen'),
      ),
    );
  }
}
