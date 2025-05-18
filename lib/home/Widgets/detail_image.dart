import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/arguments.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/detail_base_image.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/detail_information.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({
    super.key,
    required this.arguments,
    required this.crossFade,
  });

  final Arguments arguments;
  final ValueNotifier<bool> crossFade;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: AppStyle.mainBackground,
        child: _buildPadding(context), // Extrair o Padding para um método
      ),
    );
  }

  Widget _buildPadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          DetailBaseImage(key: const Key('detailBaseImage'), arguments: arguments, crossFade: crossFade), // Adicionar Key
          const SizedBox(key: Key('sizedBox'), width: 16), // Adicionar Key
          Expanded(key: const Key('detailInformation'), child: DetailInformation(arguments: arguments)), // Adicionar Key
        ],
      ),
    );
  }
}