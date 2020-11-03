### React project directory

> reference : [프로젝트 디렉토리 구조 파악하기](https://uhou.tistory.com/168)

- build: npm run build 커맨드를 통해 생성된 react 배포 폴더
- node_modules: npm install 을 통해 설치된 모듈들이 위치하는 폴더
- public: static 자원이 위치하는 폴더
- src: components / containers / pages / store 등이 위치하는 폴더
- package: version, dependencies, proxy 등의 정보가 들어있는 파일

#### /src

- components: 컴포넌트 파일들이 위치하는 폴더
- containers: 컨테이너 파일들이 위치하는 폴더, 주로 state를 props로 매핑하는 코드들이 위치
- pages: Routing을 위한 페이지 파일들이 위치하는 폴더
- ~~store: redux 작업을 위한 폴더, 내부에 actions, reducers 폴더 존재~~
