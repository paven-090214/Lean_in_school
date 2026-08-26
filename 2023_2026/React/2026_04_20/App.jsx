import { useState } from "react";

function App() {
  const [todoList, setTodoList] = useState([]);
  const [inputText, setInputText] = useState("");
  const [serchText, setSerchText] = useState("");

  const addList = () => {
    const newTodo = {
      index: Date.now(),
      done: false,
      text: inputText
    };
    setTodoList([...todoList, newTodo]);
    setInputText("");
  };

  const doneToggle = (num) => {
    const newArr = todoList.map((object) =>
      num == object.index ? { ...object, done: !object.done } : object
    );
    setTodoList(newArr);
  };

  const remove = (num) => {
    const newArr = todoList.filter((value) => num != value.index);
    setTodoList(newArr);
  };

  const removeAll = () => {
    setTodoList([]);
  };

  const doneAll = () => {
    const newArr = todoList.map((value) =>
      value.done ? value : { ...value, done: !value.done }
    );
    setTodoList(newArr);
  };

  const searchResult =
    serchText === ""
      ? todoList
      : todoList.filter((value) => value.text.includes(serchText));

  return (
    <div>
      <h2>할 일 추가</h2>
      <input
        type="text"
        onChange={(e) => setInputText(e.target.value)}
        value={inputText}
      />
      <button onClick={addList}>추가</button>
      <button onClick={removeAll}>전체 삭제</button>
      <button onClick={doneAll}>전체 완료</button>
      <hr />

      <h3>리스트 검색</h3>
      <input
        type="text"
        value={serchText}
        onChange={(e) => setSerchText(e.target.value)}
      />
      <hr />

      {searchResult.length == 0 ? (
        <h2>검색 결과가 없어요</h2>
      ) : (
        <ul>
          {searchResult.map((obj) => (
            <li key={obj.index}>
              <label>
                <input
                  type="checkbox"
                  onChange={() => doneToggle(obj.index)}
                  checked={obj.done}
                />
                {obj.text} - {obj.done ? "완료" : "미완료"} -
                <button onClick={() => remove(obj.index)}>삭제</button>
              </label>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default App;