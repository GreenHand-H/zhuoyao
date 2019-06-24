$(".strategy-wrap .strategy-tit").click(function(){
    $(this).parent().addClass("on").siblings().removeClass("on");
})
$(".part3 .video-tab .tab-item a").mouseover(function(){
    var  aHtml=["最新视频","官方视频","搞笑视频","精彩直播"];
    for(var i=0;i<aHtml.length;i++){
        if($(this).html()==aHtml[i]){
            break;
        }
    }
    $(`.video-list-wrap .video-list:eq(${i})`).addClass("dis").siblings(".video-list").removeClass("dis");
    $(this).parent().addClass("on").siblings().removeClass("on");
    
})