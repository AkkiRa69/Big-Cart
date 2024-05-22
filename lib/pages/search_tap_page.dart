import 'package:flutter/material.dart';
import 'package:grocery_store/constant/appcolor.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/pages/controller_page.dart';
import 'package:grocery_store/pages/product_page.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:grocery_store/providers/search_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SearchTapPage extends StatefulWidget {
  const SearchTapPage({super.key});

  @override
  State<SearchTapPage> createState() => _SearchTapPageState();
}

class _SearchTapPageState extends State<SearchTapPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      body: _buildBody(context),
    );
  }

  TextEditingController search = TextEditingController();

  Widget _buildBody(BuildContext context) {
    List<String> searchList = context.watch<SearchProvider>().searchList;
    List<String> discover = context.watch<SearchProvider>().discover;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColor.appBarColor,
          padding: const EdgeInsets.only(bottom: 17),
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const ControllerPage(),
                            type: PageTransitionType.leftToRight));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: AppColor.bodyColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.symmetric(horizontal: 17),
                    child: TextFormField(
                      controller: search,
                      style: const TextStyle(fontSize: 18),
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          "assets/icons/search.png",
                          color: const Color(0xFF868889),
                        ),
                        hintText: "Search keywords...",
                        suffixIcon: Image.asset(
                          "assets/icons/filter.png",
                          color: const Color(0xFF868889),
                        ),
                        hintStyle: const TextStyle(color: Color(0xFF868889)),
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {
                        if (value.isEmpty) {
                          return;
                        }
                        search.text = "";
                        context
                            .read<SearchProvider>()
                            .addTextToSearchHis(value);
                        List<FruitModel> fruits =
                            context.read<FruitProvider>().fruitList;
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: const Duration(milliseconds: 500),
                                child: ProductPage(
                                  fruits: fruits,
                                  title: value,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //search history
        if (searchList.isEmpty)
          const SizedBox()
        else
          Padding(
            padding:
                const EdgeInsets.only(left: 17, top: 17, bottom: 2, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Search History",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      context.read<SearchProvider>().clearHis();
                    },
                    child: const Text(
                      "Clear",
                      style: TextStyle(
                        color: Color(0xff407EC7),
                      ),
                    )),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Wrap(
            spacing: 10,
            runSpacing: 1,
            children: List.generate(
              searchList.length,
              (index) => TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.appBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  searchList[index],
                  style: TextStyle(color: AppColor.textColor),
                ),
              ),
            ),
          ),
        ),

        //Discover More
        if (discover.isEmpty)
          const SizedBox()
        else
          Padding(
            padding:
                const EdgeInsets.only(left: 17, top: 17, bottom: 2, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Discover More",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    context.read<SearchProvider>().clearDis();
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(
                      color: Color(0xff407EC7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Wrap(
            spacing: 10,
            runSpacing: 1,
            children: List.generate(
              discover.length,
              (index) => TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.appBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  discover[index],
                  style: TextStyle(color: AppColor.textColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
