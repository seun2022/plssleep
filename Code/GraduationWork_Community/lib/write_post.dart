import 'package:flutter/material.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('글쓰기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
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
                      validator: (value) => value == null ? '게시판을 선택하세요' : null,
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
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: '제목',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: '내용을 입력하세요.',
                ),
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력하세요';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleComplete() {
    if (_formKey.currentState!.validate() && selectedBoard != null) {
      Navigator.pop(context, {
        'board': selectedBoard,
        'title': titleController.text,
        'content': contentController.text,
      });
    }
  }
}
