import {useState} from "react"

function OutPut(data){
  const [arr, setArr] = useState(data.dataList)
  const [filter, setFilter] = useState("all");
  const BlueArchive = 
    filter == "all" ?
      arr :
      arr.filter((obj) => obj.school == filter)

  const FunctionSelect = (index) =>{
    const newArr = arr.map((value) =>(
      index == value.id ? {...value, select : !value.select} : value
    ))
    setArr(newArr)
  }

  return(
    <div>
      <button onClick={()=>setFilter("all")}>전체</button>
      <button onClick={()=>setFilter("트리니티")}>트리니티</button>
      <button onClick={()=>setFilter("게헨나")}>게헨나</button>
      <button onClick={()=>setFilter("밀레니엄")}>밀레니엄</button>
      <ul>
        {BlueArchive.map((value) =>(
          <li key={value.id}>
            <div>
              <h3>학교 : {value.school}</h3>
              <p>이름 : {value.name}</p>
              <p>타입 : {value.role}</p>
              <p>공격 타입 : {value.attack}</p>
              <button onClick={()=>FunctionSelect(value.id)}>{value.select ? "♥️" : "🖤"}</button>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
}

function App() {

  const Character = [
    {select : false, school : "밀레니엄", name : "Yuuka", role : "striker", attack : "관통", id : 1},
    {select : false, school : "트리니티", name : "Mari", role : "special", attack : "신비", id : 2},
    {select : false, school : "게헨나", name : "Ako", role : "special", attack : "신비", id : 3},
    {select : false, school : "트리니티", name : "Mika", role : "striker", attack : "관통", id : 4},
  ]
  return(
    <div>

      <OutPut dataList={Character} />
    </div>
  );
}
export default App;