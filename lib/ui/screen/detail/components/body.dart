import 'package:e_commerce/ui/widget/material_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/appbar.dart';

class BodyDetail extends StatefulWidget {
  BodyDetail({Key? key, required this.imagePaths, required this.description,required this.title, required this.rating}) : super(key: key);
  final List<String> imagePaths;
  final String description;
  final String title;
  final String rating;
  @override
  _BodyDetailState createState() => _BodyDetailState();
}

class _BodyDetailState extends State<BodyDetail> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          SizedBox(
            height: height / 2+50,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _index = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.imagePaths[index]),
                      // fit: BoxFit.cover
                    ),
                  ),
                );
              },
            ),
          ),
          AppBarDetail(width: width,rating: widget.rating,),
          Positioned(
            top: height/2-20,
            child: SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: widget.imagePaths.length,
                    effect: WormEffect(
                      dotHeight: 15,
                      dotWidth: 20,
                      activeDotColor: Theme.of(context).colorScheme.primary,
                      dotColor: Theme.of(context).colorScheme.secondary
                    ),
                    onDotClicked: (index) {
                      _controller.animateToPage(
                        index,
                        duration:const Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height/2,
            child: Container(
              height: height/2,
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:10,right: 10,top: 30),
                child: Column(
                  children: [
                    Text(widget.title,style: Theme.of(context).textTheme.bodyLarge,maxLines: 2,),
                    const SizedBox(height: 30,),
                    Text(widget.description,style: Theme.of(context).textTheme.bodySmall,maxLines: 7,overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height - 200,
            child: Container(
              height: 200,
              width: width,
              padding: const EdgeInsets.only(left: 50, right: 50),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HMaterialButton(function: (){}, text: 'Add to card')
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}