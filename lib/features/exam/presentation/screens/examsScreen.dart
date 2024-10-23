import 'package:flutter/material.dart';

class Examsscreen extends StatefulWidget {
  @override
  State<Examsscreen> createState() => _ExamsscreenState();
}

class _ExamsscreenState extends State<Examsscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('High Level List'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: 3, // Number of items in the list
          itemBuilder: (context, index) {
            return HighLevelCard();
          },
        ),
      ),
    );
  }
}

class HighLevelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon/Image on the left
            Image(
              image: AssetImage('images/Profit.png'),
              width: 48,
              height: 48,
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'High level',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4), // Spacing between the text lines
                  Text(
                    '20 Questions',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text('From: 1.00'),
                      SizedBox(width: 16),
                      Text('To: 6.00'),
                    ],
                  ),
                ],
              ),
            ),
            // Duration text on the right
            Column(
              children: [
                Text(
                  '30 Minutes',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
