import 'package:flutter/material.dart';
import 'freeboard.dart'; // 자유 게시판 페이지
import 'goalshareboard.dart'; // 목표 공유 게시판 페이지
import 'sdtipboard.dart'; // 자기계발 팁 게시판 페이지
import 'mentoringboard.dart'; // 멘토링 요청 게시판 페이지
import 'promotionboard.dart'; // 홍보 게시판 페이지

class WritePostPage extends StatefulWidget {
  @override
  _WritePostPageState createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {
  String? selectedBoard;
  final List<String> boards = [
    '자유 게시판',
    '목표 공유 게시판',
    '자기계발 팁 게시판',
    '멘토링 요청 게시판',
    '홍보 게시판'
  ];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('글쓰기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text('게시판 선택'),
                    value: selectedBoard,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedBoard = newValue;
                      });
                    },
                    items: boards.map((String board) {
                      return DropdownMenuItem<String>(
                        value: board,
                        child: Text(board),
                      );
                    }).toList(),
                  ),
                ),
                TextButton(
                  onPressed: handleComplete,
                  child: Text(
                    '완료',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: '제목',
              ),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                hintText: '내용을 입력하세요.',
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }

  void handleComplete() {
    // 글 작성 완료 시
    if (selectedBoard != null) {
      Navigator.pop(context, {
        'board': selectedBoard,
        'title': titleController.text,
        'content': contentController.text,
      });
    }
  }
}
