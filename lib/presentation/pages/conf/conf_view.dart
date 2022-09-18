import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/presentation/widgets/autocomplete_input_field.dart';
import 'package:casist2/presentation/widgets/headings.dart';
import 'package:casist2/presentation/widgets/loading_button.dart';
import 'package:flutter/material.dart';

class ConfView extends StatelessWidget {
  final List<Agenda> _agendas;
  final void Function() _dispatchSaveEvent;
  final void Function(Agenda)? _dispatchSearchCompaniesEvent;
  final void Function(Company)? _onCompanySelected;
  final List<Company> _companies;

  const ConfView({
    super.key,
    required List<Agenda> agendas,
    required void Function() dispatchSaveEvent,
    required void Function(Agenda)? dispatchSearchCompaniesEvent,
    required void Function(Company)? onCompanySelected,
    required List<Company> companies,
  }): _agendas = agendas,
      _dispatchSearchCompaniesEvent = dispatchSearchCompaniesEvent,
      _onCompanySelected = onCompanySelected,
      _dispatchSaveEvent = dispatchSaveEvent,
      _companies = companies;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 15,
            children: [
              Image.asset("assets/images/casist_logo.png"),
              const Heading2("Zvoľte agendu a firmu", bold: FontWeight.w700)
            ],
          ),
          AutocompleteInputField(
            optionsBuilder: (TextEditingValue value) {
              return _agendas
                  .where((Agenda agenda) => agenda.firma.toLowerCase()
                  .contains(value.text.toLowerCase()));
            },
            displayStringForOption: (Agenda agenda) => agenda.firma,
            onSelected: _dispatchSearchCompaniesEvent,
          ),
          AutocompleteInputField(
            optionsBuilder: (TextEditingValue value) {
              if (_companies.isEmpty) {
                return const Iterable<Company>.empty();
              }
              return _companies
                  .where((Company company) => company.company.toLowerCase()
                  .contains(value.text.toLowerCase()));
            },
            displayStringForOption: (Company company) => company.company,
            onSelected: _onCompanySelected,
          ),
          LoadingButton(
            title: "Uložiť".toUpperCase(),
            icon: Icons.input,
            onPressed: _dispatchSaveEvent,
          ),
        ],
      ),
    );
  }
}
