import 'package:casist2/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:casist2/core/use_cases/use_case.dart';


class ScanCodeUseCase implements UseCase<String, NoParams> {

  ScanCodeUseCase();

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    try {
      final result = await FlutterBarcodeScanner.scanBarcode('#ffffffff', 'Späť', true, ScanMode.QR);
      return Right(result);
    } on PlatformException {
      return Left(ScanFailure());
    } catch (e) {
      return Left(ScanFailure());
    }
  }
}
