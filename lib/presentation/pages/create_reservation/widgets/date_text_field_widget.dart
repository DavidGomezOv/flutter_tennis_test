import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/core/extensions/generic_extensions.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';

class DateTextFieldWidget extends StatelessWidget {
  const DateTextFieldWidget({
    super.key,
    required this.reservationDateController,
  });

  final TextEditingController reservationDateController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: TextField(
        controller: reservationDateController,
        decoration: InputDecoration(
          labelText: 'Select reservation date',
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: const Icon(Icons.date_range),
        ),
        readOnly: true,
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          showDateTimePicker(context: context).then((value) {
            if (value != null) {
              reservationDateController.text = value.formatDateWithHour();
              context
                  .read<CreateReservationBloc>()
                  .add(UpdateValuesEvent(reservationDate: value));
              context
                  .read<CreateReservationBloc>()
                  .add(LoadWeatherReportEvent());
            }
          });
        },
      ),
    );
  }
}

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
}) async {
  late DateTime? selectedDate;

  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2023, 12, 31),
  ).then((value) async {
    if (value != null) {
      selectedDate = value;

      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate!),
      );

      return selectedTime == null
          ? selectedDate
          : DateTime(
              selectedDate!.year,
              selectedDate!.month,
              selectedDate!.day,
              selectedTime.hour,
              selectedTime.minute,
            );
    }
    return null;
  });
}
