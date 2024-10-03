import 'package:talker/talker.dart';
import 'package:ansicolor/ansicolor.dart';

class CustomErrorLog extends TalkerLog {
  final String errorMessage;
  final String errorType;
  final String additionalInfo;

  // Constructor to accept customizable fields
  CustomErrorLog({
    required this.errorMessage,
    this.errorType = 'ERROR',
    this.additionalInfo = '',
  }) : super(errorMessage);

  /// Custom log title based on the error type
  @override
  String get title => errorType;
  @override
  AnsiPen get pen => AnsiPen()..red();
  @override
  String toString() {
    return '$errorType: $errorMessage ${additionalInfo.isNotEmpty ? "| Info: $additionalInfo" : ""}';
  }
}

// import 'package:talker/talker.dart';
// import 'package:ansicolor/ansicolor.dart';

// class CustomErrorLog extends TalkerLog {
//   final String errorMessage;
//   final String errorType;
//   final String additionalInfo;
//   CustomErrorLog({
//     required this.errorMessage,
//     this.errorType = 'ERROR',
//     this.additionalInfo = '',
//   }) : super(errorMessage);
//   @override
//   String get title => errorType;
//   @override
//   AnsiPen get pen => AnsiPen()..yellow();
//   @override
//   String toString() {
//     return '$errorType: $errorMessage ${additionalInfo.isNotEmpty ? "| Info: $additionalInfo" : ""}';
//   }
// }

// --- custom -----//
// import 'package:talker/talker.dart';
// import 'package:ansicolor/ansicolor.dart';

// class CustomErrorLog extends TalkerLog {
//   final String errorMessage;
//   final String errorType;
//   final String additionalInfo;

//   // Constructor to accept customizable fields
//   CustomErrorLog({
//     required this.errorMessage,
//     this.errorType = 'ERROR',
//     this.additionalInfo = '',
//   }) : super(errorMessage);

//   /// Custom log title based on the error type
//   @override
//   String get title => errorType;

//   /// Custom log color for different error types
//   @override
//   AnsiPen get pen {
//     final pen = AnsiPen();
//     pen.xterm(21);
    
//     // Assign colors based on error type
//     switch (errorType.toUpperCase()) {
//       case 'ERROR':
//         return pen.red() as AnsiPen; // Red for ERROR
//       case 'WARNING':
//         return pen.yellow() as AnsiPen; // Yellow for WARNING
//       case 'SUCCESS':
//         return pen.green() as AnsiPen; // Green for SUCCESS
//       case 'INFO':
//         return pen.blue() as AnsiPen; // Blue for INFO
//       default:
//         return pen.white() as AnsiPen; // Default color if no match
//     }
//   }

//   /// Custom log formatting (message + additional info)
//   @override
//   String toString() {
//     return '$errorType: $errorMessage ${additionalInfo.isNotEmpty ? "| Info: $additionalInfo" : ""}';
//   }
// }

