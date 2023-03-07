import 'package:baseball_log/view/create_account_page.dart';
import 'package:baseball_log/view/home_page.dart';
import 'package:baseball_log/widget/widget_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginUserEmail = '';
  String loginUserPassword = '';
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('ログイン'),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'メールアドレス'),
              onChanged: (String value) {
                setState(() {
                  loginUserEmail = value;
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'パスワード'),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  loginUserPassword = value;
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()
                  ),
                ),
              },
              child: const Text('ログイン')
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                const TextSpan(text: 'アカウントをお持ちでない方は'),
                TextSpan(text: 'こちら',
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccountPage()));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
