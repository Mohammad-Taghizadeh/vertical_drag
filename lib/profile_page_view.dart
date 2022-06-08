import 'package:flutter/material.dart';
import 'package:vertical_drag/model/profile.dart';
import 'package:vertical_drag/widget/two_line_item.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);



  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final PageController pageController = PageController();
  double opacity = .5;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: profiles.length,
          controller: pageController,
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index){
            setState((){
              currentIndex = index;
            });
          },
          itemBuilder: (c,i) => Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(profiles[i].imagePath!,
               fit: BoxFit.cover,colorBlendMode: BlendMode.hue,color: Colors.black,),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(opacity),Colors.white.withOpacity(opacity),Colors.black.withOpacity(opacity)],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: ProfileDetails(index: currentIndex),
        ),
      ],
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key,required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TwoLineItem(
          firstText: profiles[index].follower.toString(),
          secondText: "followers",
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        TwoLineItem(
          firstText: profiles[index].posts.toString(),
          secondText: "posts",
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        TwoLineItem(
          firstText: profiles[index].following.toString(),
          secondText: "following",
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
      ],
    );
  }
}
