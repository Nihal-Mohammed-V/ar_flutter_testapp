import 'package:ar_flutter/models/card_models.dart';
import 'package:ar_flutter/screens/ar_objects_screen.dart';
import 'package:ar_flutter/utils/colors.dart';
import 'package:ar_flutter/widgets/appbar.dart';
import 'package:ar_flutter/widgets/button.dart';
import 'package:flutter/material.dart';
import '../utils/sizes.dart';
import '../widgets/rounded_container.dart';

class ObjectsDetailScreen extends StatelessWidget {
  const ObjectsDetailScreen({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AAppBar(showBackArrow: true, title: Text('AR Object Details')),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(ASizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ASizes.spaceBtwItems),

              // Image
              Center(
                child: ARoundedContainer(
                  child: Image.asset(
                    card.image,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
              ),
              SizedBox(height: ASizes.xs),

              // Title
              Center(
                child: Text(
                  card.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: ASizes.spaceBtwItems),

              // Description
              Center(
                child: ARoundedContainer(
                  bgColor: AColors.secondaryVariant,
                  padding: const EdgeInsets.all(ASizes.defaultSpace),
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description Text
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: ASizes.spaceBtwItems),
                      // Description
                      Text(
                        card.description,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              // View in 3D button
              Center(
                child: AButtonWidget(
                  bgColor: AColors.buttonColor,
                  icon: Icons.threed_rotation,
                  text: 'View in 3D',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AR3DObjectsScreen(card: card),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
