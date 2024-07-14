import 'package:equatable/equatable.dart';

class Hackathon extends Equatable {
  final String hacktitle;
  final String hackdescription;
  final String hackimageUrl;
  final int hackcoinCount;
  final String hackathondetails;
  final String hackathonmainimgUrl;

  Hackathon({
    required this.hacktitle,
    required this.hackdescription,
    required this.hackimageUrl,
    required this.hackcoinCount,
    required this.hackathondetails,
    required this.hackathonmainimgUrl,
  });

  factory Hackathon.fromJson(Map<String, dynamic> json) {
    return Hackathon(
      hacktitle: json['hacktitle'] ?? '',
      hackdescription: json['hackdescription'] ?? '',
      hackimageUrl: json['hackimageUrl'] ?? '',
      hackcoinCount: json['hackcoinCount'] ?? 0,
      hackathondetails: json['hackathondetails'] ?? '',
      hackathonmainimgUrl: json['hackathonmainimgUrl'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        hacktitle,
        hackdescription,
        hackimageUrl,
        hackcoinCount,
        hackathondetails,
        hackathonmainimgUrl,
      ];
}
