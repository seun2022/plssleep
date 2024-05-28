import 'package:flutter/material.dart';
import 'post_detail.dart'; // Import the PostDetailPage

class MentoringBoardPage extends StatelessWidget {
  final List<Map<String, dynamic>> posts;

  MentoringBoardPage({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('멘토링 요청 게시판'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post['title']),
            subtitle: Text(post['content']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(post: post),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
