import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'ratings_struct.g.dart';

abstract class RatingsStruct
    implements Built<RatingsStruct, RatingsStructBuilder> {
  static Serializer<RatingsStruct> get serializer => _$ratingsStructSerializer;

  String? get nombre;

  int? get rating;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(RatingsStructBuilder builder) => builder
    ..nombre = ''
    ..rating = 0
    ..firestoreUtilData = FirestoreUtilData();

  RatingsStruct._();
  factory RatingsStruct([void Function(RatingsStructBuilder) updates]) =
      _$RatingsStruct;
}

RatingsStruct createRatingsStruct({
  String? nombre,
  int? rating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RatingsStruct(
      (r) => r
        ..nombre = nombre
        ..rating = rating
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

RatingsStruct? updateRatingsStruct(
  RatingsStruct? ratings, {
  bool clearUnsetFields = true,
}) =>
    ratings != null
        ? (ratings.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addRatingsStructData(
  Map<String, dynamic> firestoreData,
  RatingsStruct? ratings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ratings == null) {
    return;
  }
  if (ratings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && ratings.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ratingsData = getRatingsFirestoreData(ratings, forFieldValue);
  final nestedData = ratingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = ratings.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getRatingsFirestoreData(
  RatingsStruct? ratings, [
  bool forFieldValue = false,
]) {
  if (ratings == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(RatingsStruct.serializer, ratings);

  // Add any Firestore field values
  ratings.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRatingsListFirestoreData(
  List<RatingsStruct>? ratingss,
) =>
    ratingss?.map((r) => getRatingsFirestoreData(r, true)).toList() ?? [];
