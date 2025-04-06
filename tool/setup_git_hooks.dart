// ////////////////////////////////////////////////////////////
// / THIS IS GENERATED FILE
// / Do not change this manually
// ////////////////////////////////////////////////////////////

// ignore_for_file: avoid_print

import 'dart:io';

Future<void> main() async {
  // Create pre-commit file.
  final preCommitHook = File('.git/hooks/pre-commit');
  await preCommitHook.parent.create(recursive: true);
  await preCommitHook.writeAsString(
    '''
#!/bin/sh
exec dart run dart_pre_commit # specify custom options here
''',
  );

  if (!Platform.isWindows) {
    final result = await Process.run('chmod', ['a+x', preCommitHook.path]);
    stdout.write(result.stdout);
    stderr.write(result.stderr);
    exitCode = result.exitCode;
  }
  print('✅ Setup: ${preCommitHook.path}');

  // Create prepare-commit-msg file.
  final prepareCommitMsgHook = File('.git/hooks/prepare-commit-msg');
  await prepareCommitMsgHook.parent.create(recursive: true);
  await prepareCommitMsgHook.writeAsString(
    '''
#!/bin/sh
python3 tool/git_hook_handlers.py "prepare-commit-msg" \$1
ret=\$?
if [ \$ret -ne 0 ]; then
	echo 'Canceling commit...'
	exit 1
fi
''',
  );

  if (!Platform.isWindows) {
    final result =
        await Process.run('chmod', ['a+x', prepareCommitMsgHook.path]);
    stdout.write(result.stdout);
    stderr.write(result.stderr);
    exitCode = result.exitCode;
  }
  print('✅ Setup: ${prepareCommitMsgHook.path}');

  // Create pre-push file.
  final prePushHook = File('.git/hooks/pre-push');
  await prePushHook.parent.create(recursive: true);
  await prePushHook.writeAsString(
    '''
#!/bin/sh
python3 tool/git_hook_handlers.py "pre-push" \$1
ret=\$?
if [ \$ret -ne 0 ]; then
	echo 'Canceling push...'
	exit 1
fi
''',
  );

  if (!Platform.isWindows) {
    final result = await Process.run('chmod', ['a+x', prePushHook.path]);
    stdout.write(result.stdout);
    stderr.write(result.stderr);
    exitCode = result.exitCode;
  }
  print('✅ Setup: ${prePushHook.path}');
}
