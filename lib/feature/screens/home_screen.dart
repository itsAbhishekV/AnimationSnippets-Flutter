import 'package:animatedfloating_button_snippet/feature/widget/item_widget.dart';
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
      body: InkWell(
        onTap: () => setState(() {
          _expanded = false;
        }),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeInOut,
          width: _expanded ? MediaQuery.of(context).size.width : 64,
          height: _expanded ? 265 : 64,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(32),
          ),
          child: _expanded
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...["Books", "Explore", "Stay"].map((text) {
                          return OpenContainer(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              openColor: Colors.black,
                              closedColor: Colors.black,
                              closedShape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              closedBuilder: (_, open) {
                                return ListTile(
                                  onTap: () {
                                    open();
                                    print('clicked $text');
                                  },
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
                              },
                              openBuilder: (_, close) {
                                return ItemWidget(
                                  item: text,
                                  onTap: close,
                                );
                              });
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
