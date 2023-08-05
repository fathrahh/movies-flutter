import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  static String route = "Download";
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Download Screen'),
    );
  }
}
