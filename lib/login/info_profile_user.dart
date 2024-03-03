import 'package:flutter/material.dart';
import '../network/bloc/bloc.dart';
import 'chang_pasword.dart';
import '../network/models/info_user_model.dart';
import 'screen_login.dart';

class InfoUserProfile extends StatefulWidget {
  const InfoUserProfile({super.key});

  @override
  State<InfoUserProfile> createState() => _InfoUserProfileState();
}

class _InfoUserProfileState extends State<InfoUserProfile> {
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.getUserProfile(); // Directly fetch data in initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin tài khoản'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<UserProfile?>(
              stream: _userBloc.userStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data;
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 30,
                            ),
                            const Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              user?.data?.familyName ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.login_sharp,
                              size: 30,
                            ),
                            const Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              user?.data?.userName ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              size: 30,
                            ),
                            const Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              user?.data?.phone ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.roller_shades,
                              size: 30,
                            ),
                            const Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              user?.data?.role?.name ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.departure_board,
                              size: 30,
                            ),
                            const Padding(padding: EdgeInsets.only(right: 5)),
                            Text(
                              user?.data?.department?.name ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading user profile: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            IconButton(
              onPressed: _logOut,
              icon: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Đăng xuất',
                    style: TextStyle(color: Colors.red),
                  ),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangPassword(),
                  ),
                );
              },
              child: const Text('Đổi mật khẩu'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }

  void _logOut() {
    ScreenLoginState.token = "";
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ScreenLogin()),
        (route) => false);
  }
}
