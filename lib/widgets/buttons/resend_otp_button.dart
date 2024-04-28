import 'dart:async';

import 'package:flutter/material.dart';

class ResendOtpButton extends StatefulWidget {
  const ResendOtpButton({
    super.key,
    this.onTimeout,
  });

  final VoidCallback? onTimeout;
  @override
  State<ResendOtpButton> createState() => _ResendOtpButtonState();
}

class _ResendOtpButtonState extends State<ResendOtpButton> {
  late Timer timer;

  late ValueNotifier<int> timeOut;

  @override
  initState() {
    super.initState();
    timeOut = ValueNotifier(45);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeOut.value != 0) {
          timeOut.value = timeOut.value - 1;
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: timeOut,
      builder: (context, value, _) {
        return TextButton(
          onPressed: value != 0
              ? null
              : () {
                  setState(() {
                    timer = Timer.periodic(
                      const Duration(seconds: 1),
                      (timer) {
                        if (timeOut.value != 0) {
                          timeOut.value = timeOut.value - 1;
                        } else {
                          timer.cancel();
                        }
                      },
                    );
                    timeOut.value = 45;
                  });
                  if (widget.onTimeout != null) {
                    widget.onTimeout?.call();
                  }
                },
          child: Text(
            value != 0 ? 'Resend OTP in $value seconds' : 'Resend OTP',
          ),
        );
      },
    );
  }
}
