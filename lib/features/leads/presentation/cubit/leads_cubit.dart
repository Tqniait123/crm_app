import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'leads_state.dart';

class LeadsCubit extends Cubit<LeadsState> {
  LeadsCubit() : super(LeadsInitial());
}
