import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/repository_entity.dart';
import '../bloc/theme_cubit.dart';

class RepositoryDetailPage extends StatelessWidget {
  final RepositoryEntity repo;
  const RepositoryDetailPage({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final isDark = themeMode == ThemeMode.dark;
    
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Details',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Text(
                  'Dark mode',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: isDark,
                  onChanged: (v) => context.read<ThemeCubit>().toggle(v),
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.withValues(alpha: 0.3),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Repository name and stats
              Row(
                children: [
                  Expanded(
                    child: Text(
                      repo.fullName ?? 'Full repository name',
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${repo.stargazersCount ?? 500}',
                    style: TextStyle(
                      color: isDark ? Colors.grey : Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.call_split,
                    size: 16,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Fork: ${repo.forksCount ?? 4}',
                    style: TextStyle(
                      color: isDark ? Colors.grey : Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Owner info card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF2F2F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: repo.ownerAvatarUrl != null
                          ? CachedNetworkImageProvider(repo.ownerAvatarUrl!)
                          : null,
                      radius: 40,
                      backgroundColor: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                      child: repo.ownerAvatarUrl == null
                          ? Icon(
                              Icons.person,
                              size: 40,
                              color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                            )
                          : null,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      repo.ownerLogin ?? 'username',
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: repo.htmlUrl == null
                          ? null
                          : () => launchUrl(Uri.parse(repo.htmlUrl!), mode: LaunchMode.externalApplication),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            isDark 
                              ? 'assets/images/ic_github_white.png'
                              : 'assets/images/ic_github_black.png',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            repo.htmlUrl?.replaceAll('https://', '') ?? 'github.com/user',
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.black,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Description
              Text(
                repo.description ?? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

