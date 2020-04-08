
var pieData = {
		  사과: 500,
		  호두: 200,
		  블루베리: 666,
		  치즈: 54,
		  딸기: 120
		};
		var chartDonut = c3.generate({
		  bindto: "#pie",
		  data: {
		    json: [pieData],
		    keys: {
		      value: Object.keys(pieData),
		    },
		    type: "donut",
		  },
		  donut: {
		    title: "Hello my world",
		  },
		});

		var chartDonutColors = chartDonut.data.colors();
		$("#text-apple").css("color", chartDonutColors["사과"]);
		$("#text-walnut").css("color", chartDonutColors["호두"]);
		$("#text-berry").css("color", chartDonutColors["블루베리"]);
		$("#text-cheese").css("color", chartDonutColors["치즈"]);
		$("#text-strawberry").css("color", chartDonutColors["딸기"]);

document.getElementById('uPbtn1').onclick = function(){
		console.log("실행");
		location.href="goodStatistic.do";
}		

