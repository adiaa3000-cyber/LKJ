# Dioxivet Academy — clean starter

A Flutter starter UI for Dioxivet Academy. This is a frontend demo, not yet a production course platform: authentication, cloud database, video hosting, payments, and admin tools still need to be connected and tested.

## Build an Android APK on GitHub Actions

1. Upload the contents of this folder to the **root** of a clean GitHub repository (not the ZIP itself).
2. Preserve paths exactly: `lib/main.dart`, `pubspec.yaml`, and `.github/workflows/build-android-apk.yml`.
3. Open **Actions** and select **Build Dioxivet Academy APK**. If needed, click **Run workflow**.
4. When the run succeeds, open the run page and download the `Dioxivet-Academy-APK` artifact. It contains `app-release.apk`.

The workflow generates Android platform files during CI with `flutter create`, so do not manually add Gradle files in the repository.
