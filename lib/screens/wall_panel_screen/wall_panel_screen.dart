import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../components/app_text.dart';
import '../../components/custom_container.dart';
import '../../components/round_button.dart';
import '../../theme/colors.dart';
import '../cart_screen/summary_screen.dart';
import '../cleaning & pest control/bathroom_cleaning/bath_cleaning_bottom_sheet.dart';
import '../home_screen/components/carousel_slider.dart';
import '../painting_wall_screen/components/frequently_asked_questions_widget.dart';
import '../painting_wall_screen/components/reviews_widget.dart';
import 'bedroom_screen.dart';

class WallPanelScreen extends StatefulWidget {
  const WallPanelScreen({super.key, this.id});
  final int? id;

  @override
  State<WallPanelScreen> createState() => _WallPanelScreenState();
}

class _WallPanelScreenState extends State<WallPanelScreen> {
  int count = 0;
  List<String> images = [
    'https://d28pk2nlhhgcne.cloudfront.net/assets/app/uploads/sites/3/2021/11/living-room-decoration-720x533.jpg',
    'https://assets.architecturaldigest.in/photos/62026064b5d9eefa7e4e2ddf/master/pass/How%20to%20furnish%20your%20home%20on%20a%20budget.jpg',
    'https://im.idiva.com/content/2022/Jul/Home-Decor-Tips_Social_62cbd276a8447.jpg',
    'https://i.pinimg.com/236x/ed/20/76/ed207623c091d50b0b94951561e6c0a0.jpg',
    'https://i.pinimg.com/236x/99/84/f2/9984f26d4cea01c8d5c17391b73dac7c.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: count > 0
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                    color: AppColors.transparentColor,
                    child: roundButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SummaryScreen(
                                        onChecked: false,
                                      )));
                        },
                        color: AppColors.lowPurple,
                        title: 'Proceed')),
              )
            : const SizedBox(),
        appBar: AppBar(title: appText('Wall panels', fontSize: 18, fontWeight: FontWeight.bold)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CarouselSliderWidget(
                height: 300,
                images: [
                  'assets/images/cs.jpeg',
                  'assets/images/cs2.jpeg',
                  'assets/images/a.jpeg',
                  'assets/images/aa.jpeg',
                  'assets/images/aaa.jpeg',
                  'assets/images/aaaa.jpeg',
                  'assets/images/aaaaa.jpeg',
                  'assets/images/aaaaaa.jpeg',
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText('Wall panels', fontSize: 20, fontWeight: FontWeight.bold),
                      const SizedBox(height: 6),
                      Row(
                        spacing: 6,
                        children: [
                          const Icon(Icons.star, size: 18),
                          appText('4.81'),
                          appText('(8k bookings)'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText('At-home consulatation', fontSize: 20, fontWeight: FontWeight.bold),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count == 0) {
                                    count = 1;
                                  }
                                });
                              },
                              child: count > 0
                                  ? Container(
                                      height: 36,
                                      width: 76,
                                      decoration: BoxDecoration(
                                          color: AppColors.lowPurple.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: AppColors.lowPurple)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (count > 0) {
                                                    count--;
                                                  }
                                                });
                                              },
                                              child: const Icon(Icons.remove, size: 16, color: AppColors.lowPurple)),
                                          appText(count.toString(),
                                              color: AppColors.lowPurple, fontSize: 16, fontWeight: FontWeight.bold),
                                          InkWell(
                                              onTap: () {},
                                              child: Icon(Icons.add,
                                                  size: 16, color: AppColors.hintGrey.withOpacity(0.3))),
                                        ],
                                      ))
                                  : Container(
                                      height: 36,
                                      width: 76,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: AppColors.grey300)),
                                      child: Center(
                                          child:
                                              appText('Add', fontWeight: FontWeight.bold, color: AppColors.lowPurple))))
                        ],
                      ),
                      Row(
                        spacing: 6,
                        children: [
                          const Icon(Icons.star, size: 18),
                          appText('4.81'),
                          appText('(8k bookings)'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        spacing: 6,
                        children: [
                          appText('Rs. 49', fontWeight: FontWeight.bold),
                          const SizedBox(width: 6),
                          const Icon(Icons.circle, size: 6),
                          appText('60 mins'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const SizedBox(height: 20),
                    ],
                  )),
              Container(
                  width: double.maxFinite,
                  color: AppColors.grey300.withOpacity(0.4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            appText("Just choose a look,\nwe'll do the rest.",
                                fontSize: 20, fontWeight: FontWeight.bold),
                            const SizedBox(height: 10),
                            myRow(
                                icon: const Icon(Icons.account_circle_rounded),
                                title: 'Finalize panel samples at home'),
                            const SizedBox(height: 8),
                            myRow(
                                icon: Image.asset('assets/images/delivery.png', height: 24),
                                title: '2-day panel delivery'),
                            const SizedBox(height: 8),
                            myRow(
                                icon: Image.asset('assets/images/hammer.png', height: 24),
                                title: '6-hour installation'),
                          ]),
                        ),
                        const SizedBox(height: 20),
                        // Gridview
                        MasonryGridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: images.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(images[index], fit: BoxFit.cover)));
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomContainer(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BedroomScreen()));
                            },
                            height: 55,
                            width: double.maxFinite,
                            borderRadius: 10,
                            color: AppColors.whiteTheme,
                            borderColor: AppColors.grey300,
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                appText('Explore all looks', fontSize: 18, fontWeight: FontWeight.bold),
                                const Icon(Icons.arrow_right_alt)
                              ],
                            ))
                      ],
                    ),
                  )),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText('Beautiful.', fontSize: 24, fontWeight: FontWeight.bold),
                    appText('And build to last.', fontSize: 24, fontWeight: FontWeight.bold),
                    const SizedBox(height: 10),
                    myRow(icon: const Icon(Icons.water_drop), title: 'Water & seepage proof'),
                    const SizedBox(height: 10),
                    myRow(icon: const Icon(Icons.bug_report), title: 'Termite proof'),
                    const SizedBox(height: 10),
                    myRow(icon: const Icon(Icons.verified_outlined), title: '1-year warranty'),
                    const SizedBox(height: 30),
                    Container(
                      height: 350,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://www.coowinwpc.com/wp-content/uploads/2024/04/WPC-Decorative-Wall-with-Built-in-Lighting.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 40),
                    appText('Panels for every space', fontSize: 24, fontWeight: FontWeight.bold),
                    const SizedBox(height: 20),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          height: 350,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.coowinwpc.com/wp-content/uploads/2024/04/WPC-Decorative-Wall-with-Built-in-Lighting.jpg'),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
                                appText('Elevate the heart\nof your home',
                                    fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.whiteTheme),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CustomContainer(
                                        onTap: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => const BedroomScreen()));
                                        },
                                        margin: const EdgeInsets.only(top: 200, left: 16),
                                        height: 44,
                                        width: 200,
                                        borderRadius: 10,
                                        color: AppColors.whiteTheme,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            appText('Living room looks', fontSize: 18, fontWeight: FontWeight.bold),
                                            const Icon(Icons.arrow_right_alt),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Divider(thickness: 8, color: AppColors.grey300),
                    const SizedBox(height: 30),
                    appText('Celebrity home makeovers', fontSize: 24, fontWeight: FontWeight.bold),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://artriva.com/media/k2/items/cache/c889234799e865bbe90cee71f6cd2e53_XL.jpg'),
                                    fit: BoxFit.cover),
                                color: AppColors.grey300,
                                borderRadius: BorderRadius.circular(10)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  appText('Shoaib', color: AppColors.whiteTheme),
                                  appText('Multan', color: AppColors.whiteTheme, fontSize: 8),
                                  const SizedBox(height: 10)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(thickness: 8, color: AppColors.grey300),
                    const SizedBox(height: 20),
                    appText('Included in the service', fontSize: 24, fontWeight: FontWeight.bold),
                    const SizedBox(height: 20),
                    suggestinRow('Delivery & Installation of panels'),
                    const SizedBox(height: 10),
                    suggestinRow('Shifting of furniture during service'),
                    const SizedBox(height: 10),
                    suggestinRow('Post-service cleanup'),
                    const SizedBox(height: 30),
                    appText('Excluded', fontSize: 24, fontWeight: FontWeight.bold),
                    const SizedBox(height: 20),
                    myRow(
                        icon: Icon(
                          Icons.cancel,
                          color: AppColors.hintGrey,
                        ),
                        title: 'Panel installation on exterior walls,\n furniture, door & ceiling.'),
                    const SizedBox(height: 10),
                    myRow(
                        icon: Icon(
                          Icons.cancel,
                          color: AppColors.hintGrey,
                        ),
                        title: 'Unmounting & mounting of TV, AC, Shelves,\nwall hangig, light fixtures etc.'),
                    const SizedBox(height: 10),
                    myRow(
                        icon: Icon(
                          Icons.cancel,
                          color: AppColors.hintGrey,
                        ),
                        title: 'Any carpenter work - Repair or making\nfurniture, shelves, drawers, TV unit etc.'),
                    const SizedBox(height: 30),
                    Divider(thickness: 8, color: AppColors.grey300),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              // 20, 000
              Container(
                  width: double.maxFinite,
                  color: AppColors.grey300.withOpacity(0.4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            appText("20,000+ spaces,\ntransformed.", fontSize: 24, fontWeight: FontWeight.bold),
                            const SizedBox(height: 10),
                          ]),
                        ),
                        const SizedBox(height: 20),
                        // Gridview
                        MasonryGridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: images.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(2),
                                        child: Image.network(images[index], fit: BoxFit.cover)),
                                    const SizedBox(height: 10),
                                    appText('Shoaib', fontSize: 16, fontWeight: FontWeight.w600),
                                    Row(
                                      spacing: 8,
                                      children: [
                                        appText('Rs.1200',
                                            fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.hintGrey),
                                        Icon(
                                          Icons.circle,
                                          size: 4,
                                          color: AppColors.hintGrey,
                                        ),
                                        appText('WPC Panels', color: AppColors.hintGrey)
                                      ],
                                    ),
                                  ],
                                ));
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomContainer(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BedroomScreen()));
                            },
                            height: 55,
                            width: double.maxFinite,
                            borderRadius: 10,
                            color: AppColors.whiteTheme,
                            borderColor: AppColors.grey300,
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                appText('See all', fontSize: 18, fontWeight: FontWeight.bold),
                                const Icon(Icons.arrow_right_alt)
                              ],
                            ))
                      ],
                    ),
                  )),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // const FrequentlyAskedQuestionsWidget(),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const Column(
                          children: [
                            FAQsComponent(
                              question: 'Hello! dear, What is your name?',
                              answer: 'Hey there! My name is Muhammad Shoaib. What is your name?',
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                    Divider(thickness: 8, color: AppColors.grey300),
                    const SizedBox(height: 30),
                    appText('Share this service with your loved ones', color: AppColors.hintGrey, fontSize: 18),
                    const SizedBox(height: 6),
                    CustomContainer(
                        onTap: () {},
                        height: 50,
                        width: double.maxFinite,
                        borderRadius: 8,
                        borderColor: AppColors.grey300,
                        color: AppColors.whiteTheme,
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appText('Share', fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.lowPurple),
                            const Icon(
                              Icons.share,
                              size: 18,
                              color: AppColors.lowPurple,
                            )
                          ],
                        )),
                    const SizedBox(height: 30),
                    const ReviewsWidget()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

// Row Widget
Widget myRow({required Widget icon, required String title}) {
  return Row(
    spacing: 20,
    children: [icon, appText(title, fontSize: 16)],
  );
}
