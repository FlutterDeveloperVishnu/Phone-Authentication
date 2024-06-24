import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../home_screen.dart';

class OtpScreen extends StatefulWidget {
  String verificationId;
  OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter OTP Here',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Pinput(
                  controller: otpController,
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.black87,
                    foregroundColor: CupertinoColors.white,
                  ),
                  onPressed: () async {
                    try {
                      PhoneAuthCredential? credential =
                          await PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: otpController.text.toString());
                      FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then(
                            (value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            ),
                          );
                    } on FirebaseAuthException catch (ex) {
                      SnackBar(
                        content: Text(
                          ex.code.toString(),
                        ),
                      );
                    }
                    ;
                  },
                  child: const Text('Verify OTP'))
            ],
          ),
        ),
      ),
    );
  }
}
