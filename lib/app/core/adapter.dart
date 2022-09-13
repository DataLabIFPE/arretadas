import 'package:flutter_triple/flutter_triple.dart';
import 'package:fpdart/fpdart.dart';

class EitherAdapterImpl<L, R> implements EitherAdapter<L, R> {
  // receive an usecase in constructor
  final Either<L, R> usecase;

  EitherAdapterImpl(this.usecase);

  @override
  T fold<T>(T Function(L l) leftF, T Function(R r) rightF) {
    return usecase.fold(leftF, rightF);
  }

  // Adapter Future Either(Dartz) to Future EitherAdapter(Triple)
  static Future<EitherAdapter<L, R>> adapter<L, R>(
      Future<Either<L, R>> usecase) {
    return usecase.then((value) => EitherAdapterImpl(value));
  }
}
