import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platform Agnostic File Sharing"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(21, 82, 99, 100)
      ),
      body: Center(
        child: Text(
          "This Application is under Construction",
        
          style: TextStyle(
            fontSize: 64,
            fontFamily: 'JosefinSans',
            letterSpacing: 5.0,
            color: Color.fromRGBO(255, 201, 60, 100),
          ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromRGBO(255, 201, 60, 100),
        child: Text("Just a button does nothing honestly"),
        ),
    );
  }
  
  
}