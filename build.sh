#!/bin/bash
set -e

git clone https://github.com/flutter/flutter.git --depth 1 -b 3.44.4
export PATH="$PWD/flutter/bin:$PATH"

flutter config --enable-web
flutter pub get
flutter build web