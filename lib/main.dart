import 'dart:io'; // Needed for file handling
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; // For getting app directory paths
import 'package:talker_flutter/talker_flutter.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talker Logger Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Talker talker = Talker(
    settings: TalkerSettings(
      useConsoleLogs: true, // Also print logs to console
    ),
  );

  @override
  void initState() {
    super.initState();
    talker.log('App started'); // Log message when the app starts
  }

  // Method to log custom messages
  void _logCustomMessage() {
    talker.log('This is a custom log message!');
    talker.info('i am talker.info');
    talker.error('I am talker.error');
  }

  // Method to write logs to a file
  Future<void> _writeLogsToFile() async {
    try {
      Directory? directory;

      // Check platform and get the appropriate directory
      if (Platform.isAndroid || Platform.isIOS) {
        // For Android and iOS, we use the external storage directory
        directory = await getExternalStorageDirectory();
      } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        // For desktop platforms, use the Downloads directory
        directory = await getDownloadsDirectory();
      }

      if (directory == null) {
        talker.error('Could not get a valid directory for saving logs.');
        return;
      }

      // Create the log file in the determined directory
      final file = File('${directory.path}/logs.txt');

      // Ensure the directory exists
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Collect all logs from Talker's history
      final logMessages = talker.history.map((log) => log.message).join('\n');

      // Write logs to the file
      await file.writeAsString(logMessages).then((_) {
        talker.log('Successfully wrote logs to ${file.path}');
      }).catchError((error) {
        talker.error('Error writing logs to file', error);
      });
    } catch (e) {
      talker.error('Failed to write logs to file', e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talker Logger Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _logCustomMessage,
            child: const Text('Log Custom Message'),
          ),
          ElevatedButton(
            onPressed: _writeLogsToFile,
            child: const Text('Save Logs to File'),
          ),
          // Expanded(
          //   child: TalkerScreen(
          //     talker: talker, // Pass the Talker instance
          //   ),
          // ),
        ],
      ),
    );
  }
}
