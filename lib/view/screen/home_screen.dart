import 'package:flutter/material.dart';
import "package:kanade_hp/view/widget/main_visual.dart";
import "package:kanade_hp/view/widget/message.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainVisual(),
        WelcomeMessage(
          title: 'ようこそ',
          message:
              'この度は、ピアニスト近藤奏の公式ウェブサイトにアクセスいただき、誠にありがとうございます。\nここでは演奏会の情報や活動の様子、そして音楽に対する想いなどを発信していきます。どうぞごゆっくりご覧ください。',
        ),
      ],
    );
  }
}
