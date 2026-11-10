import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Student Profile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF315CEB),
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: const Color(0xFFF5F7FC),
          fontFamily: 'Roboto',
        ),
        home: const StudentProfileScreen(),
      ),
    );
  }
}

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  static const _studentName = 'Ariana Siddiqui';
  static const _studentId = '2024-01736';
  static const _department = 'Computer Science';

  Timer? _loadingTimer;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadingTimer = Timer(const Duration(milliseconds: 2300), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(22.w, 24.h, 22.w, 28.h),
          children: [
            Row(
              children: [
                Container(
                  height: 46.r,
                  width: 46.r,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7ECFF),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Icon(
                    Icons.school_rounded,
                    color: const Color(0xFF315CEB),
                    size: 25.r,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CAMPUS CONNECT',
                      style: TextStyle(
                        color: const Color(0xFF7C8498),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.4,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Student profile',
                      style: TextStyle(
                        color: const Color(0xFF19233D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 42.r,
                  width: 42.r,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: const Color(0xFF59647B),
                    size: 22.r,
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Text(
              'Hello, Ariana 👋',
              style: TextStyle(
                color: const Color(0xFF19233D),
                fontSize: 27.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              'Here’s your student information.',
              style: TextStyle(color: const Color(0xFF7C8498), fontSize: 14.sp),
            ),
            SizedBox(height: 25.h),
            if (_isLoading)
              const _ProfileCardShimmer(key: Key('profile-loading'))
            else
              _buildProfileCard(context),
            SizedBox(height: 22.h),
            Container(
              padding: EdgeInsets.all(17.r),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF7F3),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                children: [
                  Container(
                    height: 40.r,
                    width: 40.r,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_outline_rounded,
                      color: const Color(0xFF15966F),
                      size: 22.r,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ready for class?',
                          style: TextStyle(
                            color: const Color(0xFF194B3D),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          'Mark your attendance for today.',
                          style: TextStyle(
                            color: const Color(0xFF5C8076),
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF263B74).withValues(alpha: 0.08),
            blurRadius: 28.r,
            offset: Offset(0, 12.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EDFF),
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: 0.72,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFF315CEB),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFE7ECFF),
                    width: 2.r,
                  ),
                ),
                child: CircleAvatar(
                  radius: 43.r,
                  backgroundColor: const Color(0xFFE9EDFF),
                  child: Text(
                    'AS',
                    style: TextStyle(
                      color: const Color(0xFF315CEB),
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -9.w,
                top: 2.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB84D),
                    border: Border.all(color: Colors.white, width: 2.r),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      color: const Color(0xFF68420D),
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            _studentName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF19233D),
              fontSize: 22.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'UNDERGRADUATE STUDENT',
            style: TextStyle(
              color: const Color(0xFF8A92A5),
              fontSize: 9.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.25,
            ),
          ),
          SizedBox(height: 23.h),
          _ProfileInfoRow(
            icon: Icons.badge_outlined,
            label: 'STUDENT ID',
            value: _studentId,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Divider(height: 1.h, color: const Color(0xFFF0F1F5)),
          ),
          _ProfileInfoRow(
            icon: Icons.account_balance_outlined,
            label: 'DEPARTMENT',
            value: _department,
          ),
          SizedBox(height: 23.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showDetails(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF315CEB),
                    side: const BorderSide(color: Color(0xFFDCE3FF)),
                    minimumSize: Size(0, 49.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: const Text('View Details'),
                ),
              ),
              SizedBox(width: 11.w),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _markPresent,
                  icon: Icon(Icons.check_rounded, size: 17.r),
                  label: const Text('Mark Present'),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF315CEB),
                    foregroundColor: Colors.white,
                    minimumSize: Size(0, 49.h),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    textStyle: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDetails(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        icon: Container(
          height: 54.r,
          width: 54.r,
          decoration: const BoxDecoration(
            color: Color(0xFFE9EDFF),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person_outline_rounded,
            color: const Color(0xFF315CEB),
            size: 27.r,
          ),
        ),
        title: Text(
          'Student details',
          style: TextStyle(
            color: const Color(0xFF19233D),
            fontSize: 19.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DialogDetail(label: 'Student Name', value: _studentName),
            SizedBox(height: 15.h),
            _DialogDetail(label: 'Student ID', value: _studentId),
            SizedBox(height: 15.h),
            _DialogDetail(label: 'Department', value: _department),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _markPresent() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF194B3D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          content: Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: const Color(0xFF7FE0B9),
                size: 21.r,
              ),
              SizedBox(width: 10.w),
              const Expanded(child: Text('Success! You are marked present.')),
            ],
          ),
        ),
      );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 43.r,
          width: 43.r,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F6FC),
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Icon(icon, color: const Color(0xFF62708E), size: 20.r),
        ),
        SizedBox(width: 13.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF9299AA),
                fontSize: 9.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.9,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              value,
              style: TextStyle(
                color: const Color(0xFF27314A),
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DialogDetail extends StatelessWidget {
  const _DialogDetail({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: const Color(0xFF8A92A5), fontSize: 11.sp),
        ),
        SizedBox(height: 3.h),
        Text(
          value,
          style: TextStyle(
            color: const Color(0xFF27314A),
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _ProfileCardShimmer extends StatelessWidget {
  const _ProfileCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE5E8F0),
      highlightColor: const Color(0xFFF8F9FC),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26.r),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: _skeletonBlock(width: double.infinity, height: 8.h),
            ),
            SizedBox(height: 24.h),
            _skeletonBlock(width: 94.r, height: 94.r, radius: 60.r),
            SizedBox(height: 17.h),
            _skeletonBlock(width: 170.w, height: 20.h),
            SizedBox(height: 9.h),
            _skeletonBlock(width: 125.w, height: 10.h),
            SizedBox(height: 27.h),
            _skeletonBlock(width: double.infinity, height: 44.h),
            SizedBox(height: 15.h),
            _skeletonBlock(width: double.infinity, height: 44.h),
            SizedBox(height: 25.h),
            _skeletonBlock(width: double.infinity, height: 49.h),
          ],
        ),
      ),
    );
  }

  Widget _skeletonBlock({
    required double width,
    required double height,
    double radius = 10,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }
}
