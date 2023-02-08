<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<main class="form-signin w-100 m-auto">
		<!--회원가입 -->
		<h1 class="h4 mb-3 fw-normal">회원가입</h1>
		<div id="join-wrapper" class="card p-2">
			<!-- 아이디 입력 -->
			<label for="uiId" class="form-label" align="left">아이디</label>
			<div class="input-group">
				<input type="text" id="uiId" class="form-control" placeholder="아이디">
				<button onclick="checkId()" class="btn btn-secondary">중복확인</button>
			</div>
			<!-- 비밀번호 입력 -->
			<label for="uiPwd" class="form-label" align="left">비밀번호</label> <input
				type="password" id="uiPwd" class="form-control" placeholder="비밀번호">
			<small align="left">&nbsp;최소 6글자 이상</small> <br> <label
				for="uiPwdCheck" class="form-label" align="left">비밀번호 확인</label> <input
				type="password" id="uiPwdCheck" class="form-control"
				placeholder="비밀번호 확인"> <small align="left">&nbsp;최소
				4글자 이상</small>
			<!-- 이름 입력 -->
			<br> <label for="uiName" class="form-label" align="left">이름</label>
			<input type="text" id="uiName" class="form-control" placeholder="이름"><br>
			<!-- 이메일 입력 -->
			<lable for="uiEmail" align="left">이메일</lable>
			<input type="text" id="email_id" class="form_w200" value=""
				title="이메일 아이디" placeholder="이메일" maxlength="18" /> @ <input
				type="text" id="email_domain" class="form_w200" value=""
				title="이메일 도메인" placeholder="이메일 도메인" maxlength="18" /> <select
				class="select" title="이메일 도메인 주소 선택"
				onclick="setEmailDomain(this.value);return false;">
				<option value="">-선택-</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="korea.com">korea.com</option>
				<option value="nate.com">nate.com</option>
				<option value="yahoo.com">yahoo.com</option>
			</select>
			<!-- 이메일 수신여부 -->
			<br>
			<lable for="uiEmailOk" align="left">이메일 수신여부</lable>
			<div>
				<input type="radio" name="uiEmailOk" value="ok">수신 <input
					type="radio" name="uiEmailOk" value="no">수신안함
			</div>
			<!-- 비밀번호 확인시 질문, 답변 -->
			<tr>
				<th>비밀번호 힌트/답변</th>
				<td><select name='pwhint' size='1' class='select'>
						<option value=''>선택하세요</option>
						<option value='30'>졸업한 초등학교 이름은?</option>
						<option value='31'>제일 친한 친구의 핸드폰 번호는?</option>
						<option value='32'>아버지 성함은?</option>
						<option value='33'>어머니 성함은?</option>
						<option value='34'>어릴 적 내 별명은?</option>
						<option value='35'>가장 아끼는 물건은?</option>
						<option value='36'>좋아하는 동물은?</option>
						<option value='37'>좋아하는 색깔은?</option>
						<option value='38'>좋아하는 음식은?</option>
				</select>
			</tr>
			<tr>
				</td>
				<th>답변</th>
				<td><input type='text' name='pwhintans'></td>
			</tr>
			<tr>
				<!-- 성별 입력 -->
	<br>
				<lable for="uiGender" align="left">성별</lable>
				<div>
					<input type="radio" name="uiGender" value="man">남 <input
						type="radio" name="uiGender" value="woman">여
				</div>
				<!-- 생년월일 -->
				<div class="field birth">
					<b>생년월일</b>
					<div>
						<input type="number" placeholder="년(4자)"> <select>
							<option value="">월</option>
							<option value="">1월</option>
							<option value="">2월</option>
							<option value="">3월</option>
							<option value="">4월</option>
							<option value="">5월</option>
							<option value="">6월</option>
							<option value="">7월</option>
							<option value="">8월</option>
							<option value="">9월</option>
							<option value="">10월</option>
							<option value="">11월</option>
							<option value="">12월</option>
						</select> <input type="number" placeholder="일">
					</div>
				</div>
		</div>
		<button class="w-100 btn btn-lg btn-primary" onclick="join()">회원가입</button>
		<br> <br>
	</main>

	<script>
	/* 일반 회원가입 */
	let isCheckedId = false;
	function checkId() {
		const uiId = document.querySelector('#uiId').value;
		if(uiId.trim().length<4){
			alert('아이디는 4글자 이상입니다.');
			return;
		}
		fetch('/user-infos/check/' + uiId)
		.then(function(data){
			return data.json();
		})
		.then(function(res){
			if(res===false){
				alert('이용 가능한 아이디 입니다.');
				isCheckedId = true;
			}else{
				alert('이미 등록되어 있는 아이디입니다.');
				isCheckedId = false;
			}
		});
	}
	
	let isCheckedNickname = false;
	function checkUiNickname() {
		const uiNickname = document.querySelector('#uiNickname').value;
		if(uiNickname.trim().length<2){
			alert('닉네임은 2글자 이상입니다.');
			return;
		}
		fetch('/user-infos/check-nickname/' + uiNickname)
		.then(function(data){
			return data.json();
		})
		.then(function(res){
			if(res===false){
				alert('이용 가능한 닉네임 입니다.');
				isCheckedNickname = true;
			}else{
				alert('이미 등록되어 있는 닉네임 입니다.');
				isCheckedNickname = false;
			}
		});
	}
	
	function getParam(){
		const objs = document.querySelectorAll('input');
		const param = {};
		for(const obj of objs){
			param[obj.id] = obj.value;
		}
		return param;
	}
	
	function join() {
		if(!isCheckedId){
			alert('아이디 중복확인 해주세요.');
			return false;
		}
		if(!isCheckedNickname){
			alert('닉네임 중복확인 해주세요.');
			return false;
		}
		const uiId = document.querySelector('#uiId')
		if(uiId && uiId.value.trim().length<4){
			alert('아이디는 4글자 이상입니다.');
			uiId.value='';
			uiId.focus();
			return;
		}
		const uiNickname = document.querySelector('#uiNickname')
		if(uiNickname && uiNickname.value.trim().length<2){
			alert('닉네임은 2글자 이상입니다.');
			uiId.value='';
			uiId.focus();
			return;
		}
		const uiPwd = document.querySelector('#uiPwd');
		if(uiPwd && uiPwd.value.trim().length<6){
			alert('비밀번호는 6글자 이상입니다.');
			uiPwd.value='';
			uiPwd.focus();
			return;
		}
		const uiPwdCheck = document.querySelector('#uiPwdCheck');
		if(uiPwdCheck && uiPwd.value != uiPwdCheck.value){
			alert('비밀번호와 비밀번호 확인이 다릅니다.');
			uiPwdCheck.value='';
			uipwdCheck.focus();
			return;
		}
		const param = getParam();
		fetch('/user-infos',{
			method : 'POST',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(param)
		})
		.then(function(res){
			return res.json()
		})
		.then(function(data){
			console.log(data);
			alert('회원가입이 완료되었습니다.')
			location.href='/views/user-info/login'
		})
	}
	</script>
</body>
</html>