<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form name="write_form_member" method="post">
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <tr>
         <th>아이디</th>
         <td>
         <input type="text" name="cursor:pointer">
         <a href='#' style='cursor:help'></a>
         </td>
       </tr>
        <tr>
         <th>비밀번호</th>
         <td><input type="password" name="mbpw"> 영문/숫자포함 6자 이상</td>
       </tr>
       <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" name="mbpw_re"></td>
       </tr>
      <tr>
         <th> 이름</th>
         <td><input type="text" name="mbname"></td>
      </tr>
      <tr>
          <th>이메일</th>
          <td>
            <input type='text' name="email">@
            <input type='text' name="email_dns">
              <select name="emailaddr">
                 <option value="">직접입력</option>
                 <option value="daum.net">daum.net</option>
                 <option value="empal.com">empal.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="hanmail.net">hanmail.net</option>
                 <option value="msn.com">msn.com</option>
                 <option value="naver.com">naver.com</option>
                 <option value="nate.com">nate.com</option>
              </select>
            </td>
         </tr>
         <tr>
         <th>이메일 수신여부</th>
			<td>
				<input type="radio" name="uiEmailOk" value="ok">수신 
				<input type="radio" name="uiEmailOk" value="no">수신안함
			</td>
		</tr>
       <tr>
          <th>비밀번호 확인시 질문</th>
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
           <th>비밀번호 확인시 답변</th>
           <td><input type='text' name='pwhintans'></td>
        </tr>
        <tr>
        	<th>성별</th>
        		<td>
        			<input type="radio" name="uiGender" value="man">남자 
					<input type="radio" name="uiGender" value="woman">여자
        		</td>
        </tr>
        <tr>
        	<th>생년월일</th>
        	<td>
        		<input type="number" placeholder="년(4자)">
        		<select>
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
        	</td>
        </tr>
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <button class="w-100 btn btn-lg btn-primary" onclick="join()">회원가입</button>
            </td>
           </tr>
           </table>
          
          </form>
          
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