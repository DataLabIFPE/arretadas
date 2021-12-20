import 'package:flutter/material.dart';

abstract class LoaderMixin {
  bool loaderOpen = false;

  showHideLoaderHelper(BuildContext context, bool conditional) {
    if (conditional) {
      showLoader(context);
    } else {
      hideLoader(context);
    }
  }

  showLoader(BuildContext context) {
    if (!loaderOpen) {
      loaderOpen = true;
      return Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return Container(
              width: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            );
          },
        );
      });
    }
  }

  hideLoader(BuildContext context) {
    if (loaderOpen) {
      loaderOpen = false;
      Navigator.of(context).pop();
    }
  }
}
