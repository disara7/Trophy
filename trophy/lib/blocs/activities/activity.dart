import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String title;
  final String description;
  final String imageUrl;
  final int coinCount;
  final String activitiesdetails;
  final String activitiesmainimgUrl;
  final String activitydate;
  final String activitytime;
  final String activityvenue;

  Activity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.coinCount,
    required this.activitiesdetails,
    required this.activitiesmainimgUrl,
    required this.activitydate,
    required this.activitytime,
    required this.activityvenue,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      coinCount: json['coinCount'] ?? 0,
      activitiesdetails: json['activitiesdetails'] ?? '',
      activitiesmainimgUrl: json['activitiesmainimgUrl'] ?? '',
      activitydate: json['activitydate'] ?? '',
      activitytime: json['activitytime'] ?? '',
      activityvenue: json['activityvenue'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        imageUrl,
        coinCount,
        activitiesdetails,
        activitiesmainimgUrl,
        activitydate,
        activitytime,
        activityvenue,
      ];
}
