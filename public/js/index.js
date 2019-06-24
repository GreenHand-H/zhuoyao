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
$(".mt-right .tab-hd li a").mouseover(function(){
    var dataVal=$(this).html();
    $(`.grid-tab-bd .col-news[data-val=${dataVal}]`).addClass("dis").siblings(".col-news").removeClass("dis");
    $(this).parent().addClass("on").siblings().removeClass("on");
})
var i=0;
function moveTo(to){
    if(to==undefined){
        to=i+1;
    }
    i=to;
    if(i==3){
        i=0;
    }
    // console.log( i);
    $(`.adPic a:eq(${i})`).css("left","0%").siblings().css("left","-100%");
    $(`.adBtn a:eq(${i})`).addClass("on").siblings().removeClass("on");
}
var timer=setInterval(function(){
    moveTo();
},2000)
$(".mt-center").hover(function(){
    clearInterval(timer);
},
function(){
    timer=setInterval(function(){
        moveTo();
    },2000)
})
$(".adBtn a").click(function(){
    $(".adBtn a").each((i,elem)=>{ 
        if(this==elem){
           moveTo(i);
        }
    })
})
$(".strategy-pagination .swiper-pagination-switch").click(function(){
    $(this).addClass("swiper-active-switch").siblings().removeClass("swiper-active-switch");
    $(this).parent().children().each((i,elem)=>{
        if(this==elem){
            $(this).parent().prev().css("left",-i*456+'px');
        }
    })
    
})