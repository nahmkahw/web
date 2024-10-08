class MasterSuccess {
  String? stdcode;
  String? namethai;
  String? nameeng;
  String? year;
  String? semester;
  String? currname;
  String? majornamethai;
  String? majorname;
  String? plan;
  String? conferenceno;
  String? serialno;
  String? conferencedate;
  String? graduateddate;
  String? confirmdate;

  MasterSuccess(
      {this.stdcode,
      this.namethai,
      this.nameeng,
      this.year,
      this.semester,
      this.currname,
      this.majornamethai,
      this.majorname,
      this.plan,
      this.conferenceno,
      this.serialno,
      this.conferencedate,
      this.graduateddate,
      this.confirmdate});

  MasterSuccess.fromJson(Map<String, dynamic> json) {
    stdcode = json['STD_CODE'];
    namethai = json['NAME_THAI'];
    nameeng = json['NAME_ENG'];
    year = json['YEAR'];
    semester = json['SEMESTER'];
    currname = json['CURR_NAME'];
    majornamethai = json['MAJOR_NAME_THAI'];
    majorname = json['MAJOR_NAME'];
    plan = json['PLAN'];
    conferenceno = json['CONFERENCE_NO'];
    serialno = json['SERIAL_NO'];
    conferencedate = json['CONFERENCE_DATE'];
    graduateddate = json['GRADUATED_DATE'];
    confirmdate = json['CONFIRM_DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STD_CODE'] = this.stdcode;
    data['NAME_THAI'] = this.namethai;
    data['NAME_ENG'] = this.nameeng;
    data['YEAR'] = this.year;
    data['SEMESTER'] = this.semester;
    data['CURR_NAME'] = this.currname;
    data['MAJOR_NAME_THAI'] = this.majornamethai;
    data['MAJOR_NAME'] = this.majorname;
    data['PLAN'] = this.plan;
    data['CONFERENCE_NO'] = this.conferenceno;
    data['SERIAL_NO'] = this.serialno;
    data['CONFERENCE_DATE'] = this.conferencedate;
    data['GRADUATED_DATE'] = this.graduateddate;
    data['CONFIRM_DATE'] = this.confirmdate;
    return data;
  }
}
