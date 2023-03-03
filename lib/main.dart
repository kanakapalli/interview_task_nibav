import 'package:apiintergrations/apicall.dart';
import 'package:apiintergrations/datamodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography.whiteCupertino,
        primarySwatch: Colors.blue,
      ),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatelessWidget with AutomaticKeepAliveClientMixin {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex:0,
      length: 3,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              DropdownButton<String>(
                value: null,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {},
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const Text('AppBar Demo'),
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
            // Center(
            //   child: Text("It's rainy here"),
            // ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void activate() {
    // TODO: implement activate
  }
  
  @override
  // TODO: implement context
  BuildContext get context => throw UnimplementedError();
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  }
  
  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
  }
  
  @override
  // TODO: implement mounted
  bool get mounted => throw UnimplementedError();
  
  @override
  void reassemble() {
    // TODO: implement reassemble
  }
  
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => throw UnimplementedError();
  
  @override
  // TODO: implement widget
  StatefulWidget get widget => throw UnimplementedError();
}

class Tab1 extends StatelessWidget {
  const Tab1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PageData>(
        future: DataRepo().getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print("snapshot.data");
            print(snapshot.data);
            // return const Center(child: Text("asdasdasdg"));

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.data.newslist.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Image.network(
                    snapshot.data!.data.newslist[i].playerImageUrl,
                    height: 120,
                    width: 80,
                    fit: BoxFit.fitHeight,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(snapshot.data!.data.newslist[i].pname),
                      const Text("monday"),
                    ],
                  ),
                  subtitle: Text(
                    '${snapshot.data!.data.newslist[i].title}\n${snapshot.data!.data.newslist[i].details}',
                    maxLines: 3,
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          } else {
            return const Center(child: Text("something went wrong"));
          }
        });
  }
}
