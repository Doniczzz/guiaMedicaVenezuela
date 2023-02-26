// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MedicosRecord> _$medicosRecordSerializer =
    new _$MedicosRecordSerializer();

class _$MedicosRecordSerializer implements StructuredSerializer<MedicosRecord> {
  @override
  final Iterable<Type> types = const [MedicosRecord, _$MedicosRecord];
  @override
  final String wireName = 'MedicosRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MedicosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'direccion',
      serializers.serialize(object.direccion,
          specifiedType: const FullType(DireccionStruct)),
      'cuentaZelle',
      serializers.serialize(object.cuentaZelle,
          specifiedType: const FullType(ZelleStruct)),
      'ubicacion',
      serializers.serialize(object.ubicacion,
          specifiedType: const FullType(DondeViveStruct)),
    ];
    Object? value;
    value = object.pagosMovil;
    if (value != null) {
      result
        ..add('pagosMovil')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PagosMovilesStruct)])));
    }
    value = object.cuentasBancarias;
    if (value != null) {
      result
        ..add('cuentasBancarias')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CuentasBancariasStruct)])));
    }
    value = object.citasCreadas;
    if (value != null) {
      result
        ..add('citasCreadas')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ratings;
    if (value != null) {
      result
        ..add('ratings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(RatingsStruct)])));
    }
    value = object.especialidades;
    if (value != null) {
      result
        ..add('especialidades')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nombre;
    if (value != null) {
      result
        ..add('nombre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mostrarWhatsapp;
    if (value != null) {
      result
        ..add('mostrarWhatsapp')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.whatsapp;
    if (value != null) {
      result
        ..add('whatsapp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instagram;
    if (value != null) {
      result
        ..add('instagram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foto;
    if (value != null) {
      result
        ..add('foto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  MedicosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedicosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'direccion':
          result.direccion.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DireccionStruct))!
              as DireccionStruct);
          break;
        case 'pagosMovil':
          result.pagosMovil.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PagosMovilesStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'cuentasBancarias':
          result.cuentasBancarias.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(CuentasBancariasStruct)
              ]))! as BuiltList<Object?>);
          break;
        case 'cuentaZelle':
          result.cuentaZelle.replace(serializers.deserialize(value,
              specifiedType: const FullType(ZelleStruct))! as ZelleStruct);
          break;
        case 'citasCreadas':
          result.citasCreadas.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ubicacion':
          result.ubicacion.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DondeViveStruct))!
              as DondeViveStruct);
          break;
        case 'ratings':
          result.ratings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RatingsStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'especialidades':
          result.especialidades.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mostrarWhatsapp':
          result.mostrarWhatsapp = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'whatsapp':
          result.whatsapp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'instagram':
          result.instagram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'foto':
          result.foto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$MedicosRecord extends MedicosRecord {
  @override
  final DireccionStruct direccion;
  @override
  final BuiltList<PagosMovilesStruct>? pagosMovil;
  @override
  final BuiltList<CuentasBancariasStruct>? cuentasBancarias;
  @override
  final ZelleStruct cuentaZelle;
  @override
  final BuiltList<DocumentReference<Object?>>? citasCreadas;
  @override
  final double? rating;
  @override
  final DondeViveStruct ubicacion;
  @override
  final BuiltList<RatingsStruct>? ratings;
  @override
  final BuiltList<String>? especialidades;
  @override
  final String? nombre;
  @override
  final bool? mostrarWhatsapp;
  @override
  final String? whatsapp;
  @override
  final String? instagram;
  @override
  final String? foto;
  @override
  final String? email;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MedicosRecord([void Function(MedicosRecordBuilder)? updates]) =>
      (new MedicosRecordBuilder()..update(updates))._build();

  _$MedicosRecord._(
      {required this.direccion,
      this.pagosMovil,
      this.cuentasBancarias,
      required this.cuentaZelle,
      this.citasCreadas,
      this.rating,
      required this.ubicacion,
      this.ratings,
      this.especialidades,
      this.nombre,
      this.mostrarWhatsapp,
      this.whatsapp,
      this.instagram,
      this.foto,
      this.email,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        direccion, r'MedicosRecord', 'direccion');
    BuiltValueNullFieldError.checkNotNull(
        cuentaZelle, r'MedicosRecord', 'cuentaZelle');
    BuiltValueNullFieldError.checkNotNull(
        ubicacion, r'MedicosRecord', 'ubicacion');
  }

  @override
  MedicosRecord rebuild(void Function(MedicosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicosRecordBuilder toBuilder() => new MedicosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedicosRecord &&
        direccion == other.direccion &&
        pagosMovil == other.pagosMovil &&
        cuentasBancarias == other.cuentasBancarias &&
        cuentaZelle == other.cuentaZelle &&
        citasCreadas == other.citasCreadas &&
        rating == other.rating &&
        ubicacion == other.ubicacion &&
        ratings == other.ratings &&
        especialidades == other.especialidades &&
        nombre == other.nombre &&
        mostrarWhatsapp == other.mostrarWhatsapp &&
        whatsapp == other.whatsapp &&
        instagram == other.instagram &&
        foto == other.foto &&
        email == other.email &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    direccion
                                                                        .hashCode),
                                                                pagosMovil
                                                                    .hashCode),
                                                            cuentasBancarias
                                                                .hashCode),
                                                        cuentaZelle.hashCode),
                                                    citasCreadas.hashCode),
                                                rating.hashCode),
                                            ubicacion.hashCode),
                                        ratings.hashCode),
                                    especialidades.hashCode),
                                nombre.hashCode),
                            mostrarWhatsapp.hashCode),
                        whatsapp.hashCode),
                    instagram.hashCode),
                foto.hashCode),
            email.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedicosRecord')
          ..add('direccion', direccion)
          ..add('pagosMovil', pagosMovil)
          ..add('cuentasBancarias', cuentasBancarias)
          ..add('cuentaZelle', cuentaZelle)
          ..add('citasCreadas', citasCreadas)
          ..add('rating', rating)
          ..add('ubicacion', ubicacion)
          ..add('ratings', ratings)
          ..add('especialidades', especialidades)
          ..add('nombre', nombre)
          ..add('mostrarWhatsapp', mostrarWhatsapp)
          ..add('whatsapp', whatsapp)
          ..add('instagram', instagram)
          ..add('foto', foto)
          ..add('email', email)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MedicosRecordBuilder
    implements Builder<MedicosRecord, MedicosRecordBuilder> {
  _$MedicosRecord? _$v;

  DireccionStructBuilder? _direccion;
  DireccionStructBuilder get direccion =>
      _$this._direccion ??= new DireccionStructBuilder();
  set direccion(DireccionStructBuilder? direccion) =>
      _$this._direccion = direccion;

  ListBuilder<PagosMovilesStruct>? _pagosMovil;
  ListBuilder<PagosMovilesStruct> get pagosMovil =>
      _$this._pagosMovil ??= new ListBuilder<PagosMovilesStruct>();
  set pagosMovil(ListBuilder<PagosMovilesStruct>? pagosMovil) =>
      _$this._pagosMovil = pagosMovil;

  ListBuilder<CuentasBancariasStruct>? _cuentasBancarias;
  ListBuilder<CuentasBancariasStruct> get cuentasBancarias =>
      _$this._cuentasBancarias ??= new ListBuilder<CuentasBancariasStruct>();
  set cuentasBancarias(ListBuilder<CuentasBancariasStruct>? cuentasBancarias) =>
      _$this._cuentasBancarias = cuentasBancarias;

  ZelleStructBuilder? _cuentaZelle;
  ZelleStructBuilder get cuentaZelle =>
      _$this._cuentaZelle ??= new ZelleStructBuilder();
  set cuentaZelle(ZelleStructBuilder? cuentaZelle) =>
      _$this._cuentaZelle = cuentaZelle;

  ListBuilder<DocumentReference<Object?>>? _citasCreadas;
  ListBuilder<DocumentReference<Object?>> get citasCreadas =>
      _$this._citasCreadas ??= new ListBuilder<DocumentReference<Object?>>();
  set citasCreadas(ListBuilder<DocumentReference<Object?>>? citasCreadas) =>
      _$this._citasCreadas = citasCreadas;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  DondeViveStructBuilder? _ubicacion;
  DondeViveStructBuilder get ubicacion =>
      _$this._ubicacion ??= new DondeViveStructBuilder();
  set ubicacion(DondeViveStructBuilder? ubicacion) =>
      _$this._ubicacion = ubicacion;

  ListBuilder<RatingsStruct>? _ratings;
  ListBuilder<RatingsStruct> get ratings =>
      _$this._ratings ??= new ListBuilder<RatingsStruct>();
  set ratings(ListBuilder<RatingsStruct>? ratings) => _$this._ratings = ratings;

  ListBuilder<String>? _especialidades;
  ListBuilder<String> get especialidades =>
      _$this._especialidades ??= new ListBuilder<String>();
  set especialidades(ListBuilder<String>? especialidades) =>
      _$this._especialidades = especialidades;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  bool? _mostrarWhatsapp;
  bool? get mostrarWhatsapp => _$this._mostrarWhatsapp;
  set mostrarWhatsapp(bool? mostrarWhatsapp) =>
      _$this._mostrarWhatsapp = mostrarWhatsapp;

  String? _whatsapp;
  String? get whatsapp => _$this._whatsapp;
  set whatsapp(String? whatsapp) => _$this._whatsapp = whatsapp;

  String? _instagram;
  String? get instagram => _$this._instagram;
  set instagram(String? instagram) => _$this._instagram = instagram;

  String? _foto;
  String? get foto => _$this._foto;
  set foto(String? foto) => _$this._foto = foto;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MedicosRecordBuilder() {
    MedicosRecord._initializeBuilder(this);
  }

  MedicosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _direccion = $v.direccion.toBuilder();
      _pagosMovil = $v.pagosMovil?.toBuilder();
      _cuentasBancarias = $v.cuentasBancarias?.toBuilder();
      _cuentaZelle = $v.cuentaZelle.toBuilder();
      _citasCreadas = $v.citasCreadas?.toBuilder();
      _rating = $v.rating;
      _ubicacion = $v.ubicacion.toBuilder();
      _ratings = $v.ratings?.toBuilder();
      _especialidades = $v.especialidades?.toBuilder();
      _nombre = $v.nombre;
      _mostrarWhatsapp = $v.mostrarWhatsapp;
      _whatsapp = $v.whatsapp;
      _instagram = $v.instagram;
      _foto = $v.foto;
      _email = $v.email;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedicosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedicosRecord;
  }

  @override
  void update(void Function(MedicosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedicosRecord build() => _build();

  _$MedicosRecord _build() {
    _$MedicosRecord _$result;
    try {
      _$result = _$v ??
          new _$MedicosRecord._(
              direccion: direccion.build(),
              pagosMovil: _pagosMovil?.build(),
              cuentasBancarias: _cuentasBancarias?.build(),
              cuentaZelle: cuentaZelle.build(),
              citasCreadas: _citasCreadas?.build(),
              rating: rating,
              ubicacion: ubicacion.build(),
              ratings: _ratings?.build(),
              especialidades: _especialidades?.build(),
              nombre: nombre,
              mostrarWhatsapp: mostrarWhatsapp,
              whatsapp: whatsapp,
              instagram: instagram,
              foto: foto,
              email: email,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'direccion';
        direccion.build();
        _$failedField = 'pagosMovil';
        _pagosMovil?.build();
        _$failedField = 'cuentasBancarias';
        _cuentasBancarias?.build();
        _$failedField = 'cuentaZelle';
        cuentaZelle.build();
        _$failedField = 'citasCreadas';
        _citasCreadas?.build();

        _$failedField = 'ubicacion';
        ubicacion.build();
        _$failedField = 'ratings';
        _ratings?.build();
        _$failedField = 'especialidades';
        _especialidades?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MedicosRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
