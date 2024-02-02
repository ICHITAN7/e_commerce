import 'package:e_commerce/ui/screen/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IteamsCard extends StatefulWidget {
  const IteamsCard({
    Key? key,
    required this.mainImage,
    required this.title,
    required this.price,
    required this.lover, 
    required this.imagePaths, 
    required this.description, 
    required this.rating, 
    required this.index,
  }) : super(key: key);

  final String mainImage;
  final String title;
  final String price;
  final bool lover;
  final List<String> imagePaths;
  final String description;
  final String rating;
  final int index;

  @override
  State<IteamsCard> createState() => _IteamsCardState();
}

class _IteamsCardState extends State<IteamsCard> {
  bool _isLoved = false;

  @override
  void initState() {
    super.initState();
    _isLoved = widget.lover;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(bottom: 5,right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset:const Offset(2, 2),
            blurRadius: 2,
          ),
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Get.to(()=>DetailScreen(
                imagePaths: widget.imagePaths,
                description: widget.description,
                rating: widget.rating,
                title: widget.title,
              )
            );
            },
            child: SizedBox(
              width: 160,
              height: 130,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(widget.mainImage, fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${widget.price} \$',
                  style: Theme.of(context).textTheme.titleMedium),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                onTap: () {
                  setState(() {
                    _isLoved = !_isLoved;
                    print(_isLoved.toString());
                  });
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: _isLoved
                      ? SvgPicture.asset('assets/icons/Heart Icon_2.svg',
                          color: Colors.red)
                      : SvgPicture.asset('assets/icons/Heart Icon.svg',
                          color: Colors.red),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
