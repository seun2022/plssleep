import 'package:flutter/material.dart';

class SdTipBoardPage extends StatelessWidget {
  final List<Map<String, String>> posts;

  SdTipBoardPage({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('자기계발 팁 게시판'),
      ),
      body: _buildBoard(posts),
    );
  }

  Widget _buildBoard(List<Map<String, String>> posts) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return _buildPostItem(post);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(Map<String, String> post) {
    return Card(
      child: ListTile(
        title: Text(
          post['title']!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post['content']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 18),
                SizedBox(width: 4),
                Text('0'),
                SizedBox(width: 16),
                Icon(Icons.comment, size: 18),
                SizedBox(width: 4),
                Text('0'),
              ],
            ),
          ],
        ),
        onTap: () {
          // Handle post tap
        },
      ),
    );
  }
}