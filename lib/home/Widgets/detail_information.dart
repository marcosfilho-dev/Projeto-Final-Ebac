import 'package:atividade_ebac_pre_projeto/common/Model/arguments.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailInformation extends StatelessWidget {
  const DetailInformation({
    super.key,
    required this.arguments,
  });

  final Arguments arguments;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitleAndRating(),
            const SizedBox(height: 16),
            _buildReleaseLengthDirector(),
            const SizedBox(height: 4),
            _buildCast(),
            const SizedBox(height: 16),
            _buildOverview(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            arguments.movie.title != null
                ? '${arguments.movie.title!} (${arguments.movie.imdbRating ?? 'N/A'})'
                : 'Título não disponível',
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8),
        if (arguments.movie.imdbRating != null)
          RatingBarIndicator(
            rating: arguments.movie.imdbRating! / 2,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            unratedColor: Colors.white,
            itemCount: 5,
            itemSize: 20,
            direction: Axis.horizontal,
          ),
      ],
    );
  }

  Widget _buildReleaseLengthDirector() {
    return Text(
      arguments.movie.releasedOn != null && arguments.movie.length != null && arguments.movie.director != null
          ? '${dateFormater(arguments.movie.releasedOn!)} | ${arguments.movie.length} | ${arguments.movie.director!.join(', ')}'
          : 'Informações não disponíveis',
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCast() {
    return Text(
      arguments.movie.cast != null ? 'Cast: ${arguments.movie.cast!.join(', ')}' : 'Elenco não disponível',
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildOverview() {
    return Text(
      arguments.movie.overview ?? 'Sinopse não disponível',
      style: const TextStyle(color: Colors.amber, fontSize: 12),
    );
  }
}