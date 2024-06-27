import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  final String image;
  final String description;

  const CategoryState(this.image, this.description);

  @override
  List<Object> get props => [image, description];
}
