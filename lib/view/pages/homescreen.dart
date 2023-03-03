
class TestPage extends StatelessWidget  {
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
