import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/features/exam/presentation/reusablewidgets/buildSubjecttile.dart';

class browsesubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            SizedBox(height: 24),

            // Browse by subject
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Browse by subject',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),

            // Subject List
            Expanded(
              child: ListView(
                children: [
                  buildSubjectTile(
                      'Language', 'images/LanguageTranslator.png', context),
                  buildSubjectTile('Math', 'images/DraftingTools.png', context),
                  buildSubjectTile('Art', 'images/ColorPalette.png', context),
                  buildSubjectTile('Science', 'images/Microscope.png', context),
                ],
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, RoutesName.examsscreen);
            //     },
            //     child: Text('Go'))
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Result',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function to create each subject tile
}
