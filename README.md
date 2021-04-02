# CoachMyBody-App

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

## Conventions
### constants

- 테마(app_theme.dart)
    - 추후에 제공할 수 있는 Dark 모드를 위해 앱 테마를 따로 빼놓음
- 이미지경로(assets.dart)
    - lib 밖에 assets 폴더(이미지 저장할 폴더)에 해당 이미지 경로를 입력하기 위한 클래스
- 색(colors.dart)
    - 말 그대로 색 저장 클래스
- dimens.dart
    - padding, margin 값 저장 클래스

### data

- local
    - 앱 내부 DB 접근 관련 폴더
- sharedpref
    - 앱의 SharedPreferences 접근 관련 폴더

### models

- DB 테이블에 맞게 모델을 만들 예정

### providers

- model 기반 가변 데이터, provider 생성을 위한 폴더

### ui

- 네비게이션바(4개)에 맞춰서 폴더 구성
- 각 네비게이션 항목에 맞는 폴더에는 해당 Screen에 보여줄 페이지 모두 관리

### util

- 암호화 등 여러가지 기능 추가 예정

### widget

- Custom Widget (버튼, 카드 등)을 관리하는 폴더
