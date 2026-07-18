# Portfolio Website Guide

This document explains how this portfolio website is built, what each major part does, and how a beginner can learn to build a similar website with Flutter.

## 1. What this website is

This project is a personal portfolio website made with Flutter. It is designed to work well on web and also follows the same app structure you would use for a Flutter mobile app.

The site is focused on:

- Introducing the owner on the home section
- Showing the about section
- Showing projects
- Showing skills and tools
- Providing a contact section
- Offering a resume button
- Supporting light and dark themes
- Using smooth scrolling and modern UI effects

## 2. Main app structure

The app starts in [lib/main.dart](../lib/main.dart).

Important startup steps:

- `WidgetsFlutterBinding.ensureInitialized()` prepares Flutter before the app starts
- `usePathUrlStrategy()` makes web URLs look cleaner without a `#` symbol
- `ThemeRepository.instance.init()` loads the saved theme preference
- `runApp(const Portfolio())` starts the app

The root widget builds a `MaterialApp` with:

- Custom theme support
- A global navigator key
- Desktop and web friendly scroll behavior
- Route generation with `onGenerateRoute`
- Animation for theme switching
- A title set to the owner's name

## 3. Website sections

The main site sections are defined in [lib/navigation/routes.dart](../lib/navigation/routes.dart).

The visible main routes are:

- Home
- About
- Projects
- Skills
- Contact

Other routes also exist for:

- Experience
- Resume
- Tech Blog

The homepage is built as a long scrolling page in [lib/presentation/home_page.dart](../lib/presentation/home_page.dart). It stacks the main sections vertically:

- Home component
- About component
- Projects component
- Skills component
- Contact component

Each section is wrapped so it can be targeted by the navigation system for smooth scrolling.

## 4. Shared page shell

Most pages use [lib/components/base_page/base_page.dart](../lib/components/base_page/base_page.dart).

This shared shell is important because it provides:

- A background grid effect
- The scrollable page layout
- The floating top navbar
- A footer at the bottom
- Optional extra background layers

### What happens in BasePage

- The page is wrapped in a `Scaffold`
- The background uses a custom `GridBackground`
- Scroll notifications are listened to so the navbar can appear while scrolling
- The navbar slides in and fades out after a short delay
- Content is placed inside a `CustomScrollView`
- A stretching footer is shown at the bottom

This is a good example of how to keep repeated UI in one place instead of copying it into every page.

## 5. Navigation and navbar

The navbar lives inside the same base page file, in a part file.

It does several jobs:

- Shows the circular avatar/logo on the left
- Shows the main navigation links in the center on wide screens
- Shows a menu button on mobile
- Shows a resume button on desktop
- Includes a theme switcher inside the popup menu

### How navigation works

The app uses a custom navigator system from [lib/navigation/navigation.dart](../lib/navigation/navigation.dart) and [lib/navigation/route_generator.dart](../lib/navigation/route_generator.dart).

The navbar can:

- Jump to the home route
- Scroll to sections on the same page
- Open other pages like projects, contact, resume, or blog

This is a common pattern in portfolio sites:

- Use section scrolling for the homepage
- Use separate routes for focused pages

## 6. Asset management

Image and logo paths are centralized in [lib/constants/assets.dart](../lib/constants/assets.dart).

That file defines paths for:

- The avatar image
- Coding GIFs
- Display images
- Technology logos

This is a clean approach because it keeps asset paths out of widgets. If an image path changes later, you only update it in one place.

## 7. Theme system

The theme layer is defined under [lib/theme/](../lib/theme/).

The app supports both light and dark modes using a repository pattern.

### Why this matters

Beginners often hardcode colors directly inside widgets. That works at first, but it becomes hard to maintain. This project uses theme classes and shared color values so the UI stays consistent.

### What the theme system gives you

- A consistent color palette
- Light and dark mode support
- Saved user preference
- Reusable text and background colors
- Theme animations when switching modes

## 8. UI and visual style

This portfolio has a modern, polished look. The visual language includes:

- A grid background
- Soft shadows and glow effects
- Rounded UI elements
- Icon-based navigation
- Animated text and motion
- Responsive spacing for desktop and mobile

The app uses packages such as:

- `google_fonts` for typography
- `font_awesome_flutter` for icons
- `animated_text_kit` for text animation
- `day_night_themed_switcher` for theme toggling
- `flutter_svg` for SVG assets
- `gap` for spacing
- `oktoast` for toast messages
- `cached_network_image` for image caching

## 9. Home section

The home content is defined in [lib/components/home/home_component.dart](../lib/components/home/home_component.dart).

It includes:

- A main visual image block
- Social and external links
- Metric cards or highlight stats

This is usually the first thing a visitor sees, so it is designed to introduce the owner quickly and give links to other sections.

## 10. Other section components

The app uses reusable components for each section:

- About
- Projects
- Skills
- Contact
- Experience
- Contributions

This is a strong Flutter pattern because each section stays isolated and easier to maintain.

### Why reusable components are better

If every section were written inside one giant widget, the code would become hard to read. Separating sections into components helps you:

- Reuse code
- Debug faster
- Change one section without breaking others
- Keep files smaller and cleaner

## 11. Responsive behavior

The website adapts to different screen sizes.

Examples:

- The navbar becomes a compact mobile menu on small screens
- The homepage layout uses flexible spacing and constrained widths
- Section containers adjust padding and minimum height
- Some layout decisions depend on whether the device is mobile or desktop

If you are building a Flutter website, this is one of the most important things to learn early.

## 12. Web-specific behavior

This project is also tailored for Flutter Web.

Notable web-friendly choices:

- Path URL strategy for clean URLs
- Mouse and touch drag support
- Navigation that works well with scroll sections
- Build instructions for web release

