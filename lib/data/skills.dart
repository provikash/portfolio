import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart' show LogoAssets;
import 'package:portfolio/model/skill.dart';

class Skills {
  Skills._();

  // ---------------- Languages ----------------

  static const dart = Skill(
    name: 'Dart',
    icon: LogoAssets.dartLogo,
    category: SkillCategory.languages,
  );

  static const python = Skill(
    name: 'Python',
    icon: LogoAssets.pythonLogo,
    category: SkillCategory.languages,
  );

  static const java = Skill(
    name: 'Java',
    icon: LogoAssets.javaLogo,
    category: SkillCategory.languages,
  );

  static const sql = Skill(
    name: 'SQL',
    category: SkillCategory.languages, // no LogoAssets.sqlLogo in sample set — add one or leave iconless
  );

  // ---------------- Mobile & Frontend ----------------

  static const flutter = Skill(
    name: 'Flutter',
    icon: LogoAssets.flutterLogo,
    category: SkillCategory.frontend,
  );

  static const android = Skill(
    name: 'Android',
    icon: LogoAssets.kotlinLogo,
    category: SkillCategory.frontend,
  );

 

  static const materialDesign = Skill(
    name: 'Material Design',
    category: SkillCategory.frontend, // TODO: add a logo asset if desired
  );

  // ---------------- State Management & Architecture ----------------
  // NOTE: sample SkillCategory enum has no dedicated "architecture" bucket.
  // Filed these under frontend since they're Flutter-side concerns —
  // add a SkillCategory.architecture case if you want them split out.

  static const riverpod = Skill(
    name: 'Riverpod',
    category: SkillCategory.frontend, // TODO: LogoAssets.riverpodLogo if you have one
  );

  static const provider = Skill(
    name: 'Provider',
    category: SkillCategory.frontend,
  );

  static const mvvm = Skill(
    name: 'MVVM',
    category: SkillCategory.frontend,
  );

  static const cleanArchitecture = Skill(
    name: 'Clean Architecture',
    category: SkillCategory.frontend,
  );

  // ---------------- Backend ----------------

  static const django = Skill(
    name: 'Django',
    category: SkillCategory.backend, // TODO: LogoAssets.djangoLogo
  );

  static const restApis = Skill(
    name: 'REST APIs',
    category: SkillCategory.backend,
  );

  static const celery = Skill(
    name: 'Celery',
    category: SkillCategory.backend, // TODO: LogoAssets.celeryLogo
  );

  static const redis = Skill(
    name: 'Redis',
    category: SkillCategory.backend, // TODO: LogoAssets.redisLogo
  );

  static const jwtAuth = Skill(
    name: 'JWT Auth',
    category: SkillCategory.backend,
  );

  // ---------------- Databases ----------------

  static const firebase = Skill(
    name: 'Firebase',
    icon: LogoAssets.firebaseLogo,
    category: SkillCategory.database,
  );

  static const firestore = Skill(
    name: 'Firestore',
    icon: LogoAssets.firebaseLogo,
    category: SkillCategory.database,
  );

  static const fcm = Skill(
    name: 'FCM',
    icon: LogoAssets.firebaseLogo,
    category: SkillCategory.database, // push messaging, grouped with Firebase for now
  );

  static const postgresql = Skill(
    name: 'PostgreSQL',
    icon: LogoAssets.psqlLogo,
    category: SkillCategory.database,
  );

  static const sqlite = Skill(
    name: 'SQLite',
    category: SkillCategory.database, // TODO: LogoAssets.sqliteLogo
  );

  // ---------------- DevOps & Tools ----------------

  static const git = Skill(
    name: 'Git',
    icon: LogoAssets.gitLogo,
    category: SkillCategory.devops,
  );

  static const github = Skill(
    name: 'GitHub',
    icon: LogoAssets.githubLogo,
    category: SkillCategory.cloudTools,
    overrideLogoColor: true,
  );

  static const docker = Skill(
    name: 'Docker',
    icon: LogoAssets.dockerLogo,
    category: SkillCategory.devops,
  );

  static const androidStudio = Skill(
    name: 'Android Studio',
    category: SkillCategory.cloudTools, // TODO: LogoAssets.androidStudioLogo
  );

  static const vsCode = Skill(
    name: 'VS Code',
    category: SkillCategory.cloudTools, // TODO: LogoAssets.vsCodeLogo
  );

  static const postman = Skill(
    name: 'Postman',
    category: SkillCategory.cloudTools, // TODO: LogoAssets.postmanLogo
  );

  static List<Skill> get coreStack => [
        Skills.flutter,
        Skills.dart,
        Skills.django,
        Skills.postgresql,
        Skills.firebase,
        Skills.docker,
        Skills.riverpod,
        Skills.restApis,
      ];
}

class SkillGroups {
  SkillGroups._();

  static List<SkillGroup> groups = [
    languages,
    frontend,
    backend,
    databases,
    devops,
    cloudTools,
  ];

  static const languages = SkillGroup(
    groupName: 'Languages',
    groupIcon: FontAwesomeIcons.code,
    skills: [
      Skills.dart,
      Skills.python,
      Skills.java,
      Skills.sql,
    ],
  );

  static const frontend = SkillGroup(
    groupName: 'Mobile & Frontend',
    groupIcon: FontAwesomeIcons.mobile,
    skills: [
      Skills.flutter,
      Skills.android,
      Skills.materialDesign,
      Skills.riverpod,
      Skills.provider,
      Skills.mvvm,
      Skills.cleanArchitecture,
    ],
  );

  static const backend = SkillGroup(
    groupName: 'Backend & APIs',
    groupIcon: FontAwesomeIcons.server,
    skills: [
      Skills.django,
      Skills.restApis,
      Skills.celery,
      Skills.redis,
      Skills.jwtAuth,
    ],
  );

  static const databases = SkillGroup(
    groupName: 'Databases',
    groupIcon: FontAwesomeIcons.database,
    skills: [
      Skills.firebase,
      Skills.firestore,
      Skills.fcm,
      Skills.postgresql,
      Skills.sqlite,
    ],
  );

  static const devops = SkillGroup(
    groupName: 'DevOps',
    groupIcon: FontAwesomeIcons.gears,
    skills: [
      Skills.git,
      Skills.docker,
    ],
  );

  static const cloudTools = SkillGroup(
    groupName: 'Tools',
    groupIcon: FontAwesomeIcons.solidCloud,
    skills: [
      Skills.github,
      Skills.androidStudio,
      Skills.vsCode,
      Skills.postman,
    ],
  );

  static List<SkillGroup> get all => <SkillGroup>[
        languages,
        frontend,
        backend,
        databases,
        devops,
        cloudTools,
      ];

  static List<Skill> get allSkills =>
      all.expand((group) => group.skills).toList();
}