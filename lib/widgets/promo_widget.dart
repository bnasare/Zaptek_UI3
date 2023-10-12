import 'package:flutter/material.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({
    Key? key,
    required this.discount,
    required this.date,
    required this.imgPath,
  }) : super(key: key);

  final String discount, date, imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset(
                imgPath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                discount,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
