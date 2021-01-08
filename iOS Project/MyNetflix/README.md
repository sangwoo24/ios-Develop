# MyNetflix
### ☃️ `네트워킹` 과 `iTunes search API` 를 이용해 나만의 Netflix 를 만들어보기

<br>

## 🍿 사용할 기능 및 API
- AVPlayer : 영화 Preview 재생 
- URLSession : iTunes search API 를 이용하여 영화 검색
- Codable : JSON Type의 Data를 Decoding

<br>

## 🏃🏻 프로젝트 세부내용

- ### Home View 구성
   ![](https://images.velog.io/images/sangwoo24/post/cf77ae92-5eef-440c-886f-54487ea7db88/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-01-06%20%EC%98%A4%ED%9B%84%207.44.09.png)   
   - TabBar 를 이용해 화면 구분
   - Home 에서는 UITableView 를 이용하지 않고 별도의 View 들로 구성
  
- ### Player View 구성
    ![](https://images.velog.io/images/sangwoo24/post/3a70ba3a-4170-4919-854d-404325bbe708/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-01-06%20%EC%98%A4%ED%9B%84%207.46.58.png)
    - Apple 에서 제공하는 AVPlayerLayer 을 이용해 PlayerView 구성
    - 그 위에 영상을 제어하는 ControllView 를 구성하여 영상 제어 

<br><br>

- #### 2021.01.05

    ![](https://images.velog.io/images/sangwoo24/post/befe10b8-5512-4afb-ba33-4ecf66f1b2d6/ezgif.com-resize.gif)

    <br>

- [x] `URLSession` 을 이용해 검색어에 대한 `Json Data` 을 가져오기
- [x] `Json Data` 를 원하는 Format으로 변환 후 사용
- [x] `AVPlayerLayer` 를 이용해 영상 출력

<br><br>

- #### 2021.01.08

    ![](https://images.velog.io/images/sangwoo24/post/76209f8f-aea2-482e-897a-dfe9abf50662/ezgif.com-resize.gif)

    <br>

- [x] `Firebase` 를 이용하여 검색어 를 `Realtime DB` 에 저장한 후, UITableView 를 통해 **`검색어 History 구현`**