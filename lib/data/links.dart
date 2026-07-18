import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/model/project.dart' show Link;

class Links {
  Links._();

  static const Link linkedin = (
    url: 'https://www.linkedin.com/in/vikashchaurasiyafullstack/',
    urlText: 'LinkedIn',
    icon: FontAwesomeIcons.squareLinkedin,
  );

  static const github = (
    url: 'https://github.com/proVikash',
    urlText: 'GitHub',
    icon: FontAwesomeIcons.squareGithub,
  );

  // static const medium = (
  //   url: 'https://yashashm.medium.com',
  //   urlText: 'Medium',
  //   icon: FontAwesomeIcons.medium,
  // );

  static const email = (
    url: 'mailto:vkchaurasiyatrade.dev@gmail.com',
    urlText: 'Email\nvkchaurasiyatrade.dev@gmail.com',
    icon: FontAwesomeIcons.at,
  );

  static const location = (
    url: '',
    urlText: 'Base\nINDIA',
    icon: FontAwesomeIcons.locationDot,
  );

  static const resume = (
    url:
        'https://drive.google.com/file/d/1h-WsY9UR4r5VqrvST1aTd6pwI6istm-L/view?usp=drivesdk',
    urlText: 'Resume',
    icon: FontAwesomeIcons.arrowUpRightFromSquare,
  );

  // static const contributions = (
  //   url: 'https://github.com/yashas-hm/yashas-hm/blob/main/contributions.md',
  //   urlText: 'Contributions',
  //   icon: FontAwesomeIcons.codeFork,
  // );

//   static const talks = (
//     url: 'https://github.com/yashas-hm/talks',
//     urlText: 'Tech Talks',
//     icon: FontAwesomeIcons.microphoneLines,
//   );
}
