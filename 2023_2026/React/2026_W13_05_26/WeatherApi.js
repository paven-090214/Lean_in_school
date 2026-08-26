// [수정] 실제 OpenWeatherMap API 연동 코드
const API_KEY = '1aacfd41f87c727f0bfce24eec5863e6'; 

export const fetchWeatherData = (city) => {
  // 각 도시 이름에 맞는 API 요청 URL 생성 (미터법 단위 섭씨온도 셋팅: units=metric)
  const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric`;

  // 실제 서버에 요청을 보냅니다 (fetch는 기본적으로 Promise를 리턴합니다)
  return fetch(url)
    .then((response) => {
      // 서버 응답이 실패(404 등)했을 경우 에러 처리
      if (!response.ok) {
        throw new Error('날씨 데이터를 가져오는 데 실패했습니다.');
      }
      return response.json(); // JSON 형태로 파싱
    })
    .then((data) => {
      // 💡 [중요] 실제 API가 주는 복잡한 데이터 구조를 우리가 만든 컴포넌트 형식에 맞게 가공(Mapping)합니다.
      return {
        temp: Math.round(data.main.temp), // 온도를 반올림하여 정수로
        condition: translateCondition(data.weather[0].main), // 날씨 상태 번역
        humidity: data.main.humidity
      };
    })
    .catch((error) => {
      console.error("API Error:", error);
      return null; // 에러 발생 시 null 리턴
    });
};

// 영문 날씨 상태를 기존 컴포넌트가 이해할 수 있는 한글로 변환해주는 보조 함수
const translateCondition = (condition) => {
  const mapping = {
    Clear: '맑음',
    Clouds: '흐림',
    Rain: '비',
    Drizzle: '이슬비',
    Thunderstorm: '천둥번개',
    Snow: '눈'
  };
  return mapping[condition] || condition;
};