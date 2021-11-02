	<script>

var mfp_url='@urlMobDest@';
var mfp_host_name=document.location.hostname;
var mfp_request_uri=document.location.pathname;
var mfp_no_mobile=location.search;
var mfp_cookie=document.cookie;

function mf_detect(){
    var mfp_ua=navigator.userAgent.toLowerCase();
    var mfp_devices=['vnd.wap.xhtml+xml','sony','symbian','nokia','samsung','mobile','windows ce','epoc','opera mini','nitro','j2me','midp-','cldc-','netfront','mot','up.browser','up.link','audiovox','blackberry','ericsson','panasonic','philips','sanyo','sharp','sie-','portalmmm','blazer','avantgo','danger','palm','series60','palmsource','pocketpc','smartphone','rover','ipaq','au-mic','alcatel','ericy','vodafone','wap1','wap2','teleca','playstation','lge','lg-','iphone','android','htc','dream','webos','bolt','nintendo'];
    for(var i in mfp_devices){
	if(mfp_ua.indexOf(mfp_devices[i])!=-1){return true}
    }
}

if(mfp_no_mobile!='?nomobile=1'&&mfp_cookie.indexOf('mfp_no_mobile')==-1) {
    mfp_is_mobile=mf_detect();
    if(mfp_is_mobile){
        /* window.location = "http://www.example.com"; */  /* better xross browser than document.location  */  
	/* window.location=mfp_url+"?h="+mfp_host_name+"&r="+mfp_request_uri */
	/* window.location=mfp_url+mfp_request_uri */
	window.location=mfp_url
    }
} else {
    if(mfp_cookie.indexOf('mfp_no_mobile')!=-1){}
    else{
	mfp_cookie_expires=new Date();
	mfp_cookie_expires.setTime(mfp_cookie_expires.getTime()+1000*60*60*24);
	document.cookie="mfp_no_mobile=1; expires="+mfp_cookie_expires.toGMTString()+";path=/;"
    }
}
	</script>
	<noscript>
	<meta http-equiv="refresh" content="0; URL=@urlMobDest@">
	</noscript>
