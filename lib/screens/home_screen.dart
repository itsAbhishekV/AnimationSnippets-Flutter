import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _expansion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Animated Widget',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: _expansion
          ? Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _expansion = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  // Adjusted width to account for padding
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  height: 300,
                  child: const Center(
                    child: Text(
                      'Animated Container',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          : FloatingActionButton(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  _expansion = true;
                });
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
    );
  }
}
