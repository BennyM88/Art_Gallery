import 'package:art_gallery/constants/colors.dart';
import 'package:art_gallery/cubits/connection_cubit/connection_cubit.dart';
import 'package:art_gallery/update_data.dart';
import 'package:art_gallery/view/pages/comments_page.dart';
import 'package:art_gallery/view/pages/photos_page.dart';
import 'package:art_gallery/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  void _navigate(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final List<Widget> _pages = [
    const PhotosPage(),
    const CommentsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionCheckCubit, bool>(
      listenWhen: (previous, current) {
        return !current || (current && !previous);
      },
      listener: (context, state) async {
        if (!state) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(_disconnectedSnackBar);
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(_connectedSnackBar);
          updateAllData(context);
        }
      },
      child: Scaffold(
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: _navigate,
          selectedItemColor: CustomColors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'photos'),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: 'comments',
            ),
          ],
        ),
      ),
    );
  }

  final SnackBar _connectedSnackBar = CustomSnackBar.internetConnectionSnackBar(
    'Online',
    CustomColors.green,
    Icons.check_circle_outline,
    const Duration(seconds: 3),
  );

  final SnackBar _disconnectedSnackBar =
      CustomSnackBar.internetConnectionSnackBar(
    'Offline',
    CustomColors.red,
    Icons.error_outline,
    const Duration(days: 365),
  );
}
