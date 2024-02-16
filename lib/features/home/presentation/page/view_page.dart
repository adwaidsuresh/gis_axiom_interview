import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gis_axiom_interview/core/theme/theme_helper.dart';
import 'package:gis_axiom_interview/features/home/data/repository/main_repositery.dart';
import 'package:gis_axiom_interview/features/login/data/source/login_source.dart';

class ViewPage extends ConsumerWidget {
  const ViewPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final api = ref.watch(getpostProvider);
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            automaticallyImplyLeading: false,
            title: const Text("LeisureInnVKL"),
            backgroundColor: const Color(0xFF033D76),
            surfaceTintColor: Colors.transparent,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  Authentication.logout();
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        ],
        body: api.when(
          data: (data) {
            if (data == null || data.menuItems == null) {
              return const Center(
                child: Text('No menu items available'),
              );
            }
            return ListView.builder(
              itemCount: data.menuItems!.length,
              itemBuilder: (context, index) {
                final menuItem = data.menuItems![index];
                final products = menuItem.products ?? [];
                final product = products.isNotEmpty
                    ? products[index % products.length]
                    : null;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: space.space_400,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              // width: space.space_900 * 5,
                              height: space.space_900 * 3.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(space.space_300),
                                  topLeft: Radius.circular(space.space_300),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(menuItem.sliderImage!),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 90,
                              bottom: 60,
                              top: 70,
                              child: SizedBox(
                                width: space.space_900 * 4,
                                child: Text(
                                  menuItem.name ?? '',
                                  style: TextStyle(
                                    color: colors.backgroundLight,
                                    fontWeight: FontWeight.w200,
                                    fontSize: space.space_600,
                                    fontFamily: 'FONT1',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: space.space_400),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        padding: EdgeInsets.all(space.space_100),
                        strokeWidth: 1,
                        child: product != null
                            ? SizedBox(
                                width: space.space_900 * 4.5,
                                height: space.space_900 * 2.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: space.space_200),
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(product.image ?? ''),
                                          radius: space.space_500,
                                        ),
                                        SizedBox(width: space.space_200),
                                        Text(
                                          menuItem.name ?? '',
                                          style: typography.orderCustomervalue,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        'Rs ${product.amount ?? ''}',
                                        style: TextStyle(
                                          fontFamily: 'FONT1',
                                          fontSize: space.space_200,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: space.space_200),
                                    Text(
                                      product.desc ?? '',
                                      style: typography.uiSemibold,
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text('Error fetching data'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
