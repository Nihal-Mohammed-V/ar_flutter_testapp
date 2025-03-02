import 'package:ar_flutter/models/card_models.dart';
import 'package:ar_flutter/utils/colors.dart';
import 'package:ar_flutter/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class AR3DObjectsScreen extends StatelessWidget {
  const AR3DObjectsScreen({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AAppBar(
        title: Text(
          '${card.title} 3D Model',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        showBackArrow: true,
      ),
      // Body
      body: Center(
        // 3D model
        child: ModelViewer(
          backgroundColor: AColors.secondary,
          src: card.object,
          alt: "${card.title} 3D model",
          ar: true,
          arModes: ['scene-viewer', 'webxr', 'quick-look'],
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      ),
    );
  }
}
