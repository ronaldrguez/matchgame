import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchgame/bloc/choose/choose_bloc.dart';
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
  late Set<ImageGame> chosen;
  late MatchGameBloc bloc;
  late ChooseBloc chooseBloc;
  late bool isComparing;

  @override
  void initState() {
    chosen = {};
    isComparing = false;
    bloc = context.read<MatchGameBloc>();
    chooseBloc = context.read<ChooseBloc>();
    Timer(const Duration(seconds: 3), () {
      bloc.add(HideImagesEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseBloc, ChooseState>(
        bloc: chooseBloc,
        buildWhen: (previous, current) {
          if(current is UnChooseState) {
            isComparing = false;
          }
          if (current is InChooseState) {
            if (!current.comparison) {
              const snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text("These images aren't equals"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar,);
            }
          }
          return true;
        },
        builder: (context, state) {
          if (state is InChooseState) {
            chooseBloc.add(ResetChoose());
            bloc.add(MatchingImagesEvent(
                [state.option1, state.option2], state.comparison));
          }
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
                      isBlockingAction: isComparing,
                      onShow: (value) {
                        if (state is UnChooseState) {
                          chooseBloc
                              .add(ChoosingFirstImageEvent(option1: value));
                        } else if (state is InFirstChooseState) {
                          if (state.option1.id != value.id) {
                            isComparing = true;
                            chooseBloc.add(
                                ChoosingSecondImageEvent(option2: value));
                          }
                        }
                        setState(() {});
                      },
                    );
                  }),
            ],
          );
        });
  }
}

class ImageGameWidget extends StatefulWidget {
  final ImageGame imageGame;
  final bool isBlockingAction;
  final Function(ImageGame value) onShow;

  const ImageGameWidget({
    super.key,
    required this.imageGame,
    required this.onShow,
    required this.isBlockingAction,
  });

  @override
  State<StatefulWidget> createState() => _ImageGameWidgetState();
}

class _ImageGameWidgetState extends State<ImageGameWidget> {
  late bool clicked;
  late Timer timer;
  late ChooseBloc bloc;

  @override
  void initState() {
    timer = Timer(Duration.zero, () {});
    clicked = false;
    bloc = context.read<ChooseBloc>();
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
      absorbing: widget.isBlockingAction,
      child: GestureDetector(
        onTap: () {
          clicked = !clicked;
          widget.onShow.call(widget.imageGame);
          timer = Timer(const Duration(seconds: 4), () {
            clicked = !clicked;
            if (bloc.state is InFirstChooseState) {
              bloc.add(ResetChoose());
            }
            setState(() {});
          });
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
