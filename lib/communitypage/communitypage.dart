import 'package:flutter/material.dart';
import 'subpages/newpostpage.dart';

class MyCommunityFeedPage extends StatefulWidget {
  const MyCommunityFeedPage({super.key});

  @override
  State<MyCommunityFeedPage> createState() => _MyCommunityFeedPageState();
}

class _MyCommunityFeedPageState extends State<MyCommunityFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 9, // Number of vertical items
        itemBuilder: (context, index) {
          return Container();
          // return Container(
          //   height: 200,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 10, // Number of horizontal items
          //     itemBuilder: (context, index) {
          //       return Container(
          //         width: 100,
          //         color: Colors.blue,
          //         margin: EdgeInsets.all(5),
          //         child: Center(
          //           child: Text(
          //             'Item $index',
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyCreatePostPage())
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
