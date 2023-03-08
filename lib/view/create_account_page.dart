import 'package:baseball_log/utils/firebase/authentication.dart';
import 'package:baseball_log/view/home_page.dart';
import 'package:baseball_log/widget/widget_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String email = '';
  String pass = '';
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('アカウント作成'),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'メールアドレス'),
              onChanged: (String value) {
                setState(() {
                  email = value;
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
                  pass = value;
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: () => {
                Authentication.signUp(email: email, pass: pass),
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()
                  ),
                ),
              },
              child: const Text('新規登録')
          ),
          Text(infoText),
        ],
      ),
    );
  }
}
