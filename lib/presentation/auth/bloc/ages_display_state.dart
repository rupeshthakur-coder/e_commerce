import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayState {}

class Agesloading extends AgesDisplayState {}

class Agesloaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  Agesloaded({required this.ages});
}

class AgesloadFailure extends AgesDisplayState {
  final String message;

  AgesloadFailure({required this.message});
}
