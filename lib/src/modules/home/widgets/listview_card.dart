import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../../entity/entity.dart';
import '../../../components/components.dart';

class ListViewCard extends StatelessWidget {
  final bool changeColor;
  const ListViewCard({
    Key? key,
    required this.data,
    required this.changeColor,
    required this.searchString,
  }) : super(key: key);

  final List<Result>? data;
  final String searchString;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data!.length,
        itemBuilder: (_, index) {
          return data![index].name.toLowerCase().contains(searchString)
              ? InkWell(
                  onTap: () => {
                    FocusScope.of(context).unfocus(),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailWidget(
                              changeColor: changeColor,
                              image: data![index].image,
                              tag: data![index].id.toString(),
                              name: data![index].name,
                              location: data![index].location.name,
                              origin: data![index].origin.name,
                              gender: data![index].gender!,
                              species: data![index].species!,
                              status: data![index].status!,
                              episode: data![index].episode,
                            )))
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Hero(
                              tag: data![index].id.toString(),
                              child: Image.network(
                                data![index].image,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              data![index].name,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: changeColor
                                      ? AppThemeDark.primaryColor
                                      : AppThemeLight.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container();
        });
  }
}
