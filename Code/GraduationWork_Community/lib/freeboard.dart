import 'package:flutter/material.dart';

class FreeBoardPage extends StatelessWidget {
  final List<Map<String, String>> posts;

  FreeBoardPage({required this.posts});

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
                      title: Text(
                        post['title']!, // 제목
                        maxLines: 1, // 한 줄로 표시
                        overflow: TextOverflow.ellipsis, // 넘칠 경우 ...으로 표시
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['content']!, // 내용
                            maxLines: 1, // 한 줄로 표시
                            overflow: TextOverflow.ellipsis, // 넘칠 경우 ...으로 표시
                          ),
                          SizedBox(height: 8), // 내용과 좋아요/댓글 사이 간격
                          Row(
                            children: [
                              Icon(Icons.thumb_up, size: 18), // 좋아요 아이콘 크기 조정
                              SizedBox(width: 4), // 아이콘과 숫자 사이 간격
                              Text('0'), // 좋아요 개수
                              SizedBox(width: 16), // 좋아요와 댓글 사이 간격
                              Icon(Icons.comment, size: 18), // 댓글 아이콘 크기 조정
                              SizedBox(width: 4), // 아이콘과 숫자 사이 간격
                              Text('0'), // 댓글 개수
                            ],
                          ),
                        ],
                      ),
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
    );
  }
}
