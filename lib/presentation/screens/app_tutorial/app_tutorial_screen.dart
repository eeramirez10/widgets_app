import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Ex aliquip non ea eu Lorem non sit Lorem incididunt elit culpa.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Pariatur non nisi ea nisi quis ut exercitation consequat pariatur cillum nisi nostrud.',
      'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Non minim mollit consequat excepteur sunt.',
      'assets/images/3.png'),
];

class AppTutorialScreeen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreeen({super.key});

  @override
  State<AppTutorialScreeen> createState() => _AppTutorialScreeenState();
}

class _AppTutorialScreeenState extends State<AppTutorialScreeen> {
  late final PageController pageviewController = PageController();
  num slidesLength = slides.length - 1.5;
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   

    pageviewController.addListener(() {
      if (pageviewController.page! >= slides.length - 1.5 ) {
        endReached = true;
        setState(() {});
      } else {
        endReached = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageviewController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('App Tutorial'),
      ),
      body: Stack(children: [
        PageView(
          controller: pageviewController,
          physics: const BouncingScrollPhysics(),
          children: [
            ...slides
                .map((slide) => _Slide(
                    title: slide.title,
                    caption: slide.caption,
                    imageUrl: slide.imageUrl))
                .toList()
          ],
        ),
        Positioned(
          right: 0,
          child: TextButton(
              onPressed: () => context.pop(), child: const Text('Salir')),
        ),
        endReached
            ? Positioned(
                bottom: 50,
                left: 150,
                child: FadeInUp(
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text(
                      'Comenzar',
                    ),
                  ),
                ))
            : const SizedBox()
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      ),
    );
  }
}
