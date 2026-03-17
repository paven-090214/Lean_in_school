function App(){
  const user = {
    name : "안수환",
    age : 23,
    arr : ["게임", "독서", "산책"],
    major : "컴퓨터소프트웨어공학과"
  };
  const {name:userName, age:userAge, arr:userArr, major:userMajor} = user;
  const message = `안녕하세요, ${userName}님`;
  return(
    <div>
      <h1 style={{color:"blue"}}>{message}</h1>
      <p style={{fontSize:"20px"}}>
        {userName}의 나이 : {userAge}<br />
        전공 : {userMajor}
      </p>
      
      <ul>
        {userArr.map((arr, index)=>(
          <li key={index}>{arr}</li>
        ))}
      </ul>
    </div>
  )

}
export default App;