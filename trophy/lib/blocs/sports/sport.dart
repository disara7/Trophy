import 'package:equatable/equatable.dart';

class Sport extends Equatable {
  final String sporttitle;
  final String sportdescription;
  final String sportimageUrl;
  final int sportcoinCount;
  final String type;
  final String sportdetails;
  final String sportmainimgUrl;

  const Sport(
      {required this.sporttitle,
      required this.sportdescription,
      required this.sportimageUrl,
      required this.sportcoinCount,
      required this.type,
      required this.sportdetails,
      required this.sportmainimgUrl});

  factory Sport.fromJson(Map<String, dynamic> json) {
    return Sport(
      sporttitle: json['sporttitle'] ?? '',
      sportdescription: json['sportdescription'] ?? '',
      sportimageUrl: json['sportimageUrl'] ?? '',
      sportcoinCount: json['sportcoinCount'] ?? 0,
      sportdetails: json['sportdetails'] ?? '',
      sportmainimgUrl: json['sportmainimgUrl'] ?? '',
      type: json['type'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        sporttitle,
        sportdescription,
        sportimageUrl,
        sportcoinCount,
        sportdetails,
        sportmainimgUrl,
        type,
      ];
}
