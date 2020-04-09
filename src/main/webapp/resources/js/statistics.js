
var check = document.getElementById('jObj').value;

if(check == "undefined" || check == null || check == ""){
	var Data = {
		  "사과": 500,
		  "호두": 200,
		  "블루베리": 666,
		  "치즈": 54,
		  "딸기": 120
		};
	var charValue = "donut";
}else{	
	var charValue = document.getElementById('charValue').value; // charValue : 어떤 차트인지 나타내는 값
	var Data = document.getElementById('jObj').value;			// 차트에 쓰일 데이터를 가져온다.
	Data = JSON.parse(Data);
}
//
var Data = {
		  "사과": 500,
		  "호두": 200,
		  "블루베리": 666,
		  "치즈": 54,
		  "딸기": 120
		};
var charValue = "donut";
//
var chartDonut = c3.generate({
  bindto: "#chart",
  data: {
    json: [Data],
    keys: {
      value: Object.keys(Data),
    },
    type: charValue
  },
  donut: {
    title: "파이의 종류",
  },
});

// 차트 그리기 실행
var chartDonutColors = chartDonut.data.colors();

$("#text-apple").css("color", chartDonutColors["사과"]);
$("#text-walnut").css("color", chartDonutColors["호두"]);
$("#text-berry").css("color", chartDonutColors["블루베리"]);
$("#text-cheese").css("color", chartDonutColors["치즈"]);
$("#text-strawberry").css("color", chartDonutColors["딸기"]);

	
	