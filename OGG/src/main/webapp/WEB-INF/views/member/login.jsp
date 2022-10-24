<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- 로그인 및 회원가입 관련 CSS -->
    <link rel="stylesheet" href="${path}/css/member/login.css">
    
    <!-- 카카오 SDK 로드 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <div class="loginPage_section">
        <div class="contentWrap">
            <div class="login-form">
                <form class="form" role="form" name="flogin" action="/member/login.do" method="POST">
                    <div class="login-logo">
                        <img src="${ path }/images/logo/OGG_logo.png"  alt="logo">
                    </div>
                    <div class="login-input">
                        <input type="text" name="m_id" id="m_id" required="" maxlength="20" placeholder="아이디를 입력하세요">
                    </div>
                    <div class="login-input">
                        <input type="password" name="m_pwd" id="m_pwd" required="" maxlength="20" placeholder="패스워드를 입력하세요">
                    </div>
                    <div class="login-option">
                        <div class="input-check">
                            <input type="checkbox" name="remember-me" id="remember-me">
                            <label for="remember-me">로그인 상태 유지</label>
                        </div>
                        <div class="right">
                            <a href="${ path }/member/goAgreementBeforJoin.do" class="v-bar" >회원가입</a>
                            <a href="${ path }/member/goFindId.do" id="login_id_lost">아이디 찾기</a>
                            <a> ｜ </a>
                            <a href="${ path }/member/goFindPwd.do" id="login_pwd_lost">비밀번호 찾기</a>
                        </div>
                    </div>
                 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                    <button type="submit" class="form-button button button-purple">로그인</button>
                 		<c:if test="${ not empty errorMessage }">
                 		</c:if>
                    <div class="form-text">
                        <p>
                            OGG 회원이 아닌가요? <br>
                            첫가입 시 500포인트! <span class="text-purple">추천인 등록 시 추가 500포인트!</span>
                        </p>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
                </form>

                    <div class="form-sns-join sns-wrap">
						<div id="kakaoLogin">
							<a href="javascript:kakaoLogin();" class="kakao">
								<img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/btn-sns-login-kakao.png">
								카카오 계정으로 로그인 하기         
							</a>
							<input type="hidden" name="kakaoemail" id="kakaoemail" />
							<input type="hidden" name="kakaoname" id="kakaoname" />
						</div>
                </div>
            </div>
        </div>
    </div>

	<script type="text/javascript">
		var msg = "${errorMessage}";
		
		if (msg != "") {
		alert(msg);
		}
	
	   window.Kakao.init("e127f699354ca9704b0b5501b9c80ff3");
	
	   function kakaoLogin(){
	      window.Kakao.Auth.login({
	         scope:'profile_nickname,account_email',
	         success:function(obj){
	            console.log(obj);
	
	            window.Kakao.API.request({
	               url:'/v2/user/me',
	               success: function(res){
	                  
	                  let user = {
	                        "kakaoname" :res.kakao_account.profile["nickname"],
	                        "kakaoemail" :res.kakao_account.email
	                  };
	
	                  location.assign('${path}/member/kakao.do?kakaoname='+user.kakaoname
	                                                 +'&kakaoemail='+user.kakaoemail);
	               }
	               
	            });
	         }
	         
	      });
	   }
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>