import 'package:casist2/domain/entities/agenda.dart';
import 'package:casist2/domain/entities/company.dart';

abstract class ConfRepository {

  Future<List<Company>> searchCompanies(Agenda agenda);

}