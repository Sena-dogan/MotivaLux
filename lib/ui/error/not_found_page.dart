import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({
    this.title,
    super.key,
  });
  final String? title;

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Not Found'),
            // back to home button
            ElevatedButton(
              onPressed: () {
                context.go('/home');
              },
              child: const Text('Back to Home'),
            )
          ],
        ),
      ),
    );
  }
}
