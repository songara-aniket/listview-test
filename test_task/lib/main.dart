import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ListWidget(),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  ListWidget({super.key});
  final List<Widget> list = <Widget>[];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i <= 100; i++) {
      list.add(const ListItemWidget());
    }
    return ListView.builder(
        itemCount: list.length, itemBuilder: (context, index) => list[index]);
  }
}

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({super.key});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> with AutomaticKeepAliveClientMixin {
  var count = 0;
  bool shouldPersist = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text(count.toString()),
            MaterialButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text("+"),
            )
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
