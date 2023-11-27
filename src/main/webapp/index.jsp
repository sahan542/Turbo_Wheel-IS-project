<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css">
<title>Index</title>

<script type="text/javascript">
function authorize() {
    var authorizeEndpoint = 'https://api.asgardeo.io/t/learnsahan/oauth2/authorize';
    var clientId = 'n6etGd7Se3dD804oM6BORdPoUx4a';
    var redirectUri = encodeURIComponent('http://localhost:8083/Turbo__WHeel/authorize.jsp');

    var redirectUrl = authorizeEndpoint + '?response_type=code' +
        '&client_id=' + clientId +
        '&scope=openid address email phone profile' +
        '&redirect_uri=' + redirectUri;

    window.location.href = redirectUrl;
}
</script>
</head>
<body>
	<div class="up">
    <h2>Welcome to <br><span>Turbo_Wheel</span></h2>
    </div>
	<div class="index">
	<div class="indexdetails">
	    <h1>Sign In Using Asgardeo</h1>
		<button class="btn" onClick="authorize()">Login</button>
        <h4>Don't have an Asgardio account? then,</h4>
        <button class="btn" onClick="authorize()">Login</button>
	</div>
	</div>
</body>
</html>