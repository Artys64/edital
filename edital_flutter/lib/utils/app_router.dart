import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/admin/manage_notices_screen.dart';
import '../screens/admin/manage_committees_screen.dart';
import '../screens/user/user_dashboard_screen.dart';
import '../screens/user/notice_details_screen.dart';
import '../screens/user/register_for_notice_screen.dart';
import '../screens/committee/committee_dashboard_screen.dart';
import '../screens/committee/evaluate_registrations_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      // Authentication routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // Admin routes
      GoRoute(
        path: '/admin',
        name: 'admin-dashboard',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/admin/notices',
        name: 'manage-notices',
        builder: (context, state) => const ManageNoticesScreen(),
      ),
      GoRoute(
        path: '/admin/committees',
        name: 'manage-committees',
        builder: (context, state) => const ManageCommitteesScreen(),
      ),

      // User routes
      GoRoute(
        path: '/user',
        name: 'user-dashboard',
        builder: (context, state) => const UserDashboardScreen(),
      ),
      GoRoute(
        path: '/user/notice/:id',
        name: 'notice-details',
        builder: (context, state) {
          final noticeId = int.parse(state.pathParameters['id']!);
          return NoticeDetailsScreen(noticeId: noticeId);
        },
      ),
      GoRoute(
        path: '/user/register/:id',
        name: 'register-for-notice',
        builder: (context, state) {
          final noticeId = int.parse(state.pathParameters['id']!);
          return RegisterForNoticeScreen(noticeId: noticeId);
        },
      ),

      // Committee routes
      GoRoute(
        path: '/committee',
        name: 'committee-dashboard',
        builder: (context, state) => const CommitteeDashboardScreen(),
      ),
      GoRoute(
        path: '/committee/evaluate/:noticeId',
        name: 'evaluate-registrations',
        builder: (context, state) {
          final noticeId = int.parse(state.pathParameters['noticeId']!);
          return EvaluateRegistrationsScreen(noticeId: noticeId);
        },
      ),
    ],
  );
}