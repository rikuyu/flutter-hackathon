import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ui/sign_up/sign_up_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/utils/utils.dart';
import '../main.dart';
import '../utils/password_field_widget.dart';
import '../utils/utils.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpViewModelProvider);
    final notifier = ref.read(signUpViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Event App"),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("新規登録", style: TextStyle(fontSize: 20)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Center(child: Image.asset('images/event_icon.png')),
                    ),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "メールアドレス",
                        suffixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      onChanged: (email) {
                        notifier.setEmail(email);
                      },
                    ),
                    PasswordFieldWidget(
                        setPassword: notifier.setPassword, hintText: "パスワード"),
                    PasswordFieldWidget(
                        setPassword: notifier.setConfirmedPassword,
                        hintText: "確認用パスワード"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            final result = await notifier.signUp();
                            switch (result.runtimeType) {
                              case Success:
                                Utils.showSnackBar(
                                    context, result.message, Colors.greenAccent);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const MainPage()));
                                break;
                              case Failure:
                                Utils.showSnackBar(
                                    context,
                                    Utils.createAuthErrorMessage(result.data),
                                    Colors.redAccent);
                                break;
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("新規登録", style: TextStyle(color: Colors.white)),
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: Icon(Icons.account_circle_outlined,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (state.isLoading)
                Container(
                  color: Colors.white70,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
