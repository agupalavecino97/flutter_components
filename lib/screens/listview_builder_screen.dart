import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        print('PASA');
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (loading) return;
    loading = true;
    setState(() {});
    Future.delayed(const Duration(seconds: 5));
    add5();
    loading = false;
    setState(() {});

    if (scrollController.position.pixels + 100 >=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Stack(
        children: [
          RefreshIndicator(
            onRefresh: onRefresh,
            color: AppTheme.primary,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (BuildContext context, int index) {
                return const FadeInImage(
                    width: double.infinity,
                    // height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: AssetImage('assets/batman.png')
                    // image: NetworkImage('https://picsum.photos/500/300?image=$imagesIds[index]')
                    );
              },
            ),
          ),
          if (loading)
            Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _loading())
        ],
      ),
    ));
  }
}

class _loading extends StatelessWidget {
  const _loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
