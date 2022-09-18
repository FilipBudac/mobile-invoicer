import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';

abstract class ConfRepository {

  Future<List<Company>> searchCompanies(Agenda agenda);

}