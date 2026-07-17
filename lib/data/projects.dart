
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/model/project.dart';

class Projects {
  Projects._();

  static final prepMateAi = Project(
    name: 'PrepMateAi',
    imageUrl: '', // e.g. hosted screenshot/GIF
    description:
        'Full-stack AI career platform. Flutter + Riverpod (MVVM, Clean '
        'Architecture) mobile app with a Django REST backend. Features an '
        'AI-powered resume builder with real-time preview, on-device PDF '
        'generation, and ATS score analysis with actionable feedback.',
  
    skills: [
      Skills.flutter,
      Skills.django,
      Skills.riverpod,
      Skills.postgresql,
    ],
    links: [
      (
        url: 'https://github.com/provikash/prepMateAi',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
    ],
    endDate: DateTime(2026, 3),
  );

  static final vibely = Project(
    name: 'Vibely',
    imageUrl: '',
    description:
        'Real-time one-to-one chat app with sub-second message delivery via '
        'Cloud Firestore streams. Dual auth flows (Email/Password + Google '
        'OAuth), FCM push notifications for background/closed-app delivery, '
        'and Riverpod-managed async state across chat, auth, and '
        'notifications.',
    
    skills: [
      Skills.flutter,
      Skills.firebase,
      Skills.riverpod,
    ],
    links: [
      (
        url: 'https://github.com/provikash/', // e.g. github.com/provikash/vibely
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
    ],
    endDate: DateTime(2025, 3),
  );

  // static final botHost = Project(
  //   name: 'BotHost',
  //   imageUrl: 'TODO_REPLACE_WITH_IMAGE_URL',
  //   description:
  //       'Cloud hosting platform for Telegram bot developers. Flutter '
  //       'frontend with a FastAPI backend, Docker-per-bot isolation for '
  //       'security and resource separation, tiered pricing with bandwidth '
  //       'metering, and a web-based external checkout flow to stay compliant '
  //       'with Play Store policies.',
   
  //   skills: [
  //     Skills.flutter,
  //     Skills.docker,
  //     Skills.python,
  //   ],
  //   links: [
  //     (
  //       url: 'TODO_REPLACE_WITH_REPO_URL',
  //       urlText: 'Code',
  //       icon: FontAwesomeIcons.code,
  //     ),
  //   ],
  //   endDate: null, // still active/in progress
  // );

  // static final storageBuilder = Project(
  //   name: 'Storage-builder',
  //   imageUrl: 'TODO_REPLACE_WITH_IMAGE_URL',
  //   description:
  //       'Telegram bot hosting project — the earlier iteration that fed into '
  //       'BotHost, exploring bot provisioning and storage management via the '
  //       'Telegram Bot API.',
  
  //   skills: [
  //     Skills.python,
  //   ],
  //   links: [
  //     (
  //       url: 'https://github.com/provikash/Storage-builder',
  //       urlText: 'Code',
  //       icon: FontAwesomeIcons.code,
  //     ),
  //   ],
  //   endDate: DateTime(2025, 6),
  // );

  // static final catalog = Project(
  //   name: 'Catalog',
  //   imageUrl: 'TODO_REPLACE_WITH_IMAGE_URL',
  //   description:
  //       'Product explorer app built against the DummyJSON API. MVC + '
  //       'Riverpod, offline caching, and wishlist persistence — completed as '
  //       'a full internship assignment with a full debugging cycle.',
  
  //   skills: [
  //     Skills.flutter,
  //     Skills.riverpod,
  //   ],
  //   links: [
  //     (
  //       url: 'TODO_REPLACE_WITH_REPO_URL',
  //       urlText: 'Code',
  //       icon: FontAwesomeIcons.code,
  //     ),
  //   ],
  //   endDate: DateTime(2025, 1),
  // );

  // static final lingoBreeze = Project(
  //   name: 'LingoBreeze',
  //   imageUrl: 'TODO_REPLACE_WITH_IMAGE_URL',
  //   description:
  //       'Full-stack language-learning app built as a technical assignment. '
  //       'Flutter client with Clean Architecture, Node.js/Firebase backend.',
  //   tag: ProjectTag.project,
  //   skills: [
  //     Skills.flutter,
  //     Skills.nodeJs,
  //     Skills.firebase,
  //   ],
  //   links: [
  //     (
  //       url: 'TODO_REPLACE_WITH_REPO_URL',
  //       urlText: 'Code',
  //       icon: FontAwesomeIcons.code,
  //     ),
  //   ],
  //   endDate: DateTime(2024, 10),
  // );

  /// All projects (unsorted)
  static final List<Project> _all = [
    prepMateAi,
    vibely,
  
  ];

  static List<Project> get all => sorted(_all);

  /// Sorts projects:
  /// - null endDate (in-progress) first
  /// - otherwise by endDate, newest first
  static List<Project> sorted(List<Project> projects) {
    final list = List<Project>.from(projects);
    list.sort((a, b) {
      if (a.endDate == null && b.endDate == null) return 0;
      if (a.endDate == null) return -1;
      if (b.endDate == null) return 1;
      return b.endDate!.compareTo(a.endDate!);
    });
    return list;
  }

  // static List<Project> byTag(ProjectTag tag) {
  //   if (tag == ProjectTag.all) return all;

  //   final list = _all.where((p) => p.tag == tag).toList();
  //   return sorted(list);
  // }

  static final List<Project> highlights = [
    prepMateAi,
    vibely,
    // botHost,
  ];
}
