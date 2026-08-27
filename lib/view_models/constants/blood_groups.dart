enum BloodClass {
  A, B, AB, O
}

class BloodGroup {
  BloodClass? bClass;
  bool? rhFactor;

  // Postive groups
  BloodGroup.aPositive({this.bClass = .A, this.rhFactor = true});
  BloodGroup.bPositive({this.bClass = .B, this.rhFactor = true});
  BloodGroup.abPositive({this.bClass = .AB, this.rhFactor = true});
  BloodGroup.oPositive({this.bClass = .O, this.rhFactor = true});

  // Negative groups
  BloodGroup.aNegative({this.bClass = .A, this.rhFactor = false});
  BloodGroup.bNegative({this.bClass = .B, this.rhFactor = false});
  BloodGroup.abNegative({this.bClass = .AB, this.rhFactor = false});
  BloodGroup.oNegative({this.bClass = .O, this.rhFactor = false});
}

