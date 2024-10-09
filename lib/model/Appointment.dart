class Appointment {
  int? counsultationId;
  int? userId;
  int? expertId;
  int? day;
  int? from;
  String? createdAt;
  String? updatedAt;

  Appointment(
      {this.counsultationId,
        this.userId,
        this.expertId,
        this.day,
        this.from,
        this.createdAt,
        this.updatedAt});

  Appointment.fromJson(Map<String, dynamic> json) {
    counsultationId = json['counsultation_id'];
    userId = json['user_id'];
    expertId = json['expert_id'];
    day = json['day'];
    from = json['from'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counsultation_id'] = this.counsultationId;
    data['user_id'] = this.userId;
    data['expert_id'] = this.expertId;
    data['day'] = this.day;
    data['from'] = this.from;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
