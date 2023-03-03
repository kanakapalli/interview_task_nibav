import 'package:apiintergrations/view/widgets/tab1.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: 'NFL',
                // icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                
                onChanged: (String? newValue) {},
                items: <String>['NFL', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
              const Text('NEWS'),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.filter_alt_rounded),
              tooltip: 'Show Snackbar',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Go to the next page',
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Tab1(),
            Center(
              child: Text("tab 2"),
            ),
            Center(
              child: Text("tab 3"),
            ),
          ],
        ),
      ),
    );
  }
}
