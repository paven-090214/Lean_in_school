import './App.css';

function Hello_1(hi){
  return <h2 className = "Hello_1">안녕하세요, {hi.name}님</h2>;
}

function Price({name, price}){
  return(
    <div>
      <p>{name}의 가격은 {price}입니다.</p>
    </div>
  )
}

function Games({arr}){
  return(
    <div>
      <ul>
        {arr.map((value, index) => (
        <li key = {index}>{value}</li>
        ))}
      </ul>
    </div>
  );
}

function Ch_1({children}){
  return(
    <div>
      {children}
    </div>
  );
}

function Button_1({text}){
  return(
    <div>
      <button className = "Button">{text}</button>
    </div>
  );
}




function Hello_2(){
  return <p>안녕하세용</p>;
}

function Hello_3({name}){
  return <p>{name}님, 안녕!</p>
}

function Price_2({price, name}){
  return(
    <div>
      <p>이름 : {name}, 가격 : {price}</p>
    </div>
  );
}

function Profile({age, name, id}){
  return(
    <div>
      <h2>학생 프로필</h2>
      <p>이름 : {name}</p>
      <p>나이 : {age}</p>
      <p>id : {id}</p>
      <hr />
    </div>
  )
}

function Button_2({text}){
  return(
    <div>
      <button  className ="Button">{text}</button>
    </div>
  )
}

function Box({children}){
  return(
    <div>
      <p>{children}</p>
    </div>
  )
}

 function  Music({Lst}){
  return(
    <div>
      {Lst.map((name, index) => (
        <p key = {index}>- {name}</p>
            ))}
    </div>
  )
 }

function Book(props){
  return(
    <div>
      <p>책의 제목 : {props.name}</p>
      <p>책의 저자 : {props.author}</p>
      <p>책의 등록일 : {props.dt}</p>
    </div>
  )
}

function Massege({name, massege}){
  return(
    <div>
      <p>{name}님께, {massege}</p>
    </div>
  )
}

function Button_3({text}){
  return(
    <button style = {{backgroundColor : "yellow"}}>{text}</button>
  )
}

function Blue_Archive_Obj({school, role, attack}){
  return(
    <div>
      <p>학원 : {school}</p>
      <p>역할군 : {role}</p>
      <p>공격 타입 : {attack}</p>
    </div>
  )
}

function Blue_Archive({Blue_ArchiveList}){
  return(
    <div>
      {Blue_ArchiveList.map((value, index) =>(
        <Blue_Archive_Obj key = {index} school = {value.school} role = {value.role} attack = {value.attack} />
      ))}
    </div>
    );
}

function App(){

  const add_1 = (a, b) => a+b;
  const add_2  = (a, b) => {
    return a + b;
  }
  function add_3(a, b){
    return a + b;
  }
  const Lst = ["LimbusCompany", "Wauthering Waves", "Bleu Archive"]
  const MusicList = ["荊の薔薇 - Roses in Thorns", "命をくれよ - Give Me Life", "もう何もいらない未来 - Against All Answers"]
  const Blue_Archive_List = [
    {school : "밀레니엄", role : "탱커", attack : "관통"},
    {school : "아비도스", role : "서브딜러", attack : "폭발"},
    {school : "트리니티", role : "메인딜러", attack : "관통"}
  ];
  
  return(
    <div>
      <h1>놀이터</h1>
      <Hello_1 name = "안수환"/>

      <Price name = "키보드" price ="200000" />

      <Games arr = {Lst} />

      <Ch_1>
        <h2>React : Class = className</h2>
        <p>childreb</p>
      </Ch_1>

    <Button_1 text = "아이디" />
    <Button_1 text = "비밀번호" />
    <hr />
    <h1>실습</h1>
    <h2>실습 1: 기본 컴포넌트 만들기</h2>
    <Hello_2 />

    <h2>실습 2: Props 활용</h2>
    <Hello_3 name="안수환" />

    <h2>실습 3: 재사용 가능한 컴포넌트</h2>
    <Price_2 name ="컴퓨터" price ={4500000} />

    <h2>실습 4: 프로필 카드 만들기</h2>
    <Profile name = "안수환" id = "1234" age = "23" />
    <Profile name = "이시현" id = "4321" age = "22" />

    <h2>실습 5: 버튼 컴포넌트 만들기</h2>
    <Button_2 text = "로그인" />

    <h2> 실습 6: children 활용하기</h2>
    <Box>
      <p> Box 태그에 children 출력 성공</p>
    </Box>

    <h2>실습 7: props로 배열 데이터를 전달해서 리스트 출력</h2>
    <Music Lst = {MusicList}/>

    <h2>실습 과제 : 1</h2>
    <Book name = "React 알아보기" author = "안수환" dt ="2021_02_22"/>

    <h2>실습 과제 : 2</h2>
    <Massege name = "시현" massege = "이번 주말에 보자" />
    <Massege name = "진호" massege = "퇴근 몇신데" />
    <Massege name = "정호" massege = "저녁ㄱ?" />

    
    <h2>실습 과제 : 3</h2>
    <Button_3 text = "노란색 버튼"/>

    <h2>실습 과제 : 4</h2>
    <Blue_Archive Blue_ArchiveList = {Blue_Archive_List} />
    </div>
  )
} export default App;