The build note in [documentation/documentation.md](documentation.md) says the site can be built with:

```bash
flutter build web --web-renderer canvaskit --release --dart-define-from-file=.env/prod.json
```

## 13. Folder map

A beginner can understand the project faster by grouping files by purpose.

### Entry and routing

- [lib/main.dart](../lib/main.dart)
- [lib/navigation/](../lib/navigation/)

### Page shells and shared layout

- [lib/components/base_page/](../lib/components/base_page/)

### Section content

- [lib/components/home/](../lib/components/home/)
- [lib/components/about/](../lib/components/about/)
- [lib/components/projects/](../lib/components/projects/)
- [lib/components/skills/](../lib/components/skills/)
- [lib/components/contact/](../lib/components/contact/)
- [lib/components/experiences/](../lib/components/experiences/)

### Data and models

- [lib/data/](../lib/data/)
- [lib/model/](../lib/model/)
- [lib/repositories/](../lib/repositories/)

### Theme and constants

- [lib/constants/](../lib/constants/)
- [lib/theme/](../lib/theme/)

### Reusable widgets

- [lib/widgets/](../lib/widgets/)

## 14. How to build a website like this in Flutter

If you are a beginner, do not try to build the whole website at once. Build it in small steps.

### Step 1: Learn the Flutter basics

First understand:

- `StatelessWidget` and `StatefulWidget`
- `Container`, `Column`, `Row`, `Stack`, `Wrap`
- `Padding`, `SizedBox`, `Align`, `Center`
- `MediaQuery` or custom extension helpers for screen size
- Routing with `Navigator`

### Step 2: Build a simple homepage

Start with one screen that contains:

- A header
- A hero text block
- A button
- A few feature cards

Do not worry about animation at first. Focus on layout.

### Step 3: Add sections

After the homepage works, split the screen into sections:

- About
- Projects
- Skills
- Contact

Each section should become its own widget file.

### Step 4: Add a shared shell

Create a common layout wrapper that includes:

- Background
- Navbar
- Footer
- Scroll behavior

This is where the app starts to feel like a real website.

### Step 5: Make it responsive

Test your app on:

- Mobile width
- Tablet width
- Desktop width

Then adjust:

- Font sizes
- Padding
- Column and row layouts
- Menu behavior
- Button sizes

### Step 6: Add motion carefully

Use animations to improve the feel of the site, but keep them purposeful.

Good beginner-friendly animations include:

- Fade in
- Slide in
- Animated text
- Hover highlights
- Smooth section transitions

### Step 7: Add theme support

Create:

- A light theme
- A dark theme
- A way to store the selected theme

Theme support is one of the easiest ways to make a portfolio feel professional.

### Step 8: Add content data files

Instead of hardcoding everything in widgets, store your content in data files:

- Projects
- Skills
- Metrics
- Links
- Testimonials

This makes the app easier to maintain and update.

## 15. How to learn Flutter for this kind of website

Here is a beginner-friendly path.

### Phase 1: Flutter foundations

Learn these first:

- Dart syntax
- Widgets
- Layouts
- State management basics
- Navigation
- Responsive design

Practice by building:

- A profile card
- A landing page
- A simple about page

### Phase 2: Intermediate UI skills

Then learn:

- Scroll views
- Reusable components
- Theme system
- Asset handling
- SVG and image rendering
- Hover effects for web
- Breakpoints for responsiveness

Practice by building:

- A personal homepage
- A services section
- A projects grid
- A contact form UI

### Phase 3: Polished portfolio skills

After that, add:

- Animated text
- Staggered reveals
- Background effects
- Toasts and feedback
- External links
- Data-driven content
- Better typography

Practice by cloning one portfolio section at a time.

## 16. How to learn faster

A good learning method is to copy small parts of this project and rebuild them yourself.

Try this order:

1. Build the navbar
2. Build the hero section
3. Build the about section
4. Build the projects grid
5. Build the skills section
6. Build the contact section
7. Add theme switching
8. Add animations

Do not start with advanced effects. Get the structure correct first.

## 17. If you want to use Lottie instead of avatar.svg

If your goal is to replace the SVG avatar with a Lottie animation, the general workflow is:

1. Add the `lottie` package to `pubspec.yaml`
2. Add the animation JSON file under `assets/`
3. Register the animation asset in the Flutter asset list
4. Replace the `SvgPicture.asset(...)` widget with a Lottie widget
5. Test it on web and mobile

This is a good beginner exercise because it teaches:

- Asset registration
- Package installation
- Widget replacement
- Animation playback
- Web compatibility

## 18. Good habits for portfolio projects

If you want your own Flutter portfolio to look professional, follow these habits:

- Keep design consistent
- Use a limited color palette
- Use shared constants for sizes and spacing
- Put repeated values in one place
- Split large widgets into smaller files
- Store content in data files instead of hardcoding it
- Test the site on different screen sizes
- Keep animations smooth but not distracting

## 19. What to study next

Once you understand this project, the next topics to learn are:

- Responsive Flutter layouts
- Flutter web deployment
- Custom theming
- State management for UI preferences
- Data modeling
- Animation basics
- Asset bundling
- Navigation patterns

## 20. Short summary

This portfolio is a Flutter web app built from reusable sections, a shared page shell, a responsive navbar, and a theme system. The best way to learn building this type of website is to start with a simple landing page, then add sections, navigation, responsiveness, theme switching, and animations step by step.

If you want, you can rebuild the whole app by following the order:

1. Create the app shell
2. Add the navbar
3. Add the home section
4. Add the other sections
5. Add theme support
6. Add responsive layout
7. Add animations and polish
