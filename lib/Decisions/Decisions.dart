class Decisions {
  final title;
  final date;
  final number;
  final image;
  final bookTitle;
  final order;

  const Decisions(
      {required this.date,
      required this.number,
      required this.title,
      required this.image,
      required this.bookTitle,
      required this.order});
}

const HR_Decisions = [];

const global_Decisions = [
  Decisions(
      bookTitle: "تعليمات وقرارات عامة",
      image:
          "https://drive.google.com/uc?export=view&id=13yoUptrl0HrsdJMHl4ajSOqeP1Pu8g6e",
      number: "رقم 235 ",
      title: "ساعات العمل بالورش",
      date: "بتاريخ 2021/04/02",
      order: 1),
  Decisions(
      bookTitle: "تعليمات وقرارات عامة",
      image:
          "https://drive.google.com/uc?export=view&id=1A5_lpdtnHYfHbuJdveNr-KLJYlf_8Xo2",
      number: "رقم بدون ",
      title: "التصريح باجازة بدون مرتب",
      date: "بتاريخ 2022/06/29",
      order: 2),
];
