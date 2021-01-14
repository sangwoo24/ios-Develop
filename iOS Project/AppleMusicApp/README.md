# Apple Music App
- ### `AVFoundation` 을 이용해 Apple Music App을 만들어보자.!

<br>

### 주요 실습 내용
- `mp3 file` 을 `URL` 형식으로 불러와 `AVPlayerItem` 으로 치환 후 사용
- `AVPlayerItem` 을 원하는 `Object` 로 변환
- `UICollectionView` 사용
- `MVVM` 패턴 적용
- `modal` 형식의 `view` 전환
- `AVPlayer` 의 정지, 재생, seek 등의 사용


<br>

### 실행 결과

<br>

![](https://images.velog.io/images/sangwoo24/post/00f8b204-5922-441f-83d6-0bf372d7ac85/ezgif.com-video-to-gif.gif)

- `HomeView` : `mp3 file` 정보를 받아 HeaderView 와 CollectionView 를 구성.
- `Player View` : 클릭한 해당 `mp3 file` 의 정보를 AVPlayer를 통해 재생한다.

