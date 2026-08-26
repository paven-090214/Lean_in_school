import "./App.css";
import {useState} from "react";

export default function Calendar() {
  const today = new Date();
  const [page, setPage] = useState(today);
  const [userInput, setUserInput] = useState("");
  const [todoList, setTodoList] = useState([]);
  const [selectDay, setSelectDay] = useState(today);

  const day = ["일", "월", "화", "수", "목", "금", "토"];
  
  const year = page.getFullYear();
  const month = page.getMonth();

  const first_day = new Date(year, month, 1).getDay();
  const last_day = new Date(year, month + 1, 0).getDate();

  const days = []
  for (let i = 0; i < first_day; i ++) {
    days.push(null)
  }

  for (let i = 1; i <= last_day; i++) {
    days.push(i)
  }

  while (days.length % 7 != 0) {
    days.push(null)
  }

  const week = [];
  for (let i = 0; i < days.length; i += 7) {
    week.push(days.slice(i, i + 7));
  }
  
  const formatDate =(date)=>{
    const y = date.getFullYear();
    const m = String(date.getMonth() + 1).padStart(2, "0");
    const d = String(date.getDate()).padStart(2, "0");
    return `${y}-${m}-${d}`;
  }
  const selectedDateKey =formatDate(selectDay);
  const addTodo =()=>{
    if(!userInput.trim()) {
      return;
    }
    const newObj = {
      done : false,
      text : userInput,
      index : Date.now(),
      date : selectedDateKey,
    }
    setTodoList([...todoList, newObj]);
    setUserInput("");
  }

  const changeMonth=(offset)=>{
    setPage(new Date(year, month + offset, 1));
  }

  const userHandle=(id)=>{
    if (!id) {
      return;
    }
    setSelectDay(new Date(year, month, id));
    setUserInput("");
  }

  const toggle=(key)=>{
    setTodoList(
      todoList.map((obj)=>(
        obj.index == key ? {...obj, done : !obj.done} : obj
      ))
    )
  }

  const remove=(key)=>{
    setTodoList(
      todoList.filter((obj)=>
        obj.index != key
      )
    )
  }

  const hasTodo=(day)=>{
    if(!day) {
      return false;
    }
    const key = formatDate(new Date(year, month, day));
    return todoList.some((event)=>event.date === key);
  }

  const groupedTodo = todoList.reduce((group, todo)=>{
    if (group[todo.date] == null) {
      group[todo.date] = [];
    }
    group[todo.date].push(todo)
    return group;
  }, {})


  return(
    <div title="Calendar">
      <h1>나의 달력</h1>
      <h2>{page.getFullYear()}년 {page.getMonth() + 1}월</h2>
      <section title="left">
        <button onClick={()=>changeMonth(-1)}>◀️</button>
        <button onClick={()=>changeMonth(1)}>▶️</button>
        <table>
          <thead>
            <tr>
              {day.map((day, index)=>(
                <th key={index}>{day}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {week.map((week, week_index) =>(
              <tr key={week_index}>
                {week.map((days, days_index)=>(
                  <td key={days_index} onClick={()=>userHandle(days)}>
                    {days}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
        <h2>현재 : {selectedDateKey}</h2>
        <input 
          type="text" 
          value={userInput}
          onChange={(e)=>setUserInput(e.target.value)}
          onKeyDown={(e)=>{
            if (e.key === "Enter") {
              addTodo();
            }
          }}
        />
        <button onClick={addTodo}>일정 추가</button>
      </section>
      <section title="right">
            {todoList.length == 0 ?
            (<h3>일정이 비어있어요</h3>) :  (
            Object.entries(groupedTodo).map(([date, todos])=>(
              <div key={date}>
                <h4>{date}</h4>
                {todos.map((todo)=>(
                  <label key={todo.index}>
                    <input type="checkbox" onChange={()=>toggle(todo.index)}/>
                    {todo.done? <del>{todo.text}</del> : todo.text} - 
                    <button onClick={()=>remove(todo.index)}>❌</button>
                  </label>
                ))}
              </div>
            ))
          )
          }
      </section>
    </div>
  );
}