import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:go_router/go_router.dart';

class BranchListener extends StatefulWidget {
  const BranchListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<BranchListener> createState() => _BranchListenerState();
}

class _BranchListenerState extends State<BranchListener> {
  late final StreamSubscription<Map<dynamic, dynamic>> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = FlutterBranchSdk.listSession().listen(
      (data) {
        if (data.containsKey('+clicked_branch_link') &&
            data['+clicked_branch_link'] == true) {
          //Link clicked. Add logic to get link data
          final path = data[r'$deeplink_path'] as String?;
          if (path != null) {
            context.go(path);
            log('Deep link path: $path');
          }
          log('Custom data: $data');
        }
      },
      onError: (dynamic error) {
        print('listSession error: ${error.toString()}');
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
