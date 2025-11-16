import 'package:equatable/equatable.dart';

class Phone extends Equatable{
  final String id ;
  final String name ;
  const Phone({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  @override
  List<Object?> get props => [id,name];

}