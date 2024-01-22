import 'package:flutter/material.dart';
import 'package:modernlogintute/model/studentActivity.dart';
import 'package:modernlogintute/model/userProfile.dart';
import 'package:modernlogintute/pages/add_activity.dart';

class DashboardPage extends StatelessWidget {
  final UserProfile profile;

  const DashboardPage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StudentActivity>? activities = profile.activities;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${profile.student?.fullName}!'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Show an 'About' dialog
              showAboutDialog(
                context: context,
                applicationName: 'Your App Name',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(Icons.info),
                applicationLegalese: '© ${DateTime.now().year} Your Company',
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                      Text('Username: ${profile.student?.fullName}'),
                      // Add more user-related information
                      const SizedBox(height: 10),
                      Text('Email: ${profile.student?.email}'),
                      Text('Phone: ${profile.student?.phone}'),
                      // Add more details as needed
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
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the AddActivityPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddActivityPage(),
                        ),
                      );
                    },
                    child: const Text('Add new activity'),
                  ),
                  // Add more buttons as needed
                ],
              ),
              const SizedBox(height: 20),

              // Example 3: Recent Activity
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (activities != null && activities.isNotEmpty)
                        Column(
                          children: activities.map((activity) {
                            return ListTile(
                              title: Text(activity.title ?? ''),
                              subtitle: Text(activity.timestamp ?? ''),
                            );
                          }).toList(),
                        ),
                      if (activities == null || activities.isEmpty)
                        const Text('No recent activity.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
