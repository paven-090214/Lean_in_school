import React, {useState, useEffect} from 'react';
import {fetchWeatherData} from './api/WeatherApi';
import WeatherDisplay from './Components/WeatherDisplay';
import WeatherSelect from './Components/WeatherSelect';
import './styles/WeatherApp.css';

function App() {
    const [city, setCity] = useState('Seoul');
  const [weather, setWeather] = useState(null);
  const [loading, setLoading] = useState(false);

    useEffect(() => {
    setLoading(true); // API 요청 시작 전에 로딩을 true로!

    fetchWeatherData(city).then((data) => {
      setWeather(data);
      setLoading(false); // 데이터 받아오면 로딩을 false로!
    });
  }, [city]);

  return(
    <div className=".city-select">
      <h2>🌤 실시간 날씨 대시보드</h2>
      <WeatherSelect city ={city} setCity={setCity} />
      <hr />
      <WeatherDisplay
      loading={loading}
      weather={weather}
      city={city} />
    </div>
  );
}

export default App;