import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scrool_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    // TODO: implement initState

    scrollController.addListener(() {
      final maxScrollExtent = scrollController.position.maxScrollExtent;

      if (scrollController.position.pixels + 500 > maxScrollExtent) {
        loadNextPage();
      }

    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    isMounted = false;

    super.dispose();
  }

  void moveScrollToBottom() {

    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;

    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
            edgeOffset: 10,
            onRefresh: onRefresh,
            child: ImagesList(
                scrollController: scrollController, imagesIds: imagesIds)),
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: () => context.pop(),
          child: isLoading
              ? SpinPerfect(
                  infinite: true, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))),
    );
  }
}

class ImagesList extends StatelessWidget {
  const ImagesList({
    super.key,
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: imagesIds.length,
        itemBuilder: (context, index) {
          final image = imagesIds[index];
          return FadeInImage(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/$image/500/300'));
        });
  }
}
