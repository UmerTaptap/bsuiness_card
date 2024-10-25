import 'package:business_card_app/config/routes/routes_name.dart';
import 'package:business_card_app/features/home/bloc/home_bloc.dart';
import 'package:business_card_app/features/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';

import '../bloc/home_event.dart';
import 'business_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchVCards());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is VCardOperationSuccess) {
              context.read<HomeBloc>().add(FetchVCards());
            }
          },
          builder: (context, state) {

            print("Home Bloc State: $state");

            // If no cards are available, show a message
            if (state is VCardLoaded && state.vCards.isEmpty) {
              return const Center(
                child: Text('No cards available, please add a card'),
              );
            }

            // If an error occurred, show an error message
            if (state is VCardError) {
              return Center(
                child: Text(state.message),
              );
            }

            // If the cards are still loading, show a loading indicator
            if (state is VCardLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // if only one card is available, show the card
            if (state is VCardLoaded && state.vCards.length == 1) {
              var vCard = state.vCards[0];
              return Center(
                child: BusinessCard(
                  isSingleCard: true,
                  name: vCard.name,
                  jobTitle: vCard.jobTitle,
                  email: vCard.email,
                  phone: vCard.phone,
                  address: vCard.address,
                  profileImageUrl: vCard.profileImageUrl,
                  qrCodeUrl: vCard.qrCodeUrl,
                ),
              );
            }

            // If the cards are available, show the cards
            if (state is VCardLoaded) {
              return Center(
                child: SizedBox(
                  width: double.maxFinite,
                  height: 430,
                  child: CardSwiper(
                    cardsCount: state.vCards.length,
                    cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
                      var vCard = state.vCards[index];
                      return BusinessCard(
                        name: vCard.name,
                        jobTitle: vCard.jobTitle,
                        email: vCard.email,
                        phone: vCard.phone,
                        address: vCard.address,
                        profileImageUrl: vCard.profileImageUrl,
                        qrCodeUrl: vCard.qrCodeUrl,
                      );
                    } ,
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),

          Container(
            margin: MediaQuery.of(context).padding,
            padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(child: Text('My Cards', style: Theme.of(context).textTheme.headlineMedium)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline_rounded),
                  onPressed: (){
                    context.pushNamed(RoutesName.userInfoInput);
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

