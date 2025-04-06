import 'dart:convert';
import 'dart:io';

import 'package:supabase/supabase.dart';

Future<void> main(List<String> arguments) async {
  print('BEGIN');
  String supabaseUrl = arguments[0];
  String supabaseKey = arguments[1];
  String commit = arguments[2];
  final supabase = SupabaseClient(
    supabaseUrl,
    supabaseKey,
  );
  try {
    var input = await File('./metrics-report.json').readAsString();
    var map = jsonDecode(input);
    int scannedFolders = 0;
    int totalScannedFiles = map['summary'][1]['value'];
    int totalLinesOfSourceCode = map['summary'][2]['value'];
    int totalClasses = map['summary'][3]['value'];
    double averageCyclomatic = map['summary'][4]['value'];
    int averageSourceLinesOfCode = map['summary'][5]['value'];

    await supabase.from('code_complexities').insert(
      {
        'project_name': 'elevarm_ui',
        'branch_name': 'dev',
        'scanned_folders': scannedFolders,
        'total_scanned_files': totalScannedFiles,
        'total_lines_of_source_code': totalLinesOfSourceCode,
        'total_classes': totalClasses,
        'average_cyclomatic': averageCyclomatic,
        'average_source_lines_of_code': averageSourceLinesOfCode,
        'commit': commit,
      },
    );
  } on Exception catch (e) {
    print(e);
    exit(1);
  }
  print('END');
  exit(0);
}
