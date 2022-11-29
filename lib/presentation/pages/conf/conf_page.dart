import 'package:casist2/core/routes_generator.dart';
import 'package:casist2/core/toaster.dart';
import 'package:casist2/data/models/agenda.dart';
import 'package:casist2/data/models/company.dart';
import 'package:casist2/domain/entities/agenda.dart';
import 'package:casist2/domain/entities/company.dart';
import 'package:casist2/domain/entities/user.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_bloc.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_event.dart';
import 'package:casist2/presentation/pages/conf/bloc/conf_state.dart';
import 'package:casist2/presentation/pages/conf/conf_view.dart';
import 'package:casist2/presentation/widgets/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfPage extends StatefulWidget {
  final User _user;

  const ConfPage(User user, {
    super.key,
  }): _user = user;

  @override
  State<ConfPage> createState() => _ConfPageState();
}

class _ConfPageState extends State<ConfPage> {
  late List<Company> companies;
  late List<Agenda> agendas;

  @override
  void initState() {
    super.initState();
    agendas = widget._user.agendas;
    companies = [];
  }

  void _dispatchScanEvent() {
    BlocProvider.of<ConfBloc>(context).add(
      ConfScanEvent()
    );
  }

  void _dispatchSaveConfEvent() {
    BlocProvider.of<ConfBloc>(context).add(
      ConfSaveEvent(
        user: widget._user
      )
    );
  }

  void _dispatchAgendaSelectedEvent (Agenda agenda) {
    BlocProvider.of<ConfBloc>(context).add(
      ConfAgendaSelectedEvent(
        agenda: agenda
      )
    );
  }

  void _onCompanySelected(Company company) {
    widget._user.company = company;
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
    return Scaffold(
      floatingActionButton: _scanFloatingButton(),
      body: BlocConsumer<ConfBloc, ConfState>(
        listener: (BuildContext context, ConfState state) {
          if (state is ConfScannedState) {
          } else if (state is ConfAgendaSelectedState) {
            widget._user.currentAgenda = state.agenda;
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
              dispatchSearchCompaniesEvent: _dispatchAgendaSelectedEvent,
            );
          }
          return const ErrorStateView();
        }
      ),
    );
  }
}
