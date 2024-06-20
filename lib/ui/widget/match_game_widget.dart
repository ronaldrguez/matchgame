import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchgame/bloc/match_game/match_game_bloc.dart';
import 'package:matchgame/models/image_game.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/ui/widget/clock_backwards_widget.dart';

class MatchGameWidget extends StatefulWidget {
  final MatchGame matchGame;

  const MatchGameWidget({super.key, required this.matchGame});

  @override
  State<StatefulWidget> createState() => _MatchGameWidgetState();
}

class _MatchGameWidgetState extends State<MatchGameWidget> {
  late MatchGameBloc bloc;
  late Timer timer;

  @override
  void initState() {
    bloc = context.read<MatchGameBloc>();
    timer = Timer(const Duration(seconds: 3), () {
      bloc.add(HideImageEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchGameBloc, MatchGameState>(
        bloc: bloc,
        buildWhen: (previous, current) {
          if (current is InMatchGameState && previous is InMatchGameState) {
            if (current.matchGame.errors != previous.matchGame.errors) {
              const snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text("These images aren't equals"),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                snackBar,
              );
            }
          }
          return true;
        },
        builder: (context, state) {
          return Column(
            children: [
              const ClockBackwardsWidget(),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.matchGame.images.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100.w,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return ImageGameWidget(
                      imageGame: widget.matchGame.images.elementAt(index),
                    );
                  }),
            ],
          );
        });
  }
}

class ImageGameWidget extends StatefulWidget {
  final ImageGame imageGame;

  const ImageGameWidget({
    super.key,
    required this.imageGame,
  });

  @override
  State<StatefulWidget> createState() => _ImageGameWidgetState();
}

class _ImageGameWidgetState extends State<ImageGameWidget> {
  late bool clicked;
  late Timer timer;
  late MatchGameBloc bloc;

  @override
  void initState() {
    timer = Timer(Duration.zero, () {});
    clicked = false;
    bloc = context.read<MatchGameBloc>();
    super.initState();
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.imageGame.isShow,
      child: GestureDetector(
        onTap: () {
            clicked = !clicked;
            bloc.add(ChoosingImageEvent(widget.imageGame));
            timer = Timer(const Duration(seconds: 4), () {
              if(!widget.imageGame.isShow) {
                clicked = !clicked;
                if (bloc.state is InMatchGameState) {
                  bloc.add(ExpiringImageRevealEvent(widget.imageGame));
                }
              }
              setState(() {});
            });
            setState(() {});
        },
        child: Card(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: 15.h,
            width: 15.w,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
                color: clicked || widget.imageGame.isShow
                    ? Theme.of(context).hoverColor
                    : Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                widget.imageGame.symbol,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
