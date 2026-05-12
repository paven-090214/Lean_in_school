import {useState, useEffect} from "react";

export default function App() {
  const [count, setCount] = useState(1);
  const [name, setName] = useState("");
  const handlechange = () =>{
    setCount((prev)=> prev + 1);
  }

  const handleInputChange = (e)=>setName(e.target.value);

  //count 렌더링 될때마다 실행됨
  // useEffect(()=>{
  //   console.log("렌더링 됨");
  // }, [count]);
  //마운팅 렌더링 될때마다 실행됨
  useEffect(()=>{
    console.log("렌더링 됨");
  }, []);


  return(
    <dibv>
      <p>{count}</p>
      <button onClick={handlechange}>업데이트</button>
      <div>
        <input type="text" value={name} onChange={handleInputChange}/>
        <div>
          Name : {name}
        </div>
      </div>
    </dibv>
  );
}
