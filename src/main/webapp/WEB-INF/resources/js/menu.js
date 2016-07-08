$(document).ready(function() {
	
	$(".hNav li").click(function() {
		var item = $(this).attr("class");
		var url = "/HuCloud/attack/";
		if(item == "1") {
			url += "injection";
		}
		else if(item == "2") {
			url += "password";
		}
		else if(item == "4") {
			url += "xss";
		}
		else if(item == "5") {
			url = "/HuCloud/board/list";
		}
		else if(item == "7") {
			url = "/HuCloud/encrypto/password";
		}
		else if(item == "8") {
			url += "accessForgery";
		}
		else if(item == "9") {
			url += "openredirect";
		}
		else if(item == "10") {
			url += "exception";
		}
		else if(item == "11") {
			url += "encapsulation";
		}
		else if(item == "12") {
			url += "etc";
		}
		else {
			alert("잘못된 접근입니다!");
			return;
		}
		location.href = url;
	});
	
});
