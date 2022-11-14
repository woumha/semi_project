/**
 * 
 */
Kakao.init('49bcf88ede312002aaa1c2f099688d54'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (result) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (result) {
				var email = result.kakao_account.email;
				
				location.href="/project4/kakaologin.do?mail=" + email;
        		
				 
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }