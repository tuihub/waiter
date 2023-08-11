import 'package:flutter/material.dart';
import '../../ffi/native_ffi.dart';

class FfiTestPage extends StatefulWidget {
  const FfiTestPage({super.key});

  @override
  State<FfiTestPage> createState() => _FfiTestPageState();
}

class _FfiTestPageState extends State<FfiTestPage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
    _counter = await NativeFunc.add(_counter, 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rust_Bridge Demo')),
      body: Center(
        child: Text(
          'Count:  $_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
