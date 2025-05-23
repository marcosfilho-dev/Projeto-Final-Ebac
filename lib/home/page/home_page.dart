import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_page_repository.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/catalog_list.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/custom_appbar.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/custom_refresh.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/recently_added_implementation.dart';
import 'package:atividade_ebac_pre_projeto/home/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key, required this.title});
  
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController _homePageController;

  @override
  void initState(){
    super.initState();
    _checkLogin();

    final client = Client();
    
    final repository = HomePageRepository(client);

    _homePageController = HomePageController(
    title: widget.title,
    ihomePageRepository: repository,
    );

    WidgetsBinding.instance.addPostFrameCallback((_){
     _homePageController.getMovie(searchTerm: '');
});
  }
  

@override
void dispose(){
    //
    _checkLogin();
  _homePageController.homeSearchController.dispose();
  _homePageController.detailSearchController.dispose();
  _homePageController.isLoading.dispose();
  _homePageController.isRefreshCustomOn.dispose();
  _homePageController.showCancelButtom.dispose();
  _homePageController.changeSearchIconColor.dispose();
  _homePageController.searchFocusNode.dispose();
  _homePageController.genreList.dispose();
  _homePageController.fullCatalog.dispose();
  _homePageController.customCarouselSliders.dispose();
  _homePageController.recentlyAdded.dispose();
  super.dispose();

}
_checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = (prefs.getBool('rememberMe') ?? false);
    if (!rememberMe) {
     
      /*Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );*/
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        
      title: widget.title,
      homePageController: _homePageController,
    ),
    body: ValueListenableBuilder(
      valueListenable: _homePageController.recentlyAdded,
      builder: (context, value, child) => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          RecentlyAddedImplementation(
            title: widget.title,
            homePageController: _homePageController,
          ),
          CatalogList(
            homePageController: _homePageController,
            title: widget.title,
          ),
          CustomRefresh(
            homePageController: _homePageController
          ),
        ],
      ),
    ),
    );

  }
}