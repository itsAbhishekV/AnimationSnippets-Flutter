import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _expanded = false;

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
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => setState(() {
          _expanded = false;
        }),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.deepOrange),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _expanded ? MediaQuery.of(context).size.width - 30 : 64,
          height: _expanded ? 270 : 64,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
          ),
          child: _expanded
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...["Item 1", "Item 2", "Item 3"].map((text) {
                          return ListTile(
                            leading: const Icon(
                              Icons.abc,
                              color: Colors.deepOrange,
                            ),
                            title: Text(
                              text,
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      _expanded = true;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
