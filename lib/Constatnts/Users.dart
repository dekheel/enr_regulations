class UserFields {
  static final String SapNo = "SapNo";
  static final String Name = "Name";
  static final String Title = "Title";
  static final String Section = "Section";
  static final String Work_Zone = "Work_Zone";
  static final String Phone_Number = "Phone_Number";
  static final String Password = "Password";
  static final String Activation = "Activation";
  static final String Authentication = "Authentication";
  static final String PhoneType = "PhoneType";
  static final String Registeration_Date_Time = "Registeration_Date_Time";

  static List<String> getFields() => [
        SapNo,
        Name,
        Title,
        Section,
        Work_Zone,
        Phone_Number,
        Password,
        Activation,
        Authentication,
        PhoneType,
        Registeration_Date_Time
      ];
}

class user {
  final String SapNo;
  final String Name;
  final String Title;
  final String Section;
  final String Work_Zone;
  final String Phone_Number;
  final String Password;
  final String Activation;
  final String Authentication;
  final String PhoneType;
  final String Registeration_Date_Time;

  const user({
    required this.SapNo,
    required this.Name,
    required this.Title,
    required this.Section,
    required this.Work_Zone,
    required this.Phone_Number,
    required this.Password,
    required this.Activation,
    required this.Authentication,
    required this.PhoneType,
    required this.Registeration_Date_Time,
  });

  static user fromJson(List<String> json) {
    return user(
        SapNo: json[0],
        Name: json[1],
        Title: json[2],
        Section: json[3],
        Work_Zone: json[4],
        Phone_Number: json[5],
        Password: json[6],
        Activation: json[7],
        Authentication: json[8],
        PhoneType: json[9],
        Registeration_Date_Time: json[10]);
  }
}

final SectionsList = [
  'عمليات الموارد البشرية',
  'الصيانة والدعم الفني',
  'نقل البضائع',
  'الخدمات المشتركة',
  'المسافات القصيرة',
  'المسافات الطويلة',
  'البنية الأساسية',
  'السلامة والجودة',
  'الشئون المالية',
  'المشروعات الهندسية',
  'الاحتياجات',
  'المراجعة الداخلية والفحص',
  'الإدارة العامة للأمن',
];

final WorkZoneList = [
  'غرب الدلتا',
  'القاهرة',
  'وسط الدلتا',
  'شرق الدلتا',
  'المنطقة الوسطى',
  'المنطقة الجنوبية',
];

final googleLink = "https://drive.google.com/uc?export=view&id=";
