
import React from 'react';
function WeaherSelect({city, setCity}) {
    return(
        <div className="weather-container">
          <label htmlFor="city-select">도시 선택:</label>
          <select 
            className="city-select" 
            value={city} 
            onChange={(e)=>setCity(e.target.value)}
          >
            <option value="Seoul">서울</option>
            <option value="New york">뉴욕</option>
            <option value="Tokyo">도쿄</option>
          </select>
        </div>
    );
}

export default WeaherSelect;