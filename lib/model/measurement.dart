import 'dart:math';

class Measurement {
  int sys;
  int dia;
  int pulse;
  String pills;
  String diagnosis;
  DateTime time;

  factory Measurement.random({DateTime? dateTime}) {
    dateTime ??= DateTime.now();
    Random rnd = Random(dateTime.microsecondsSinceEpoch);
    return Measurement(
        sys: 60 + rnd.nextInt(220-90),
        dia: 58 + rnd.nextInt(120-58),
        pulse: 50 + rnd.nextInt(70-50),
        pills: "None",
        diagnosis: "Something",
        time: dateTime);
  }

//<editor-fold desc="Data Methods">

  Measurement({
    required this.sys,
    required this.dia,
    required this.pulse,
    required this.pills,
    required this.diagnosis,
    required this.time,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Measurement &&
              runtimeType == other.runtimeType &&
              sys == other.sys &&
              dia == other.dia &&
              pulse == other.pulse &&
              pills == other.pills &&
              diagnosis == other.diagnosis &&
              time == other.time);

  @override
  int get hashCode =>
      sys.hashCode ^
      dia.hashCode ^
      pulse.hashCode ^
      pills.hashCode ^
      diagnosis.hashCode ^
      time.hashCode;

  @override
  String toString() {
    return 'Measurement{' +
        ' sys: $sys,' +
        ' dia: $dia,' +
        ' pulse: $pulse,' +
        ' pills: $pills,' +
        ' diagnosis: $diagnosis,' +
        ' time: $time,' +
        '}';
  }

  Measurement copyWith({
    int? sys,
    int? dia,
    int? pulse,
    String? pills,
    String? diagnosis,
    DateTime? time,
  }) {
    return Measurement(
      sys: sys ?? this.sys,
      dia: dia ?? this.dia,
      pulse: pulse ?? this.pulse,
      pills: pills ?? this.pills,
      diagnosis: diagnosis ?? this.diagnosis,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sys': this.sys,
      'dia': this.dia,
      'pulse': this.pulse,
      'pills': this.pills,
      'diagnosis': this.diagnosis,
      'time': this.time.microsecondsSinceEpoch,
    };
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    int microSeconds = map['time'];
    DateTime timeDate = DateTime.fromMicrosecondsSinceEpoch(microSeconds);
    return Measurement(
      sys: map['sys'] as int,
      dia: map['dia'] as int,
      pulse: map['pulse'] as int,
      pills: map['pills'] as String,
      diagnosis: map['diagnosis'] as String,
      time: timeDate,
    );
  }

//</editor-fold>
}