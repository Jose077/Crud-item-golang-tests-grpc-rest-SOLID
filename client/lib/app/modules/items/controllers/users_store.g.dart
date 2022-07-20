// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$listUsersFutureAtom =
      Atom(name: '_UserStore.listUsersFuture', context: context);

  @override
  ObservableFuture<List<User>>? get listUsersFuture {
    _$listUsersFutureAtom.reportRead();
    return super.listUsersFuture;
  }

  @override
  set listUsersFuture(ObservableFuture<List<User>>? value) {
    _$listUsersFutureAtom.reportWrite(value, super.listUsersFuture, () {
      super.listUsersFuture = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  Future<dynamic> fetchUsersDataHttp() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.fetchUsersDataHttp');
    try {
      return super.fetchUsersDataHttp();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchUsersDataDio() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.fetchUsersDataDio');
    try {
      return super.fetchUsersDataDio();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listUsersFuture: ${listUsersFuture}
    ''';
  }
}
