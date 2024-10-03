import 'package:flutter/material.dart';

class SnapshotList extends StatelessWidget {
  final List<String> snapshots;

  const SnapshotList({Key? key, required this.snapshots}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: snapshots.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Snapshot ${index + 1}: ${snapshots[index]}"),
          );
        },
      ),
    );
  }
}
