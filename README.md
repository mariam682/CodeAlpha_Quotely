# Quotely — MVVM Architecture 📖✨

## هيكل المشروع

```
lib/
├── main.dart                          # Entry point فقط
│
├── core/
│   ├── constants/
│   │   ├── app_colors.dart            # كل الألوان والـ gradients
│   │   └── app_text_styles.dart       # كل الـ TextStyles
│   └── theme/
│       └── app_theme.dart             # ThemeData
│
├── data/
│   ├── models/
│   │   └── quote_model.dart           # Model — Quote
│   └── repositories/
│       └── quote_repository.dart      # Repository — مصدر البيانات
│
├── viewmodels/
│   ├── welcome_viewmodel.dart         # ViewModel للـ Welcome
│   ├── home_viewmodel.dart            # ViewModel للـ Home
│   └── favorites_viewmodel.dart       # ViewModel للـ Favorites
│
└── views/
    ├── welcome/
    │   ├── welcome_screen.dart        # View — شاشة البداية
    │   └── widgets/
    │       ├── quote_logo.dart        # Widget — اللوجو الدائري
    │       ├── preview_card.dart      # Widget — كارت المعاينة
    │       ├── feature_icon_item.dart # Widget — أيقونة الـ feature
    │       └── get_started_button.dart# Widget — زر Get Started
    │
    ├── home/
    │   ├── home_screen.dart           # View — الشاشة الرئيسية
    │   └── widgets/
    │       ├── background_orb.dart    # Widget — الدوائر الضبابية
    │       ├── home_header.dart       # Widget — الهيدر
    │       ├── quote_card.dart        # Widget — كارت الاقتباس
    │       ├── circle_icon_button.dart# Widget — زر دائري
    │       └── new_quote_button.dart  # Widget — زر New Quote
    │
    └── favorites/
        ├── favorites_screen.dart      # View — شاشة المفضلة
        └── widgets/
            ├── favorites_header.dart       # Widget — الهيدر
            ├── favorite_quote_card.dart    # Widget — كارت المفضلة
            └── empty_favorites_view.dart   # Widget — الشاشة الفاضية
```

## طريقة تشغيل المشروع

```bash
cd quotely_mvvm
flutter pub get
flutter run
```

## مبادئ MVVM المطبقة

| الطبقة | المسؤولية |
|--------|-----------|
| **Model** | بيانات الاقتباس فقط — `Quote` |
| **Repository** | مصدر البيانات، singleton، interface قابل للاستبدال |
| **ViewModel** | منطق العمل، state، `ChangeNotifier` — لا يعرف شيء عن الـ UI |
| **View (Screen)** | يستمع للـ ViewModel، يعرض البيانات فقط |
| **Widgets** | مكونات خام قابلة لإعادة الاستخدام، تستقبل callbacks فقط |
