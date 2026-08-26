function Hello_1(){
  return(
    <p>컴포넌트, 안녕하세요</p>
  );
}

function Hello_2(props){
  return(
    <div>
      <p>안녕하세요, {props.name}, props사용</p>
    </div>
  )
}

function Price({price, obj}){
  return(
    <div>
      <p>{obj}의 가격 : {price}원</p>
    </div>
  )
}

function ProfileCard ({name, id, age}){
  return(
    <div>
      <h2>profile</h2>
      <ul>
        <li>이름 : {name}</li>
        <li>ID : {id}</li>
        <li>나이 : {age}</li>
      </ul>
    </div>
  )
}

function Button(button){
  return(
    <div>
      <button>{button.name}</button>
    </div>
  )
}
 
  function Box({children}){
    return(
      <div>
        {children}
      </div>
    );
  }
  
  function FunctionList({list}){
    return(
      <ul>
      {list.map((char, index) => (
        <li key={index}>{char}</li>
      ))}
    </ul>
);
}

function Book(props){
  return(
    <div>
    <h2>{props.title}</h2>
    <p>{props.author}</p>
    <p>{props.price}</p>
    </div>
  );
}

function Massege(props){
  return(
    <div>
      <h3>{props.name}</h3>
      <p>{props.massege}</p>  
    </div>
  );
}

function Button_2(props){
  return(
    <div>
      <button style={{backgroundColor: "blue", color : "white"}}>{props.name}</button>
    </div>
  );
}

function VideoCard({title, channel, views}){
  return(
    <div>
    <h2>{title}</h2>
    <p>{channel}</p>
    <p>조화수 : {views}</p>
    </div>
  );
}

function VideoList(Videos){
  return(
    <div>
      {Videos.map((value, index) =>(
        {key = index}
      ))}
    </div>
  );
}

function App(){
  const Lst = ["A", "B", "C"]

  return (
    <div>
      <h1>4주차 실습</h1><hr />
      <Hello_1 />
      <Hello_2 name="asd" />
      <Price price = "2000000" obj = "노트북" />
      <Price price = "220000" obj = "키보드" />
      <ProfileCard name = "AnWuHwan" age = {23}  id = "1234" />
      <Button name = "로그인"/>
      <Box>
        <p>children</p>
      </Box>
      <FunctionList list={Lst} />
      <Book title="타이틀" price = {10000} author = "저자" />
      <Massege name="이름" massege="HI" />
      <Button_2 name="파란색" />
      <videoList videos = {videos} />
    </div>
  );
} export default App;