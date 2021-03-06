<%@ include file="/resources/frameworks/topFramework.html" %>
<link rel="stylesheet" href="resources/css/rmLogin.css" />
<script src="resources/js/rmLogin.js" type="text/javascript"></script>


<div id="container">
  <div id="topnav" class="topnav"> Have an account? <a href="login" class="signin"><span>Sign in</span></a></div>
  <div style="height:200px;">
  <fieldset id="signin_menu">
    <form method="post"id="signin" action="j_spring_security_check">
     <p class="error" id="loginError"></p>
      <p>
      <label for="j_username">Username</label>
      <input required id="j_username" name="j_username" value="" title="Enter your Recipe Manager username" autofocus autocapitalize="off" tabindex="4" type="text">
      </p>
      <p>
        <label for="j_password">Password</label>
        <input required id="j_password" name="j_password" value="" title="Enter your Recipe Manager password" tabindex="5" type="password">
      </p>
      <p class="remember">
        <input id="signin_submit" value="Sign in" tabindex="6" type="submit">
        <input id="_spring_security_remember_me" name="_spring_security_remember_me" value="1" tabindex="7" type="checkbox">
        <label for="_spring_security_remember_me">Remember me</label>
      </p>
      <p class="forgot"> <a href="javascript:forgotPassword();" id="resend_password_link">Forgot your password?</a></p>
      <p class="forgot-username"> <a href="javascript:forgotUsername();" id="forgot_username_link" title="If you remember your password, try logging in with your email" href="#">Forgot your username?</a></p>
    </form>
  </fieldset>
  </div>
</div>

<div style="text-align:center">
	<h3 style="font-size:2.0em;">Welcome to HerbCooking.net</h3>
    <div><img title="M&C LLC" style="height:45px;" src="resources/images/logo.jpg"/></div>
    <div><b style="vertical-align:bottom; margin-left: 3px;">&copy; M&C LLC Copyright 2011 - 2012</b></div>	
</div>

	</div>
</div>

<div id="forgotAccountForm" title="" style="display:none;margin-top:5px;">
	<input id="actionType" type="hidden" value="" />
	<div id="forgotAccountFormErrors" style="display:none;margin:0px;"></div>
	
 	<p style="text-align:left;">Please enter the <b>email address</b> associated with your 
         account here.  An email will be sent to you with instructions for retrieving your account.</p>

	<table>
	  <tr><td align="left"><b>Email Address:</b></td></tr>
	  <tr><td align="left"><input type="email" id="email" placeholder="ie. john.doe@yahoo.com" title="Enter a valid email address" name="user[email]" size="30" value="" /></td></tr>
	</table>
</div>

</body>
</html>



