import 'package:flutter/material.dart';
import 'write_post.dart';
import 'freeboard.dart'; // 자유 게시판 페이지
import 'goalshareboard.dart'; // 목표 공유 게시판 페이지
import 'sdtipboard.dart'; // 자기계발 팁 게시판 페이지
import 'mentoringboard.dart'; // 멘토링 요청 게시판 페이지
import 'promotionboard.dart'; // 홍보 게시판 페이지

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommunityMainPage(),
    );
  }
}

class CommunityMainPage extends StatefulWidget {
  @override
  _CommunityMainPageState createState() => _CommunityMainPageState();
}

class _CommunityMainPageState extends State<CommunityMainPage> {
  bool isHotSelected = false;
  bool isMyPostsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시판'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isHotSelected = true;
                        isMyPostsSelected = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isHotSelected ? Colors.brown.shade100 : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.whatshot, size: 40, color: Colors.brown),
                          SizedBox(height: 30),
                          Text('HOT 게시판', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isHotSelected = false;
                        isMyPostsSelected = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isMyPostsSelected ? Colors.brown.shade100 : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.notes, size: 40, color: Colors.black),
                          SizedBox(height: 30),
                          Text('내가 쓴 글', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  buildListTile('자유 게시판', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FreeBoardPage()),
                    );
                  }),
                  buildListTile('목표 공유 게시판', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoalShareBoard()), // 목표 공유 게시판으로 이동
                    );
                  }),
                  buildListTile('자기계발 팁 게시판', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SdTipBoardPage()),  // 자기계발 팁 게시판으로 이동
                    );
                  }),
                  buildListTile('멘토링 요청 게시판', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MentoringBoardPage()),  // 멘토링 요청 게시판으로 이동
                    );
                  }),
                  buildListTile('홍보 게시판', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PromotionBoardPage()),  // 홍보 게시판으로 이동
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WritePostPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // ListTile을 만들어주는 함수
  ListTile buildListTile(String title, Function onTap) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: () => onTap(),
    );
  }
}
