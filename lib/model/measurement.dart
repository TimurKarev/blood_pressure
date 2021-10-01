class Measurement {
  int sys;
  int dia;
  int pulse;
  String pills;
  String diagnosis;

//<editor-fold desc="Data Methods">

  Measurement({
    required this.sys,
    required this.dia,
    required this.pulse,
    required this.pills,
    required this.diagnosis,
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
          diagnosis == other.diagnosis);

  @override
  int get hashCode =>
      sys.hashCode ^
      dia.hashCode ^
      pulse.hashCode ^
      pills.hashCode ^
      diagnosis.hashCode;

  @override
  String toString() {
    return 'Measurement{' +
        ' sys: $sys,' +
        ' dia: $dia,' +
        ' pulse: $pulse,' +
        ' pills: $pills,' +
        ' diagnosis: $diagnosis,' +
        '}';
  }

  Measurement copyWith({
    int? sys,
    int? dia,
    int? pulse,
    String? pills,
    String? diagnosis,
  }) {
    return Measurement(
      sys: sys ?? this.sys,
      dia: dia ?? this.dia,
      pulse: pulse ?? this.pulse,
      pills: pills ?? this.pills,
      diagnosis: diagnosis ?? this.diagnosis,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sys': this.sys,
      'dia': this.dia,
      'pulse': this.pulse,
      'pills': this.pills,
      'diagnosis': this.diagnosis,
    };
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      sys: map['sys'] as int,
      dia: map['dia'] as int,
      pulse: map['pulse'] as int,
      pills: map['pills'] as String,
      diagnosis: map['diagnosis'] as String,
    );
  }

//</editor-fold>
}