import {useState} from "react"

function App(){
  const [arr, setArr] = useState([]);
  const [text, setText] = useState("");
  
  const addArr = () => {
     if (text.trim() === "") return;
     const newTodo = {
      id: Date.now(),
      textList: text,
      done: false
    };
    setArr([...arr,newTodo]);
    setText("")
  }

  const toggleDone = (index) =>{//함수에 index 변수 생성
    const newArr = arr.map((todo) =>(//map을 사용해 todo명의 객체 복사
      todo.id === index ? {...todo, done : !todo.done} : todo//id와 index의 같은 값의 todo복사, done을 !done후 덮어씀
    ));
    setArr(newArr);//useState실행
    }
  
const removeTodo = (index) => {//filter은 배열에 조건식의 참인 값만 남겨서 새로운 배열을 만든다.
  const newArr = arr.filter((todo) => todo.id !== index);//index와 todo.id가 같지 않은 값만을 남겨서 새로운 배열을 만들고, id === index의 값은 제거한다.
  setArr(newArr);
};

  return(
    <div>
      <input type="text" value={text} onChange={(e) => setText(e.target.value)}/>
      <button onClick={() => {addArr()}}>추가</button>
      {arr.length === 0 ? (<h2>오늘 할 일이 없어요</h2>) : 
        (
        <ul>
          {arr.map((todoList) => (
            <li key = {todoList.id}>
              {todoList.textList}-
              <button 
                onClick={() => toggleDone(todoList.id)}>{todoList.done ? "미완료" : "완료"}
              </button>-
              <button onClick={() => removeTodo(todoList.id)}>
              삭제</button>
            </li>
          ))}
        </ul>
        )
    }
    </div>
  );
}export default App;