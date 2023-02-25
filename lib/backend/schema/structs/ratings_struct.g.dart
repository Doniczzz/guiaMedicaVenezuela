// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RatingsStruct> _$ratingsStructSerializer =
    new _$RatingsStructSerializer();

class _$RatingsStructSerializer implements StructuredSerializer<RatingsStruct> {
  @override
  final Iterable<Type> types = const [RatingsStruct, _$RatingsStruct];
  @override
  final String wireName = 'RatingsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, RatingsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.nombre;
    if (value != null) {
      result
        ..add('nombre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RatingsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RatingsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$RatingsStruct extends RatingsStruct {
  @override
  final String? nombre;
  @override
  final int? rating;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$RatingsStruct([void Function(RatingsStructBuilder)? updates]) =>
      (new RatingsStructBuilder()..update(updates))._build();

  _$RatingsStruct._({this.nombre, this.rating, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'RatingsStruct', 'firestoreUtilData');
  }

  @override
  RatingsStruct rebuild(void Function(RatingsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RatingsStructBuilder toBuilder() => new RatingsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RatingsStruct &&
        nombre == other.nombre &&
        rating == other.rating &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, nombre.hashCode), rating.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RatingsStruct')
          ..add('nombre', nombre)
          ..add('rating', rating)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class RatingsStructBuilder
    implements Builder<RatingsStruct, RatingsStructBuilder> {
  _$RatingsStruct? _$v;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  RatingsStructBuilder() {
    RatingsStruct._initializeBuilder(this);
  }

  RatingsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _rating = $v.rating;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RatingsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RatingsStruct;
  }

  @override
  void update(void Function(RatingsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RatingsStruct build() => _build();

  _$RatingsStruct _build() {
    final _$result = _$v ??
        new _$RatingsStruct._(
            nombre: nombre,
            rating: rating,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'RatingsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
