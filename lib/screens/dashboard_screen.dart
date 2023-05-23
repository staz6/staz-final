import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('friends').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data from Firestore'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final friends = snapshot.data?.docs;

          if (friends == null || friends.isEmpty) {
            return Center(
              child: Text('No friends data available'),
            );
          }

          return GridView.count(
            crossAxisCount: 2, // Two cards per row
            padding: EdgeInsets.all(8),
            children: List.generate(friends.length, (index) {
              final friend = friends[index].data() as Map<String, dynamic>;

              return Card(
                child: Material(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 32,
                        ),
                        SizedBox(height: 8),
                        Text(
                          friend['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(friend['email']),
                        SizedBox(height: 4),
                        Text(friend['mobileNo']),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

}
