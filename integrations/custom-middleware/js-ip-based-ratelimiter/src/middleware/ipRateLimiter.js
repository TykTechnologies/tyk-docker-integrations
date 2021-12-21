var APIID = "32d22e9e96714a054daf44b769a6c3aa"
var ORGID = "61c21e11d27113000a05f985"

var ipRateLimiter = new TykJS.TykMiddleware.NewMiddleware({});

ipRateLimiter.NewProcessRequest(function (request) {
  // Get the IP address
  var realIp = request.Headers["X-Real-Ip"][0];

  // Set auth header
  request.SetHeaders["Authorization"] = realIp;

  var keyDetails = {
    "rate": 2,
    "per": 60,
    "alias": "ip-session-" + realIp,
    "access_rights": {},
    "org_id": ORGID
  }
  keyDetails["access_rights"][APIID] = { "api_id": APIID }

  TykSetKeyData(realIp, JSON.stringify(keyDetails), 1)

  return ipRateLimiter.ReturnData(request);
});

// Ensure init with a post-declaration log message
log("IP rate limiter JS initialised");
