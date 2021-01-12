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

## Permission
- 이미지 또는 동영상을 `사진 라이브러리` 에 저장하기 위해서는 해당 라이브러리에 대한 액세스 권한을 요청해야 함.
- `Info.plist` 에서 권한에 대한 설정
    <br>

    ![](https://images.velog.io/images/sangwoo24/post/92abc838-2378-48c4-ac75-b0fd924dbc95/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-01-11%20%EC%98%A4%ED%9B%84%204.12.48.png)

    - Camera 사용 및 Library 사용에 대한 권한 설정
