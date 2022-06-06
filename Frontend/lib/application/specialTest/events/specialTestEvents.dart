part of '../bloc/specialTestBloc.dart';

abstract class specialTestEvent extends Equatable {
  const specialTestEvent();
}

class loadSpecialTest extends specialTestEvent {
  SpecialTest test;
  loadSpecialTest({required this.test});
  @override
  List<Object> get props => [test];
}

class createSpecialTest extends specialTestEvent {
  final SpecialTest specialTest;
  const createSpecialTest(this.specialTest);

  @override
  List<Object> get props => [specialTest];

  @override
  String toString() => 'SpecialTest Created {request Id: ${specialTest.id}}';
}

class updateSpecialTest extends specialTestEvent {
  final String id;
  final SpecialTest specialTest;

  const updateSpecialTest(this.id, this.specialTest);
  @override
  List<Object> get props => [id, specialTest];

  @override
  String toString() => 'SpecialTest Updated {request Id: ${specialTest.id}}';
}

class DeleteSpecialTest extends specialTestEvent {
  final String id;
  const DeleteSpecialTest(this.id);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'SpecialTestDeleted {request Id: $id}';

  @override
  bool? get stringify => true;
}
