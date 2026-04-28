import React, { useState } from "react";
import "./App.css";

export default function App() {
  const today = new Date();

  const [currentDate, setCurrentDate] = useState(today);
  const [userSelect, setUserSelect] = useState(today);
  const [userInput, setUserInput] = useState("");
  const [todoList, setTodolist] = useState([]);

  const year = currentDate.getFullYear();
  const month = currentDate.getMonth();

  const days = ["일", "월", "화", "수", "목", "금", "토"];

  const first_day = new Date(year, month, 1).getDay();
  const last_date = new Date(year, month + 1, 0).getDate();

  const changeMonth = (offset) => {
    setCurrentDate(new Date(year, month + offset, 1));
  };

  const handleDateClick = (userClick) => {
    if (!userClick) {
      return;
    }

    setUserSelect(new Date(year, month, userClick));
  };

  const day = [];

  for (let i = 0; i < first_day; i++) {
    day.push(null);
  }

  for (let i = 1; i <= last_date; i++) {
    day.push(i);
  }

  while (day.length % 7 !== 0) {
    day.push(null);
  }

  const week = [];

  for (let i = 0; i < day.length; i += 7) {
    week.push(day.slice(i, i + 7));
  }
  
    const formatDate=(date) =>{
      const y = date.getFullYear();
      const m = String(date.getMonth() + 1).padStart(2, "0");
      const d = String(date.getDate()).padStart(2, "0");
      return `${y}-${m}-${d}`;
    }

  const addList =()=>{
    const newObj = {
      date : formatDate(userSelect),
      index : Date.now(),
      todo : userInput,
      done : false,
    };
    setTodolist([...todoList,newObj]);
    setUserInput("");
  }
  const toggleCheck=(date)=>{
    const newArr = todoList.map((object)=>(
      date == object.index ? {...object, done : !object.done} : object
    ))
    setTodolist(newArr);
  }

  const remove=(key)=>{
    const newArr = todoList.filter((obj)=>key != obj.index)
    setTodolist(newArr)
  }

  
  
  const groupedTodo = todoList.reduce((groups, todo)=>{
    if(!groups[todo.date]) {
      groups[todo.date] = [];
    }
    groups[todo.date].push(todo);
    return groups;
  },{});

  return(
    <div>
      <h1>{year}년 {month + 1}월</h1>
      <div className="layout">
        <section className="left-panel">
          <button onClick={()=>changeMonth(-1)}>⬅️</button>
          <button onClick={()=>changeMonth(1)}>➡️</button>
          {/*달력 출력*/}
          <table>
            <thead>
              <tr>
                {days.map((days, index) =>(
                  <td key={index}>{days}</td>
                ))}
              </tr>
            </thead>
            <tbody>
              {week.map((week_date, weekNum)=>(
                <tr key={weekNum}>
                  {week_date.map((date, dateNum)=>(
                    <td 
                    className="dates" 
                    key={dateNum}
                    onClick={()=>handleDateClick(date)}>
                      {date}</td>
                  ))}
                </tr>
              ))}
            </tbody>
            </table>
            <div className="input_box">
              <h3>선택된 날짜 : {userSelect.getFullYear()}년 {userSelect.getMonth() + 1}월 {userSelect.getDate()}일</h3>
              <input type="text" value={userInput} onChange={(e=>setUserInput(e.target.value))}/>
              <button onClick={addList}>일정 추가</button>
            </div>
        </section>
        <section className="right-panel">
          <h2>일정</h2>
            {Object.entries(groupedTodo).map(([date, todos])=>(
              <div key={userTodo.index}>
                <label><input type="checkbox" onChange={()=>toggleCheck(userTodo.index)}/>
                <h4>{date}일</h4>
                  {userTodo.todo} - {userTodo.done ? "완료" : "미완료"} - 
                  <button onClick={()=>remove(userTodo.index)}>삭제</button>
                </label>
              </div>
            ))}

        </section>
      </div>

    </div>
  );
}