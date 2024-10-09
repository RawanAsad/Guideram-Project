class ListFreeTime {
  List<int>? sut;
  List<int>? sun;
  List<int>? mon;
  List<int>? tus;
  List<int>? wed;
  List<int>? ths;
  List<int>? fri;

  ListFreeTime(
      {this.sut, this.sun, this.mon, this.tus, this.wed, this.ths, this.fri});

  ListFreeTime.fromJson(Map<String, dynamic> json) {
    sut = json['sut'].cast<int>();
    sun = json['sun'].cast<int>();
    mon = json['mon'].cast<int>();
    tus = json['tus'].cast<int>();
    wed = json['wed'].cast<int>();
    ths = json['ths'].cast<int>();
    fri = json['fri'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sut'] = this.sut;
    data['sun'] = this.sun;
    data['mon'] = this.mon;
    data['tus'] = this.tus;
    data['wed'] = this.wed;
    data['ths']=  this.ths;
    data['fri'] = this.fri;
    return data;
  }
}