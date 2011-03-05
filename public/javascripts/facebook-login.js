FBSession = null;
function withFB(callback){
  if(FBSession) return callback(FBSession);

  window.fbAsyncInit = function() {
    FB.init({
      appId: FBAppId,
      status: true,
      cookie: true
    });

    // try to get login info without popup ->  receive all previously granted permissions
    // no popup (simply hangs when site domain does not match current domain)
    FB.getLoginStatus(function(response){
      if(response.session){
        FBSession = response.session;
        callback(FBSession);
      } else {
        // force login via redirect
        var cleanUrl = "http://"+document.location.host.replace(/^[a-z]+\./,'')+document.location.pathname
        document.location.href = "http://www.facebook.com/connect/uiserver.php?app_id="+FBAppId+"&method=permissions.request&display=page&next="+cleanUrl+"&response_type=code&perms=email"
      }
    });
  };

  // load facebook js
  (function() {
    var e = document.createElement('script'); e.async = true;
    e.src = document.location.protocol +
      '//connect.facebook.net/de_DE/all.js';
    document.getElementById('fb-root').appendChild(e);
  }());
}
