import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../dependency_injection_container.dart' as di;
import '../../../bloc/user_list/user_list_bloc.dart';
import '../../../domain/entities/employee.dart';
import 'widgets/user_card.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  static const String routeName = '/user_list';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserListBloc>(
      create: (BuildContext context) =>
          UserListBloc(di.sl())..add(SearchUserEvent('')),
      child: UserListView(),
    );
  }
}

class UserListView extends StatelessWidget {
  UserListView({super.key});

  final TextEditingController inputController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<UserListBloc>(context)
              .add(SearchUserEvent(inputController.text));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Поиск пользователей',
        )),
        body: BlocBuilder<UserListBloc, UserListState>(
            builder: (BuildContext context, UserListState state) {
          List<Employee> users = [];
          bool isLoading = false;

          if (state is UserListLoading) {
            users = state.oldUsers;
            isLoading = true;
          } else if (state is UserListLoaded) {
            users = state.users;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: <Widget>[
                _searchField(context),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                      shrinkWrap: true,
                      itemCount: users.length + (isLoading ? 1 : 0),
                      itemBuilder: (BuildContext context, int index) {
                      if (index < users.length) {
                        return UserCard(employee: users[index]);
                      }
                      else {
                        return _loadingIndicator();
                      }
                      }),
                )
              ],
            ),
          );
        }));
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: TextFormField(
        controller: inputController,
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (String value) {
          context.read<UserListBloc>().add(SearchUserEvent(value, startPage: 0, currentPage: 0));
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
            suffixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
            hintText: 'Поиск',
            filled: true,
            fillColor: const Color.fromARGB(255, 230, 230, 231),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 230, 230, 231))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 230, 230, 231)))),
      ),
    );
  }
}

// return Padding(
// padding: EdgeInsets.symmetric(vertical: 32.sp),
// child: Column(
// children: [
// Container(
// height: 40.h,
// padding: EdgeInsets.symmetric(horizontal: 20.sp),
// child: TextFormField(
// controller: inputController,
// style: Theme
//     .of(context)
// .textTheme
//     .bodyText2,
// onChanged: (String value) {
// context.read<UserListBloc>().add(
// SearchUserEvent(value));
// },
// decoration: InputDecoration(
// contentPadding:
// EdgeInsets.symmetric(horizontal: 32.w),
// suffixIcon: const Icon(
// Icons.search_rounded,
// color: Colors.black,
// ),
// hintText: 'Поиск',
// filled: true,
// fillColor: const Color.fromARGB(255, 230, 230, 231),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(100),
// borderSide: const BorderSide(
// color: Color.fromARGB(255, 230, 230, 231))),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(100),
// borderSide: const BorderSide(
// color:
// Color.fromARGB(255, 230, 230, 231)))),
// ),
// ),
