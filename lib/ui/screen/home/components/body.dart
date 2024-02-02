import 'package:e_commerce/data/category_data.dart';
import 'package:e_commerce/data/helper/route.dart';
import 'package:e_commerce/ui/AdminPanel/screen/additem/additem.dart';
import 'package:e_commerce/ui/screen/home/components/iteam_card.dart';
import 'package:e_commerce/ui/screen/home/components/notificatioin_button.dart';
import 'package:e_commerce/ui/screen/home/components/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category.dart';
import 'icon_button.dart';
class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}
class _BodyHomeState extends State<BodyHome> {
  final TextEditingController controller = TextEditingController();
  final _database = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              //appbar
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width-160,
                      child: AppBarHomeSearch(controller: controller),
                    ),
                    AppBarHomeButton(notificationCount: 1 ,onPressed: (){
                      Get.to(()=> const AddItem());
                    },asset: 'assets/icons/Cart Icon.svg',),
                    AppBarHomeButton(notificationCount: 2, onPressed:()async{
                      await FirebaseAuth.instance.signOut();
                      Get.offAllNamed(AppRoutes.signin);
                    },asset: 'assets/icons/Bell.svg',),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //baner
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: ClipRRect(
                  borderRadius:const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/03/32/95/71/240_F_332957101_NV588R5pQUyusBU22Wvzqqhq3E7pOPwb.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              //row button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonHome(
                    asset: 'assets/icons/Flash Icon.svg',
                    title: 'Flash \n Deal',
                    onTab: (){},
                  ),
                  IconButtonHome(
                    asset: 'assets/icons/Bill Icon.svg',
                    title: 'Bill',
                    onTab: (){},
                  ),
                  IconButtonHome(
                    asset: 'assets/icons/Game Icon.svg',
                    title: 'Game',
                    onTab: (){},
                  ),
                  IconButtonHome(
                    asset: 'assets/icons/Gift Icon.svg',
                    title: 'Daily \n Gift',
                    onTab: (){},
                  ),
                  IconButtonHome(
                    asset: 'assets/icons/Discover.svg',
                    title: 'More',
                    onTab: (){},
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category',style: Theme.of(context).textTheme.headlineSmall,),
                  TextButton(onPressed: (){}, child:const Text('See More'))
                ],
              ),
              const SizedBox(height: 10,),
              //categories slide
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  itemBuilder: (context, index) {
                   final data = categoryData[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CategorySlide(
                        asset:data['asset'],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Products',style: Theme.of(context).textTheme.headlineSmall,),
                  TextButton(onPressed: (){}, child:const Text('See More'))
                ],
              ),
              const SizedBox(height: 10,),
              //list items
              SizedBox(
                height: 225,
                child: StreamBuilder<DatabaseEvent>(
                  stream: _database.ref().child('items').onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    final data = snapshot.data!.snapshot.value;
                    final items = data as Map<Object?, Object?>;
                    final itemList = items.keys.toList();
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        final itemMap = items[itemList[index]] as Map<Object?, Object?>;
                        final subImage = itemMap['subImage'] as List<Object?>;
                        final stringsubImage = subImage.map((element) => element.toString()).toList();
                        return IteamsCard(
                          mainImage: itemMap['mainImage'].toString(), 
                          title: itemMap['title'].toString(), 
                          price: itemMap['price'].toString(), 
                          lover: itemMap['loved'] as bool, 
                          imagePaths: stringsubImage, 
                          description: itemMap['subTitle'].toString(), 
                          rating: itemMap['rating'].toString(), 
                          index: index
                        );
                      },
                    );
                  },
                )
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}