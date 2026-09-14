enum BloodClass { A, B, AB, O }

class BloodGroups {
  final BloodClass bloodClass;
  final bool rhFactor;

  BloodGroups.aPositive() : bloodClass = BloodClass.A, rhFactor = true;
  BloodGroups.bPositive() : bloodClass = BloodClass.B, rhFactor = true;
  BloodGroups.abPositive() : bloodClass = BloodClass.AB, rhFactor = true;
  BloodGroups.oPositive() : bloodClass = BloodClass.O, rhFactor = true;

  BloodGroups.aNegative() : bloodClass = BloodClass.A, rhFactor = false;
  BloodGroups.bNegative() : bloodClass = BloodClass.B, rhFactor = false;
  BloodGroups.abNegative() : bloodClass = BloodClass.AB, rhFactor = false;
  BloodGroups.oNegative() : bloodClass = BloodClass.O, rhFactor = false;

  @override
  String toString() => "${bloodClass.name}${rhFactor ? '+' : '-'}";
}
