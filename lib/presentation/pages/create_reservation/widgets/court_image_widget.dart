import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tennis_test/presentation/pages/create_reservation/bloc/create_reservation_bloc.dart';

class CourtImageWidget extends StatelessWidget {
  const CourtImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReservationBloc, CreateReservationState>(
      builder: (context, state) {
        String imageSrc = '';
        if (state is UpdateValuesState) {
          imageSrc = state.reservationModel.courtImageUrl;
        } else if (state is LoadedCourtsState) {
          imageSrc = state.courts.first.imageUrl;
        }
        return imageSrc.isEmpty
            ? Container(
                height: 180,
                color: Colors.grey,
              )
            : Image.network(
                imageSrc,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return Center(
                      child: SizedBox(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: child,
                        ),
                      ),
                    );
                  }
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );
      },
    );
  }
}
