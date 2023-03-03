
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
