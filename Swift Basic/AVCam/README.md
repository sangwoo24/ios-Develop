# AVCam 
- [Apple Devleoper 바로가기](https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture/avcam_building_a_camera_app)

<br>

## Media Capture
![](https://images.velog.io/images/sangwoo24/post/7ab18ed2-efb9-4b86-ba24-f319428c8833/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-01-11%20%EC%98%A4%ED%9B%84%203.52.09(3).png)

- `AVCaptureDevice` : 카메라, 마이크 등의 장치
- `AVCaptureSession` : Input Data 를 Output 으로 전환시켜주는 중간 다리
- `AVCaptureDeviceInput` : Device 에서 Session 으로 Media 를 제공
- `AVCaptureOutput` : 출력 Data 를 저장

<br>

## Configure a Capture Session
```swift 
private let session = AVCaptureSession()
```
- `AVCaptureSession` : Processing 을 위한 적절한 Output 을 생성하기 위해 Data를 마샬링 한다.
  - `marshaling?` : 한 객체의 메모리에서 표현방식을 저장 또는 전송에 적합한 다른 데이터 형식으로 변환하는 과정.

- Output은 `Movie file` 또는 `still photo` 가 된다.
- Default : 후면카메라
- `Preview view` 로 streaming 하기 위해 `capture session` 을 구성한다.
<br>

![](https://images.velog.io/images/sangwoo24/post/a1665915-7e89-4bc1-a77a-6d5b85fb4c65/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-01-13%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%202.25.04.png)
- `Session` 관련 작업은 `Session Queue` 에서 수행해야함.
- `세션 인터럽트 재 시작`, `카메라 모드 토글`, `카메라 전환`, `미디어 파일 쓰기` 등이 `Session Queue` 에서 수행됨.

<br>

## Permission
- 이미지 또는 동영상을 `사진 라이브러리` 에 저장하기 위해서는 해당 라이브러리에 대한 액세스 권한을 요청해야 함.
- `Info.plist` 에서 권한에 대한 설정
    <br>

    ![](https://images.velog.io/images/sangwoo24/post/92abc838-2378-48c4-ac75-b0fd924dbc95/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-01-11%20%EC%98%A4%ED%9B%84%204.12.48.png)

    - Camera 사용 및 Library 사용에 대한 권한 설정
