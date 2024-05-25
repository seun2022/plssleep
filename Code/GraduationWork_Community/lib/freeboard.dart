import 'package:flutter/material.dart';
import 'write_post.dart';

class FreeBoardPage extends StatefulWidget {
  @override
  _FreeBoardPageState createState() => _FreeBoardPageState();
}

class _FreeBoardPageState extends State<FreeBoardPage> {
  List<Map<String, String>> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자유 게시판'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post['title']!),
                      subtitle: Text(post['content']!),
                      onTap: () {
                        // Handle post tap
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WritePostPage()),
          );
          if (result != null && result['board'] == '자유 게시판') {
            setState(() {
              posts.add({
                'title': result['title'],
                'content': result['content'],
              });
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
