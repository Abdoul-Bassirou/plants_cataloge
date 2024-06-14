import 'package:flutter/material.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Info'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to the More Info Page',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Nullam faucibus ex non velit vestibulum, ut facilisis dolor laoreet. '
                  'Curabitur vehicula ligula id lectus varius, sed rutrum sem tempor. '
                  'Integer laoreet euismod nisi, nec viverra nulla. Donec ac risus aliquam, '
                  'eleifend tellus id, varius nibh. Vestibulum sodales enim a mi congue, '
                  'vel pellentesque enim vestibulum. Sed vel enim bibendum, tincidunt enim sed, '
                  'varius nisi. Nam a velit sed nisl suscipit egestas et in ipsum. '
                  'Nullam at tempus ipsum. Nulla sed ligula eget justo lacinia tincidunt. '
                  'Nullam eleifend massa ut magna maximus, ac iaculis enim vehicula. '
                  'Nulla vitae molestie odio, eget aliquet elit.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Ajoutez ici la logique pour rediriger vers une page Web ou une autre destination
                Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MoreInfoScreen()),
                // );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
