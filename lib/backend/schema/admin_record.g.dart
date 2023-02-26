// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdminRecord> _$adminRecordSerializer = new _$AdminRecordSerializer();

class _$AdminRecordSerializer implements StructuredSerializer<AdminRecord> {
  @override
  final Iterable<Type> types = const [AdminRecord, _$AdminRecord];
  @override
  final String wireName = 'AdminRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AdminRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AdminRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdminRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AdminRecord extends AdminRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AdminRecord([void Function(AdminRecordBuilder)? updates]) =>
      (new AdminRecordBuilder()..update(updates))._build();

  _$AdminRecord._({this.user, this.ffRef}) : super._();

  @override
  AdminRecord rebuild(void Function(AdminRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminRecordBuilder toBuilder() => new AdminRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminRecord && user == other.user && ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, user.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminRecord')
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AdminRecordBuilder implements Builder<AdminRecord, AdminRecordBuilder> {
  _$AdminRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AdminRecordBuilder() {
    AdminRecord._initializeBuilder(this);
  }

  AdminRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdminRecord;
  }

  @override
  void update(void Function(AdminRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminRecord build() => _build();

  _$AdminRecord _build() {
    final _$result = _$v ?? new _$AdminRecord._(user: user, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
