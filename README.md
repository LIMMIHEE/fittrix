# 개요

<img width="800" alt="image" src="https://github.com/LIMMIHEE/fittrix/assets/48482259/8699b33c-e4c4-4fc3-ad62-d4ebf2731da6">


### 프로젝트 목적 및 배경

피트릭스사의 사전과제로, Flutter를 통해 개발한 운동 기록 관리 어플.

사용 유저는 카테고리별로 자신의 운동에 대한 메세지를 저장할 수 있습니다.

<br/>

### **프로젝트 기간**

**총 2일**

**요구 사항 분석 및 세부 디자인** 

2023.08.24

**개발** 

2023.08.26

<br/>


---

<br/>

# 문제 해결을 위한 아이디어 요약

### 프로세스

- 요구사항을 기반으로 MockAPI 및 앱 구조 구성
- 앱 디자인 세부화
    - 디자인을 토대로 동작 구성 및 아이디어 정리
    - [피그마 링크](https://www.figma.com/file/szIbxk0bh0gNqVvWoleU60/fittrix?type=design&node-id=0%3A1&mode=design&t=iTk2IlRCHhUD0tu2-1)
- 기타 이미지 자료 수집
- 초안 기획 및 디자인 기반으로 개발 진행


<br/>

### 작업 리스트

- Clean Architecture 적용
- 고정 Navigation Bar와 실제 유동적 스크린 분리
- 순차적 제공 동영상 재생
- 로그인
    - 로그인 유/무에 따른 기능 제한
        - 로그인 전 기능 터치시 스낵바를 통한 사용 불가 안내
- 운동 기록 하기
    - 아코디언식 하위 메뉴 띄우기
    - 별도의 기록 입력 화면 제작
        - 운동 카테고리별 동작 참조 이미지 띄우기
        - 운동 메세지 입력 받기
            - 해당 메세지 미입력시 스낵바를 통한 기록 불가 안내
- 운동 기록 보기
    - 아코디언식 하위 메뉴 띄우기
    - 선택한 운동별 기록 띄우기
    - 내림차순 인피니티 스크롤
        - 비어있는 운동의 경우 별도의 안내 텍스트 띄우기
- 단위 테스트 적용

  

<br/>


---

<br/>

### API 설계

- Mockapi.io를 통해 아래에 관한 Mock API 제작.
    - 운동 카테고리 (GET)
 
    -  | name (String) | imageUrl (String) | imageCopyright (String) | id (String) |
        | --- | --- | --- | --- |
        | 운동 카테고리 명 | 운동 참고 이미지 URL | 이미지 출처 | 고유 ID |
        

        
        ```
        {
          "name": "런지",
          "imageUrl": "https://img.freepik.com/free-photo/young-healthy-fitness-woman-doing-lunge-exercises_171337-14004.jpg?w=2000&t=st=1692882330~exp=1692882930~hmac=6e728553c725c07d43c5bde0771601a9a981f26813fd56171676bbd5d8d9d1ac",
          "imageCopyright": "Freepik - drobotdean 작가",
          "id": "1"
         }
        ```
        
    
    - **운동 기록  (GET, PUT)**
    -   | createTime (dateTime) | exerciseType (String) | message (String) | id (String) |
        | --- | --- | --- | --- |
        | 기록 시간 | 기록 운동 타입 | 기록 메세지 | 고유 ID |
    
    
        
        ```
        {
          "createTime": "2054-05-22T04:10:42.601Z",
          "exerciseType": "exerciseType 1",
          "message": "message 1",
          "id": "1"
         }
        ```
        
<br/>

---

<br/>

# 개발 환경

### FE

- Flutter
    - 상태 관리 Provider
    - API 호출  Dio
- Dart

<br/>

### BE

- Mockapi.io

<br/>

### 환경 구성

- MAC OS 13.4(22F66)
- Flutter (Channel stable, 3.10.5)
- Android Studio (version 2022.1)
- Android toolchain - develop for Android devices (Android SDK version 33.0.2)
- Xcode - develop for iOS and macOS (Xcode 14.3)

<br/>

---

<br/>

# 프로젝트 빌드 & 테스트 & 실행 방법

```
  // 에뮬레이터 혹은 시뮬레이터 실행 후 터미널을 통해 아래와 같이 입력합니다.

  flutter run
```

<br/>

---

# 미해결 이슈

<br/>


- 로그인 화면과 기록 작성 화면의 `TextEditingController`의 동작 구성은 거의 같음에도 최적화 진행하지 못하였습니다.
- 운동 기록하기 Provider의 GetWokout Unit Test를 작성하지 못하였습니다.
