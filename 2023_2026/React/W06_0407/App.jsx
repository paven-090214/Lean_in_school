import { useState } from "react";

function AddList(){
  const [addList, setAddList] = useState(["사과", "바나나"]);
  return(
    <div>
      <button onClick={() => setAddList([...addList,"포도"])}>포도 배열 추가</button>
      <p>현재 배열</p>
      {addList.map((value, index) => (
        <p key={index}>{value}</p>
      ))}
    </div>
  );
}

function TextEvent(){
  const [text, setText] = useState("");
  return(
    <div>
      <p>현재 입력된 텍스트 : {text}</p>
      <input type="text" onChange={(e) => setText(e.target.value)} />
    </div>
  );
}

function LikeButton(){
  const [like, setLike] = useState(false);
  return(
    <div>
      <button onClick={() => setLike(!like)}>{like ? "좋아요 취소(true)" : "좋아요(false)"}</button>
    </div>
  );
}

function Functionfilter(){
    const items = [
  { name: "사과", type: "과일" },
  { name: "바나나", type: "과일" },
  { name: "콜라", type: "음료" },
  { name: "주스", type: "음료" },
];
  const [filter, setFilter] = useState("전체");
  const itemFilter = 
    filter === "전체" ? items : items.filter(item => item.type === filter)
  return(
    <div>
      <button onClick={() => setFilter("전체")}>전체</button>
      <button onClick={() => setFilter("음료")}>음료</button>
      <button onClick={() => setFilter("과일")}>과일</button>
      <h3>현재 필터 : {filter}</h3>
      {itemFilter.map((value, index) => (
        <p key = {index}>{value.name} : {value.type}</p>
      ))}
    </div>
  )

}


function ClickCount(){
  const [Click, setClick] = useState(0);
  return(
    <div>
      <p>현재 카운트 : {Click}</p>
      <button onClick={() => setClick(Click + 1)}>카운트 증가</button>
      <button onClick={() => setClick(Click + -1)}>카운트 감소</button>
      <button onClick={() => setClick(0)}>카운트 초기화</button>
    </div>
  );
}

function TodoData(){
  const [list, setList] = useState([]);
  const [insertList, setInsertList] = useState("");
  const AddList = () => {
    setList([...list, insertList])
    setInsertList("");
  }
  return(
    <div>
        <input type="text" value = {insertList} onChange={(e) => setInsertList(e.target.value)} />
        <button onClick={() =>{AddList()}}>리스트 추가</button>
    <h3>현재 리스트</h3><hr />
    {list.length === 0 ? 
      (<h4>현재 리스트가 비어있습니다.</h4>) : (
        <ul>
        {list.map((value, index) => (
          <li key={index}>{value}</li>
        ))}
      </ul>
    )}
    </div>
);
}

function App(){
  
  return(
    <div>
      <TodoData />
    </div>
  );
}
export default App;