class Experts {
  int? userId;
  dynamic? isExpert;
  String? email;
  String? name;
  String? photo;
  dynamic? wallet;
  int? expertId;
  String? phone;
  String? experience;
  String? address;
  dynamic? rate;
  int? rateCount;
  dynamic? cost;
  int? duration;

  Experts(
      {this.userId,
        this.isExpert,
        this.email,
        this.name,
        this.photo,
        this.wallet,
        this.expertId,
        this.phone,
        this.experience,
        this.address,
        this.rate,
        this.rateCount,
        this.cost,
        this.duration});

  Experts.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    isExpert = json['is_expert'];
    email = json['email'];
    name = json['name'];
    photo = json['photo'];
    wallet = json['wallet'];
    expertId = json['expert_id'];
    phone = json['phone'];
    experience = json['experience'];
    address = json['address'];
    rate = json['rate'];
    rateCount = json['rate_count'];
    cost = json['cost'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['is_expert'] = this.isExpert;
    data['email'] = this.email;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['wallet'] = this.wallet;
    data['expert_id'] = this.expertId;
    data['phone'] = this.phone;
    data['experience'] = this.experience;
    data['address'] = this.address;
    data['rate'] = this.rate;
    data['rate_count'] = this.rateCount;
    data['cost'] = this.cost;
    data['duration'] = this.duration;
    return data;
  }
}