import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final Logger logger = Logger('Eventpix');

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
  });
}

typedef Json = Map<String, dynamic>;

const String apiDomain = 'eventpix.jp';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const MyAppBar({super.key}) : preferredSize = const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    Widget appBarTitle = InkWell(
      child: Image.asset(
        'assets/icon/logo_name.png',
        height: 40,
      ),
      onTap:() {
        Navigator.of(context).pushReplacementNamed('/');
      },
    );
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: appBarTitle,
    );
  }
}

class NoAnimationPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationPageRoute({required super.builder});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // 遷移アニメーションを無効化
    return child;
  }
}

void errorDialog(BuildContext context, String errorMessage,
    {VoidCallback? onRetry}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('ERROR!'),
        content: Text(errorMessage),
        actions: <Widget>[
          // 再試行ボタン
          if (onRetry != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ダイアログを閉じる
                onRetry(); // 再試行のコールバックを実行
              },
              child: const Text('再試行'),
            ),
          // OKボタン
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}
