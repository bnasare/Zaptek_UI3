import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/widgets/promo_widget.dart';

import '../consts/img_consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Image.asset('assets/images/circle.png'),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to', style: theme.bodySmall),
            const SizedBox(height: 5),
            Text('Sample Restaurant', style: theme.bodyLarge),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: color.background.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/more.svg'),
                const SizedBox(width: 8),
                SvgPicture.asset('assets/images/divider.svg'),
                const SizedBox(width: 8),
                SvgPicture.asset('assets/images/close.svg'),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                children: images.asMap().entries.map((entry) {
                  final index = entry.key;
                  final image = entry.value;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: index == _current ? 0.0 : 10.0,
                    ),
                    child: Image.asset(image, fit: BoxFit.fill),
                  );
                }).toList(),
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: _current == index ? 23 : 15,
                        height: 2,
                        color: _current == index
                            ? color.secondary
                            : color.background.withOpacity(0.2),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: double.infinity,
              height: 154,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      Image.asset('assets/images/store.png'),
                      const SizedBox(height: 12),
                      Text('Store pickup', style: theme.bodyMedium),
                      const SizedBox(height: 3),
                      Text('Best quality', style: theme.bodySmall)
                    ],
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: SizedBox(
                      width: 60.0,
                      child: Divider(
                        color: color.background.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 15),
                      Image.asset('assets/images/delivery.png'),
                      const SizedBox(height: 12),
                      Text('Delivery', style: theme.bodyMedium),
                      const SizedBox(height: 3),
                      Text('Always on time', style: theme.bodySmall)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              height: 144,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Online reservation', style: theme.bodyMedium),
                            Text('Table booking', style: theme.bodySmall)
                          ],
                        ),
                        Image.asset('assets/images/reservation.png')
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: color.secondary)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: color.secondary,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Reserve a table',
                                style: theme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: color.secondary)),
                          child: Center(
                            child: Text(
                              'My reservations',
                              style: theme.labelMedium,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text('Promotion campaign', style: theme.bodyLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
                children: List.generate(promoInfo.length, (index) {
                  return PromoWidget(
                    discount: promoInfo[index]['discount'],
                    imgPath: promoInfo[index]['imgPath'],
                    date: promoInfo[index]['date'],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
