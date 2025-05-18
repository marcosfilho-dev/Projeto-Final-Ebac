import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required this.homePageController,
  });

  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 35,
        child: ValueListenableBuilder<bool>(
          valueListenable: homePageController.changeSearchIconColor,
          builder: (context, value, child) => TextField(
            style: TextStyle(
              color: homePageController.changeSearchIconColor.value
                  ? const Color.fromARGB(255, 241, 241, 247)
                  : const Color.fromARGB(137, 241, 237, 237),
            ),
            cursorColor: const Color.fromARGB(255, 241, 241, 244),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(8),
              suffixIcon: ValueListenableBuilder<bool>(
                valueListenable: homePageController.showCancelButtom,
                builder: (context, value, _) {
                  return homePageController.showCancelButtom.value
                      ? GestureDetector(
                          onTap: () {
                            homePageController.clearSearch();
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: Color.fromARGB(255, 238, 238, 243),
                          ),
                        )
                      : const SizedBox();
                },
              ),
              label: ValueListenableBuilder<bool>(
                valueListenable: homePageController.changeSearchIconColor,
                builder: (context, value, _) {
                  return Text(
                    'Search',
                    style: TextStyle(
                      color: homePageController.changeSearchIconColor.value
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color.fromARGB(137, 255, 255, 255),
                      fontStyle: FontStyle.italic,
                      fontSize: homePageController.changeSearchIconColor.value ? 18 : 13,
                    ),
                  );
                },
              ),
              labelStyle: TextStyle(
                color: homePageController.changeSearchIconColor.value
                    ? const Color.fromARGB(255, 232, 232, 237)
                    : const Color.fromARGB(137, 247, 242, 242),
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
              hintText: 'type...',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 248, 248, 248),
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Color.fromARGB(31, 253, 252, 252)),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1),
              ),
            ),
            controller: homePageController.homeSearchController,
            onChanged: (value) async {
              await homePageController.executeSearch();
            },
            focusNode: homePageController.searchFocusNode.value,
          ),
        ),
      ),
    );
  }
}