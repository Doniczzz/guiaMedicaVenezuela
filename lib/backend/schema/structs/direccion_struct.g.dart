// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direccion_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DireccionStruct> _$direccionStructSerializer =
    new _$DireccionStructSerializer();

class _$DireccionStructSerializer
    implements StructuredSerializer<DireccionStruct> {
  @override
  final Iterable<Type> types = const [DireccionStruct, _$DireccionStruct];
  @override
  final String wireName = 'DireccionStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, DireccionStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.calleAvenida;
    if (value != null) {
      result
        ..add('calle_avenida')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.altura;
    if (value != null) {
      result
        ..add('altura')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.referencia;
    if (value != null) {
      result
        ..add('referencia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DireccionStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DireccionStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'calle_avenida':
          result.calleAvenida = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'altura':
          result.altura = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'referencia':
          result.referencia = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$DireccionStruct extends DireccionStruct {
  @override
  final String? calleAvenida;
  @override
  final String? altura;
  @override
  final String? referencia;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DireccionStruct([void Function(DireccionStructBuilder)? updates]) =>
      (new DireccionStructBuilder()..update(updates))._build();

  _$DireccionStruct._(
      {this.calleAvenida,
      this.altura,
      this.referencia,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DireccionStruct', 'firestoreUtilData');
  }

  @override
  DireccionStruct rebuild(void Function(DireccionStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DireccionStructBuilder toBuilder() =>
      new DireccionStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DireccionStruct &&
        calleAvenida == other.calleAvenida &&
        altura == other.altura &&
        referencia == other.referencia &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, calleAvenida.hashCode), altura.hashCode),
            referencia.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DireccionStruct')
          ..add('calleAvenida', calleAvenida)
          ..add('altura', altura)
          ..add('referencia', referencia)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DireccionStructBuilder
    implements Builder<DireccionStruct, DireccionStructBuilder> {
  _$DireccionStruct? _$v;

  String? _calleAvenida;
  String? get calleAvenida => _$this._calleAvenida;
  set calleAvenida(String? calleAvenida) => _$this._calleAvenida = calleAvenida;

  String? _altura;
  String? get altura => _$this._altura;
  set altura(String? altura) => _$this._altura = altura;

  String? _referencia;
  String? get referencia => _$this._referencia;
  set referencia(String? referencia) => _$this._referencia = referencia;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DireccionStructBuilder() {
    DireccionStruct._initializeBuilder(this);
  }

  DireccionStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _calleAvenida = $v.calleAvenida;
      _altura = $v.altura;
      _referencia = $v.referencia;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DireccionStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DireccionStruct;
  }

  @override
  void update(void Function(DireccionStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DireccionStruct build() => _build();

  _$DireccionStruct _build() {
    final _$result = _$v ??
        new _$DireccionStruct._(
            calleAvenida: calleAvenida,
            altura: altura,
            referencia: referencia,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'DireccionStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
