import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String username; // Assuming you pass the username from the login/signup page

  const DashboardPage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'You have successfully signed in!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Example 1: Profile Information
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Username: $username'),
                    // Add more user-related information
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Example 2: Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement an action
                  },
                  child: const Text('Action 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement another action
                  },
                  child: const Text('Action 2'),
                ),
                // Add more buttons as needed
              ],
            ),
            const SizedBox(height: 20),

            // Example 3: Recent Activity
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Add a list of recent activities
                    ListTile(
                      title: Text('Activity 1'),
                      subtitle: Text('Details about Activity 1'),
                    ),
                    ListTile(
                      title: Text('Activity 2'),
                      subtitle: Text('Details about Activity 2'),
                    ),
                    // Add more list items as needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
