import React from 'react';

function WeatherDisplay({city, loading, weather}) {
    if(loading) {
        return <p>🔄 날씨 정보를 가져오는 중입니다...</p>
    }

    if (weather) {
        return (
            <div>
                <h3>📍 {city}의 현재 날씨</h3>
                <p>🌡 기온: <strong>{weather.temp}°C</strong></p>
                <p>📝 상태: {weather.condition}</p>
                <p>💧 습도: {weather.humidity}%</p>
            </div>
        )
    }

    else 
        return <p>데이터가 없습니다.</p>
}

export default WeatherDisplay;