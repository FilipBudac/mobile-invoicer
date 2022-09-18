import 'package:casist2/core/routes_generator.dart';
import 'package:casist2/core/toaster.dart';
import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/data/models/user.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_bloc.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_event.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_state.dart';
import 'package:casist2/presentation/pages/conf/conf_view.dart';
import 'package:casist2/presentation/widgets/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfPage extends StatefulWidget {
  final User user;

  const ConfPage({
    super.key,
    required this.user
  });

  @override
  State<ConfPage> createState() => _ConfPageState();
}

class _ConfPageState extends State<ConfPage> {

  void _dispatchScanEvent() {
    BlocProvider.of<ConfBloc>(context).add(
      ConfScanEvent()
    );
  }

  void _dispatchSaveConfEvent() {
    BlocProvider.of<ConfBloc>(context).add(
      ConfSaveEvent(
        user: widget.user
      )
    );
  }

  void _dispatchSearchCompaniesEvent (Agenda agenda) {
    BlocProvider.of<ConfBloc>(context).add(
      ConfSearchCompaniesEvent(
        agenda: agenda
      )
    );
  }

  void _onCompanySelected(Company company) {
    widget.user.company = company;
  }

  Widget _scanFloatingButton () {
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        onPressed: _dispatchScanEvent,
        backgroundColor: const Color(0xff364ea1),
        child: const Icon(Icons.scanner, size: 25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Agenda> agendas = widget.user.agendas;
    List<Company> companies = [];

    return Scaffold(
      floatingActionButton: _scanFloatingButton(),
      body: BlocConsumer<ConfBloc, ConfState>(
        listener: (BuildContext context, ConfState state) {
          if (state is ConfScannedState) {
          } else if (state is ConfAgendaSelectedState) {
            widget.user.currentAgenda = state.agenda;
            companies = state.companies;
            Toaster.success(context, state.message);
          } else if (state is ConfFinishedState) {
            RoutesNavigator.push(Routes.home, state.user);
          } else if (state is ConfErrorState) {
            Toaster.error(context, state.error);
          } else if (state is ConfUnauthorizedState) {
            RoutesNavigator.push(Routes.signin);
          }
        },
        builder: (BuildContext context, ConfState state) {
          if (
            state is ConfInitialState ||
            state is ConfAgendaSelectedState ||
            state is ConfProcessingState ||
            state is ConfErrorState
          ) {
            return ConfView(
              agendas: agendas,
              companies: companies,
              onCompanySelected: _onCompanySelected,
              dispatchSaveEvent: _dispatchSaveConfEvent,
              dispatchSearchCompaniesEvent: _dispatchSearchCompaniesEvent,
            );
          }
          return const ErrorStateView();
        }
      ),
    );
  }
}
