# URLSession
- Overview

    > An object that coordinates a group of related, network data-transfer tasks.<br>
    -> 관련된 네트워크 데이터 전송 task 그룹을 조정하는 개체 <br><br>
    즉, 다양한 인터넷 프로토콜과 상호작용 하여 데이터를 송, 수신 하기위해 사용하는 Object 이다. 앱이 정지된 상태에서도 해당 API를 이용하여 백그라운드로 다운로드를 수행할 수 있다. 

- 앱은 하나 이상의 Session을 생성한다. 이 Session은 관련 데이터 전송 task 들을 관리하게 된다.
- 각 세션 내에서 앱은 특정 URL에 대한 요청을 나타내는 task들을 추가한다.<br><br>


    ![](https://images.velog.io/images/sangwoo24/post/09a91816-6bed-45ca-aa86-d1ee60ef2f56/1.PNG)

> - URLSessionConfiguration : URLSession 생성 <br>
> - URLSessionTask : URLSession 이 Task를 생성한 후 Server와 통신한다<br>
> - Delegate : 네트워킹의 중간 과정을 살펴볼 수 있다

<br><br>

## URLSession의 Request와 Response
- URLSession은 다른 HTTP 통신과 마찬가지로 `Request` 와 `Response` 의 구조를 가진다.<br>

    ### Request
    1. `URL` 객체를 통해 직접 통신
    2. `URLRequest` 객체를 만든 뒤, 옵션을 설정하여 통신
    
    ### Response
    1. Task의 `Completion Handler` 형태로 response를 수신
    2. `URLSessionDelegate` 를 통해 지정된 메소드를 호출하는 형태로 response를 수신

<br>

- 간단한 Response에서는 `Completion Handler` 를 사용하지만, 앱이 Background 상태로 들어갈 때에도 파일 다운로드를 지원하도록 설정하거나, 인증과 캐싱을 default 옵션으로 사용하지 않는 상황과 같은 경우에는 `Delegate` 패턴을 사용한다.

<br><br>

## URLSession Session Type

> URLSession class는 기본적으로 싱글톤 객체인 `shared session`이 존재한다. 하지만, 다른 종류의 Session을 사용 할 경우 아래의 세 가지 Configuration중 하나를 사용하여 URLSession을 만든다.

- Default session : 기본적인 Session으로 디스크 기반 캐싱을 지원한다.
- Ephemeral session : 캐시, 쿠키, 사용자 인증 정보 등을 디스크에 쓰지 않는다.
- Background session : 앱이 실행되지 않는 동안 백그라운드에서 컨텐츠 업로드 및 다운로드를 수행할 수 있다.
<br><br>


## URLSession Task Type

> Task 객체는 일반적으로 Session 객체가 서버로 Request를 보낸 후, Response를 받을 때 URL 기반의 내용들을 Retrieve 하는 역활을 한다.

- Data Task : NSData Object 형태로 데이터를 송, 수신 하며, Background를 지원하지 않는다.
- Upload Task : Data를 File의 형태로 전환 후 Upload하는 Task 객체로, 백그라운드로 업로드를 지원한다.
- Download Task : Data를 File의 형태로 전환 후 Download하는 Task 객체로, 백그라운드 업로드 및 다운로드를 지원한다.
<br><br>
