import 'package:flutter/material.dart';

class Skill_Trainings {
  final title;
  final detail;
  final icon;
  final type;
  final link;
  final explanation;

  const Skill_Trainings({
    required this.title,
    required this.detail,
    required this.icon,
    required this.type,
    this.link,
    this.explanation,
  });
}

const Skill_Trainings_Content = [
  Skill_Trainings(
    title: "Excel",
    detail: "Microsoft Excel Tutorial for Beginners - Full Course",
    icon: Icons.videocam_outlined,
    type: "video",
    link: "https://www.youtube.com/watch?v=Vl0H-qTclOg",
    explanation: "",
  ),
];

List Skill_Trainings_detail = [
  {
    "title": "المهارات الشخصية",
    "detail": "فيما يتعلق بتنمية المهارات الشخصية للعامل ",
  }
];
