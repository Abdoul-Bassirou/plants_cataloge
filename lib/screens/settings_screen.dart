import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'MoreInfoScreen.dart';

class SettingsScreen extends StatefulWidget {
  final Function onThemeChanged;

  const SettingsScreen({super.key, required this.onThemeChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false; // Assurez-vous de définir l'état initial de _darkMode

  void _toggleNotifications(bool value) {
    setState(() {
      if (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notifications activées')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notifications désactivées')),
        );
      }
    });
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Privacy Policy',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Your privacy policy content goes here.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0), // Espacement entre les paragraphes

                Text(
                  'This is where you explain how you collect, use, and protect user data. '
                      'Be sure to provide clear and concise information to build trust with your users.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),

          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void _showAbout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Plant Catalog',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Version: 1.0.0',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Plant Catalog is a mobile application designed to help users discover various types of plants, learn about their characteristics, and keep track of their favorite plants. It provides information about plant names, scientific names, families, origins, descriptions, and categories.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('More Info'),
              onPressed: () {
                // Ajoutez ici la logique pour rediriger vers une page Web ou une autre destination
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoreInfoScreen()),
                );
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
              widget.onThemeChanged();
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {
              _toggleNotifications(!_darkMode); // Utilisez une variable pour représenter l'état actuel des notifications
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              _showPrivacyPolicy(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              _showAbout();
            },
          ),
        ],
      ),
    );
  }
}
