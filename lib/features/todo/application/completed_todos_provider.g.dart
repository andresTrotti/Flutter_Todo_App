// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(completedTodosCount)
final completedTodosCountProvider = CompletedTodosCountProvider._();

final class CompletedTodosCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  CompletedTodosCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completedTodosCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completedTodosCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return completedTodosCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$completedTodosCountHash() =>
    r'68251cc9613c1ea0ff77b3f64a8562f91a1b22a5';
