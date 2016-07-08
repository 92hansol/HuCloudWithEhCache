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
	
});
</script>
</head>
<body>
<c:import url="/common/loginTop" />
<div class="wrapper">
	<div class="vNav" style="float:left;">
		<ul>
			<li class="loginDeny tip" data-tip="">
				<a href="#loginDeny">
					로그인 시도 횟수 제한
				</a>
			</li>
			<li class="accessForgery tip" data-tip="">
				<a href="#accessForgery">
					잘못된 접근 제한
				</a>
			</li>
			<li class="exceptionControl tip" data-tip="">
				<a href="#exceptionControl">
					안전한 예외 처리
				</a>
			</li>
			<li class="encapsulationForgery tip" data-tip="">
				<a href="#encapsulationForgery">
					잘못된 캡슐화
				</a>
			</li>
			<li class="periodicPasswordChanges tip" data-tip="">
				<a href="#periodicPasswordChanges">
					주기적인 비밀번호 변경
				</a>
			</li>
		</ul>
	</div>
	<div class="w-spacer">&nbsp;</div>
	<div class="content" style="float:left;">
		<p>
			<a name="loginDeny">
				<b><span style="font-size:15pt;">로그인 시도 횟수 제한</span></b>
			</a>
			<br/>
			<p style="padding-left:10px">
				<ol>
					<li style="font-size:13pt; padding-bottom:5px;">로그인 시도 횟수 제한
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">
								사용자가 로그인을 계속해서 시도할 경우 아래 두 가지 중 하나를 해야 한다.
								<ul>
									<li style="font-size:10pt; padding-bottom:5px;">사용자가 비밀번호를 잊어버릴 수 있으므로 비밀번호를 찾도록 가이드 한다.</li>
									<li style="font-size:10pt; padding-bottom:5px;">Bot에 의한 자동화된 해킹 시도일 수 있으므로 자동적인 로그인을 차단한다.</li>
								</ul>
							</li>
							<li style="font-size:11pt; padding-bottom:5px;">
								로그인 시도는 Log 혹은 DB에 기록되어야만 한다.
							</li>
						</ul>
					</li>
					<li style="font-size:13pt; padding-bottom:5px;">로그인 세션 제한
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">
								하나의 아이디는 하나의 세션만 가져야 한다.<br/>
								중복된 로그인은 허용하지 않아야 한다.
								<ul>
									<li style="font-size:10pt; padding-bottom:5px;">
										중복로그인을 시도할 때, 기존의 Session을 제거할 것인지 사용자에게 선택받게 해야한다.
									</li>
								</ul>
							</li>
						</ul>
					</li>
				</ol>
			</p>
		</p>
		<br/>
		<p>
			<a name="accessForgery">
				<b><span style="font-size:15pt;">잘못된 접근 제한</span></b>
			</a>
			<br/>
			<p style="padding-left:10px">
				<ol>
					<li style="font-size:13pt; padding-bottom:5px;">인증 및 인가에 대한 불충족
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">인증 : 사용자의 확인</li>
							<li style="font-size:11pt; padding-bottom:5px;">인가 : 사용자가 할 수 있는 행위.</li>
						</ul>
					</li>
					<li style="font-size:13pt; padding-bottom:5px;">인가에 대한 제어 필요
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">
								각 메뉴(기능)별 CRUD 에 대한 권한이 있어야 한다.<br/>
								예를 들어, 전체 회원의 정보를 볼 수 있는 권한은 System Admin만 가진다.<br/>
								본인의 정보를 볼 수 있는 권한은 System Admin과 본인이다. 
							</li>
							<li style="font-size:11pt; padding-bottom:5px;">
								권한이 없는 사용자는 그 메뉴자체를 보여주지 않아야 한다.<br/>
								삭제에 대한 권한이 없는 사용자에게 삭제 버튼을 보여주어서는 안된다.<br/>
								URL을 통한 접근을 시도할 때, 현재 요청자가 그 기능에 대한 권한이 있는지 체크하고 없다면 서비스를 거부해야한다.
								
							</li>
						</ul>
					</li>
					<li style="font-size:13pt; padding-bottom:5px;">사용자의 행동 기록
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">
								사용자가 메뉴를 사용할 때 모든 행위는 기록되어야 한다.
								<ul>
									<li style="font-size:10pt; padding-bottom:5px;">아이디</li>
									<li style="font-size:10pt; padding-bottom:5px;">시간</li>
									<li style="font-size:10pt; padding-bottom:5px;">접근한 IP</li>
									<li style="font-size:10pt; padding-bottom:5px;">접근한 Menu</li>
									<li style="font-size:10pt; padding-bottom:5px;">실행한 Action(CRUD)</li>
								</ul>
							</li>
							<li style="font-size:11pt; padding-bottom:5px;">
								권한이 없는 사용자는 그 메뉴자체를 보여주지 않아야 한다.<br/>
								삭제에 대한 권한이 없는 사용자에게 삭제 버튼을 보여주어서는 안된다.<br/>
								URL을 통한 접근을 시도할 때, 현재 요청자가 그 기능에 대한 권한이 있는지 체크하고 없다면 서비스를 거부해야한다.
							</li>
						</ul>
					</li>
				</ol>
			</p>
		</p>
		<br/>
		<p>
			<a name="exceptionControl">
				<b><span style="font-size:15pt;">안전한 예외 처리</span></b>
			</a>
			<br/>
			<p style="padding-left:10px">
				<ol>
					<li style="font-size:13pt; padding-bottom:5px;">오류 상황에 대한 대응의 부재
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">오류의 내용을 사용자에게 그대로 보여주어서는 절대 안된다.</li>
							<li style="font-size:11pt; padding-bottom:5px;">오류의 내용을 printStackTrace()를 통해 남겨서는 안된다.</li>
						</ul>
					</li>
					<li style="font-size:13pt; padding-bottom:5px;">오류 메시지(Exception Message)를 사용자에게 보여주어서는 안된다.
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">오류 메시지는 관리자 혹은 개발자에게만 노출되어야 한다.</li>
							<li style="font-size:11pt; padding-bottom:5px;">사용자에게는 치명적 오류라는 내용만으로도 충분하다.</li>
						</ul>
					</li>
				</ol>
			</p>
		</p>
		<br/>
		<p>
			<a name="encapsulationForgery">
				<b><span style="font-size:15pt;">잘못된 캡슐화</span></b>
			</a>
			<br/>
			<p style="padding-left:10px">
				<ol>
					<li style="font-size:13pt; padding-bottom:5px;">잘못 사용되고 있는 캡슐화
						<ul>
							<li style="font-size:11pt; padding-bottom:5px;">
								클래스의 멤버변수로 자리잡고 있는 아래 두가지에 대해서는 getter/setter 의 내용을 변경해야 한다.
								<ul>
									<li style="font-size:10pt; padding-bottom:5px;">배열</li>
									<li style="font-size:10pt; padding-bottom:5px;">Class</li>
								</ul>
								위 두 타입은 모두 "메모리 주소" 를 저장하고 있으므로, 일반적인 방법으로 캡슐화 하면 외부에서 값의 변경이 가능하다.
								따라서 아래와 같이 변경되어야 한다.
								<ul>
									<li style="font-size:10pt; padding-bottom:5px;">
										배열 : <br/>
										<code>
											public String[] getColors() {<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;String[] newColor = new String[colors.length];<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;System.arraycopy(colors, 0, newColor, 0, colors.length);<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;return newColor;<br/>
											}
										</code>
										<br/>
										<code>
											public void setColors(String[] colors) {<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;String[] newColor = new String[colors.length];<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;System.arraycopy(colors, 0, newColor, 0, colors.length);<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;this.colors = newColor;<br/>
											}
										</code>
									</li>
									<li style="font-size:10pt; padding-bottom:5px;">
										Class : <br/>
										<code>
											public Color getColors() {<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;Color newColor = new Color();<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;newColor = this.color.clone();<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;return newColor;<br/>
											}
										</code>
										<br/>
										<code>
											public void setColors(Color color) {<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;Color newColor = new Color();<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;newColor = color.clone();<br/>
											&nbsp;&nbsp;&nbsp;&nbsp;this.color = newColor;<br/>
											}
										</code>
									</li>
								</ul>
							</li>
							
						</ul>
					</li>
				</ol>
			</p>
			<br/>
			<p>
				<a name="periodicPasswordChanges">
					<b><span style="font-size:15pt;">주기적인 비밀번호 변경</span></b>
				</a>
				<br/>
				<p style="padding-left:10px">
					<ol>
						<li style="font-size:13pt; padding-bottom:5px;">사용자의 비밀번호는 주기적으로 변경되어야 한다.
							<ul>
								<li style="font-size:11pt; padding-bottom:5px;">
									사용자의 비밀번호는 고정적인 주기로 변경되어야 한다.
								</li>
								<li style="font-size:11pt; padding-bottom:5px;">
									변경했던 비밀번호를 DB에 저장해 두고, 이전에 사용했던 비밀번호는 사용할 수 없어야 한다.
								</li>
							</ul>
						</li>
					</ol>
				</p>
			</p>
		</p>
	</div>
	<div class="clear"></div>
</div>
<c:import url="/common/bottom" />
</body>
</html>