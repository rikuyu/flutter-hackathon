import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ui/main.dart';
import 'package:flutter_hackathon/ui/utils/password_field_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/utils/utils.dart';
import '../sign_up/sign_up_page.dart';
import '../utils/utils.dart';
import 'log_in_view_model.dart';

class LogInPage extends ConsumerWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(logInViewModelProvider);
    final notifier = ref.read(logInViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("イベント探しアプリ", style: TextStyle(color: Colors.white)),
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
                    const Text("ログイン", style: TextStyle(fontSize: 20)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child:
                          Center(child: Image.asset('images/event_icon.png')),
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
                              final result = await notifier.logIn();
                              switch (result.runtimeType) {
                                case Success:
                                  Utils.showSnackBar(context, result.message,
                                      Colors.greenAccent);
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
                                  Text("ログイン",
                                      style: TextStyle(color: Colors.white)),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child:
                                        Icon(Icons.login, color: Colors.white),
                                  )
                                ])),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("新規登録"),
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: Icon(Icons.account_circle_outlined),
                              )
                            ]))
                  ],
                ),
              ),
              if (state.isLoading)
                const Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
