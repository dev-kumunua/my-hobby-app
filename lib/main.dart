import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(
      title: '나의 취미 소개',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('나의 취미 소개'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                '내가 좋아하는 것들',
                  style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '아래 버튼을 눌러서 자세히 알아보세요!',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 40),
              _buildHobbyCard(
                context,
                title: '♪ 음악 듣기',
                color: Colors.purple,
                page: MusicPage(),
              ),
              SizedBox(height: 15),
              _buildHobbyCard(context, title: '⚽ 운동하기', color: Colors.blue, page: SportsPage()),
              SizedBox(height: 15),
              _buildComingSoonCard('게임하기', Colors.orange),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHobbyCard(BuildContext context, {
    required String title, required Color color, required Widget page}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoonCard(String title, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 2, style: BorderStyle.solid),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            '준비중',
            style: TextStyle(
              fontSize: 14,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class MusicPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('음악 듣기')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('♪', style: TextStyle(fontSize: 80)),
              SizedBox(height: 20),
              Text(
                '음악 듣기',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 30),
              _buildInfoBox(
                '좋아하는 장르',
                'J-POP, Rokudenashi, Anime',
                Colors.purple,
              ),
              SizedBox(height: 15),
              _buildInfoBox(
                '좋아하는 아티스트',
                'fripSide, Rokudenashi, NononoNono',
                Colors.purple,
              ),
              SizedBox(height: 15),
              _buildInfoBox(
                '언제 들어요?',
                '언제든지',
                Colors.purple
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '음악을 들으면 마음이 편해지고, 코딩하는데 지루함이 없어요.'
                  '특히 일본어 공부할 때는 도움에 아주 좋죠.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String content, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class SportsPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('운동하기')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('⚽', style: TextStyle(fontSize: 80)),
              SizedBox(height: 20),
              Text(
                '운동하기',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 30),
              _buildInfoBox(
                '좋아하는 운동',
                '하루종일 타자치기',
                Colors.blue,
              ),
              SizedBox(height: 15),
              _buildInfoBox(
                '운동 빈도',
                '하루의 절반 이상',
                Colors.blue,
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '운동을 하면 몸도 건강해지고, 마음도 상쾌해져요!',
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String content, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(content, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}