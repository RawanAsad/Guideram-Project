class Expert {
  Expert({
    required this.expertId,
    required this.phone,
    required this.experience,
    required this.address,
    required this.rate,
    required this.rateCount,
     this.cost,
     this.duration,
    required this.userId,
    required this.isExpert,
    required this.email,
    required this.password,
    required this.name,
    required this.photo,
    required this.wallet,
     this.expertConsultationTypes,
     this.workTime,
  });
  late final int expertId;
  late final String phone;
  late final String experience;
  late final String address;
  late final int rate;
  late final int rateCount;
  late final dynamic cost;
  late final int? duration;
  late final int userId;
  late final dynamic isExpert;
  late final String email;
  late final String password;
  late final String name;
  late final String photo;
  late final dynamic wallet;
  late final List<ExpertConsultationTypes>? expertConsultationTypes;
  late final List<WorkTime>? workTime;

  Expert.fromJson(Map<String, dynamic> json){
    expertId = json['expert_id'];
    phone = json['phone'];
    experience = json['experience'];
    address = json['address'];
    rate = json['rate'];
    rateCount = json['rate_count'];
    cost = json['cost'];
    duration = json['duration'];
    userId = json['user_id'];
    isExpert = json['is_expert'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    photo = json['photo'];
    wallet = json['wallet'];
    expertConsultationTypes = List.from(json['expert_consultation_types']).map((e)=>ExpertConsultationTypes.fromJson(e)).toList();
    workTime = List.from(json['work_time']).map((e)=>WorkTime.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['expert_id'] = expertId;
    _data['phone'] = phone;
    _data['experience'] = experience;
    _data['address'] = address;
    _data['rate'] = rate;
    _data['rate_count'] = rateCount;
    _data['cost'] = cost;
    _data['duration'] = duration;
    _data['user_id'] = userId;
    _data['is_expert'] = isExpert;
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    _data['photo'] = photo;
    _data['wallet'] = wallet;
    _data['expert_consultation_types'] = expertConsultationTypes?.map((e)=>e.toJson()).toList();
    _data['work_time'] = workTime?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ExpertConsultationTypes {
  ExpertConsultationTypes({
     this.consultationTypeId,
     this.type,
     this.pivot,
  });
  late final int? consultationTypeId;
  late final String? type;
  late final Pivot? pivot;

  ExpertConsultationTypes.fromJson(Map<String, dynamic> json){
    consultationTypeId = json['consultation_type_id'];
    type = json['type'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['consultation_type_id'] = consultationTypeId;
    _data['type'] = type;
    _data['pivot'] = pivot?.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
     this.expertId,
     this.consultationTypeId,
  });
  late final int? expertId;
  late final int? consultationTypeId;

  Pivot.fromJson(Map<String, dynamic> json){
    expertId = json['expert_id'];
    consultationTypeId = json['consultation_type_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['expert_id'] = expertId;
    _data['consultation_type_id'] = consultationTypeId;
    return _data;
  }
}

class WorkTime {
  WorkTime({
    required this.workTimeId,
    required this.expertId,
    required this.day,
    required this.from,
    required this.to,
  });
  late final int workTimeId;
  late final int expertId;
  late final int day;
  late final int from;
  late final int to;

  WorkTime.fromJson(Map<String, dynamic> json){
    workTimeId = json['work_time_id'];
    expertId = json['expert_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
  }





  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['work_time_id'] = workTimeId;
    _data['expert_id'] = expertId;
    _data['day'] = day;
    _data['from'] = from;
    _data['to'] = to;
    return _data;
  }
}