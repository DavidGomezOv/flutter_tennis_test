// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_tennis_test/test/data/repositories/reservations_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_tennis_test/data/datasources/local/reservation_local_source.dart'
    as _i3;
import 'package:flutter_tennis_test/domain/models/reservation/court_model.dart'
    as _i6;
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart'
    as _i5;
import 'package:hive/hive.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBox_0<E> extends _i1.SmartFake implements _i2.Box<E> {
  _FakeBox_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ReservationLocalSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockReservationLocalSource extends _i1.Mock
    implements _i3.ReservationLocalSource {
  MockReservationLocalSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Box<_i5.ReservationModel>> openReservationsBox() =>
      (super.noSuchMethod(
        Invocation.method(
          #openReservationsBox,
          [],
        ),
        returnValue: _i4.Future<_i2.Box<_i5.ReservationModel>>.value(
            _FakeBox_0<_i5.ReservationModel>(
          this,
          Invocation.method(
            #openReservationsBox,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Box<_i5.ReservationModel>>);

  @override
  _i4.Future<_i2.Box<_i6.CourtModel>> openCourtBox() => (super.noSuchMethod(
        Invocation.method(
          #openCourtBox,
          [],
        ),
        returnValue: _i4.Future<_i2.Box<_i6.CourtModel>>.value(
            _FakeBox_0<_i6.CourtModel>(
          this,
          Invocation.method(
            #openCourtBox,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Box<_i6.CourtModel>>);

  @override
  _i4.Future<List<_i5.ReservationModel>> getReservations() =>
      (super.noSuchMethod(
        Invocation.method(
          #getReservations,
          [],
        ),
        returnValue: _i4.Future<List<_i5.ReservationModel>>.value(
            <_i5.ReservationModel>[]),
      ) as _i4.Future<List<_i5.ReservationModel>>);

  @override
  _i4.Future<void> deleteReservation({required int? reservationId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteReservation,
          [],
          {#reservationId: reservationId},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> createReservation(
          {required _i5.ReservationModel? reservationModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createReservation,
          [],
          {#reservationModel: reservationModel},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i6.CourtModel?> getCourtData({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCourtData,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<_i6.CourtModel?>.value(),
      ) as _i4.Future<_i6.CourtModel?>);

  @override
  _i4.Future<List<_i6.CourtModel>> getCourts() => (super.noSuchMethod(
        Invocation.method(
          #getCourts,
          [],
        ),
        returnValue: _i4.Future<List<_i6.CourtModel>>.value(<_i6.CourtModel>[]),
      ) as _i4.Future<List<_i6.CourtModel>>);

  @override
  _i4.Future<void> saveTestCourts() => (super.noSuchMethod(
        Invocation.method(
          #saveTestCourts,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
