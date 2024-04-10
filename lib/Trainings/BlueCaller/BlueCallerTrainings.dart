import 'package:flutter/material.dart';

class BlueCaller_Trainings {
  final title;
  final detail;
  final icon;
  final type;
  final link;
  final explanation;

  const BlueCaller_Trainings({
    required this.title,
    required this.detail,
    required this.icon,
    required this.type,
    this.link,
    this.explanation,
  });
}

const BlueCaller_Trainings_Content = [
  BlueCaller_Trainings(
    title: "طريقة تنفيذ الوصله اللاصقه العازله",
    detail:
        "تجهيز المعدات اللازمة للقيام بعملية اللاصق وتجهيز القضيب والمواد اللاصقة",
    icon: Icons.videocam_outlined,
    type: "video",
    link: "https://www.youtube.com/watch?v=zrT4-Ie0Mto",
    explanation: "",
  ),
  BlueCaller_Trainings(
    title: "اختصاصات مشرف القطار",
    detail: "شرح مهام مشرف القطار",
    icon: Icons.videocam_outlined,
    type: "video",
    link: "https://www.youtube.com/watch?v=Q-edUrXB9xE",
    explanation: "",
  ),
];

List BlueCaller_Trainings_detail = [
  {
    "title": "التدريب التشغيلي",
    "detail": "فيما يتعلق بتنمية المهارات الفنية للعامل ",
  }
];
