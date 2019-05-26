/*
 * Swiper 3D Flow 2.1.0
 * 3D Flow plugin for Swiper
 *
 * //www.idangero.us/sliders/swiper/plugins/3dflow.php
 *
 * Copyright 2010-2014, Vladimir Kharlampidi
 * The iDangero.us
 * //www.idangero.us/
 *
 * Licensed under GPL & MIT
 *
 * Released on: January 28, 2014
*/
Swiper.prototype.plugins.tdFlow = function (swiper, params) {
    if (!swiper.support.transforms3d) return;
    var slides, wrapperSize, slideSize, initialized;
    var isH = swiper.params.mode == 'horizontal';
    if (!params) return;
	/*=========================
	  Default Parameters
	  ===========================*/
    var defaults = {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        shadows: true
    }
    params = params || {};
    for (var prop in defaults) {
        if (!(prop in params)) {
            params[prop] = defaults[prop]
        }
    }


    function init() {
        initialized = true;
        slides = swiper.slides
        for (var i = 0; i < slides.length; i++) {
            swiper.setTransition(slides[i], 0)
        }

        if (isH) {
            wrapperSize = swiper.h.getWidth(swiper.wrapper);
            slideSize = wrapperSize / slides.length;

            for (var i = 0; i < slides.length; i++) {
                slides[i].swiperSlideOffset = slides[i].offsetLeft
            }
        }
        else {
            wrapperSize = swiper.h.getHeight(swiper.wrapper);
            slideSize = wrapperSize / slides.length;
            for (var i = 0; i < slides.length; i++) {
                slides[i].swiperSlideOffset = slides[i].offsetTop
            }
        }
    }

    function threeDSlides(transform) {
        if (!initialized) return;
        var transform = transform || { x: 0, y: 0, z: 0 };
        var center = isH ? -transform.x + swiper.width / 2 : -transform.y + swiper.height / 2;

        var rotate = isH ? params.rotate : -params.rotate;
        var translate = params.depth;

        //Each slide offset from center
        for (var i = 0; i < swiper.slides.length; i++) {

            var slideOffset = swiper.slides[i].swiperSlideOffset
            var offsetMultiplier = (center - slideOffset - slideSize / 2) / slideSize * params.modifier;

            var rotateY = isH ? rotate * offsetMultiplier : 0;
            var rotateX = isH ? 0 : rotate * offsetMultiplier;
            // var rotateZ = 0
            var translateZ = -translate * Math.abs(offsetMultiplier);

            var translateY = isH ? 0 : params.stretch * (offsetMultiplier)
            var translateX = isH ? params.stretch * (offsetMultiplier) : 0;

            //Fix for ultra small values
            if (Math.abs(translateX) < 0.001) translateX = 0;
            if (Math.abs(translateY) < 0.001) translateY = 0;
            if (Math.abs(translateZ) < 0.001) translateZ = 0;
            if (Math.abs(rotateY) < 0.001) rotateY = 0;
            if (Math.abs(rotateX) < 0.001) rotateX = 0;

            var slideTransform = 'translate3d(' + translateX + 'px,' + translateY + 'px,' + translateZ + 'px)  rotateX(' + rotateX + 'deg) rotateY(' + rotateY + 'deg)';


            swiper.setTransform(swiper.slides[i], slideTransform);
            swiper.slides[i].style.zIndex = -Math.abs(Math.round(offsetMultiplier)) + 1
            if (params.shadows) {
                //Set shadows
                var shadowBefore = isH ? swiper.slides[i].querySelector('.swiper-slide-shadow-left') : swiper.slides[i].querySelector('.swiper-slide-shadow-top');
                var shadowAfter = isH ? swiper.slides[i].querySelector('.swiper-slide-shadow-right') : swiper.slides[i].querySelector('.swiper-slide-shadow-bottom');
                shadowAfter.style.opacity = (-offsetMultiplier) > 0 ? (-offsetMultiplier) : 0;
                shadowBefore.style.opacity = offsetMultiplier > 0 ? offsetMultiplier : 0;
            }
        }

        //Set correct perspective for IE10
        if (swiper.browser.ie10 || swiper.browser.ie11) {
            var ws = swiper.wrapper.style;
            ws.perspectiveOrigin = center + 'px 50%'
        }

    }

    //Plugin Hooks
    var hooks = {
        onFirstInit: function (args) {
            slides = swiper.slides;
            if (params.shadows) {
                //Add Shadows
                var shadowEl1 = document.createElement('div')
                var shadowEl2 = document.createElement('div')
                shadowEl1.className = isH ? 'swiper-slide-shadow-left' : 'swiper-slide-shadow-top'
                shadowEl2.className = isH ? 'swiper-slide-shadow-right' : 'swiper-slide-shadow-bottom'
                for (var i = 0; i < slides.length; i++) {
                    slides[i].appendChild(shadowEl1.cloneNode())
                    slides[i].appendChild(shadowEl2.cloneNode())
                }
            }
            //Update Dimensions
            init();
            //Set in 3D
            threeDSlides({ x: swiper.getWrapperTranslate('x'), y: swiper.getWrapperTranslate('y'), z: swiper.getWrapperTranslate('z') });
        },
        onInit: function (args) {
            init();
            //Set in 3D
            threeDSlides({ x: swiper.getWrapperTranslate('x'), y: swiper.getWrapperTranslate('y'), z: swiper.getWrapperTranslate('z') });
        },
        onSetWrapperTransform: function (transform) {
            threeDSlides(transform);
        },
        onSetWrapperTransition: function (args) {

            for (var i = 0; i < swiper.slides.length; i++) {
                swiper.setTransition(swiper.slides[i], args.duration)
                if (isH && params.shadows) {
                    swiper.setTransition(swiper.slides[i].querySelector('.swiper-slide-shadow-left'), args.duration)
                    swiper.setTransition(swiper.slides[i].querySelector('.swiper-slide-shadow-right'), args.duration)
                }
                else if (params.shadows) {
                    swiper.setTransition(swiper.slides[i].querySelector('.swiper-slide-shadow-top'), args.duration)
                    swiper.setTransition(swiper.slides[i].querySelector('.swiper-slide-shadow-bottom'), args.duration)
                }
            }


        }
    }
    return hooks
}
/*
 * Swiper Smooth Progress 1.1.0
 * Smooth progress plugin for Swiper
 *
 * //www.idangero.us/sliders/swiper/plugins/progress.php
 *
 * Copyright 2010-2014, Vladimir Kharlampidi
 * The iDangero.us
 * //www.idangero.us/
 *
 * Licensed under GPL & MIT
 *
 * Released on: January 29, 2014
*/
Swiper.prototype.plugins.progress = function (swiper, params) {
    var isH = swiper.params.mode == 'horizontal';
    var wrapperMaxPosition;
    function initSlides() {
        for (var i = 0; i < swiper.slides.length; i++) {
            var slide = swiper.slides[i];
            slide.progressSlideSize = isH ? swiper.h.getWidth(slide) : swiper.h.getHeight(slide);
            if ('offsetLeft' in slide) {
                slide.progressSlideOffset = isH ? slide.offsetLeft : slide.offsetTop;
            }
            else {
                slide.progressSlideOffset = isH ? slide.getOffset().left - swiper.h.getOffset(swiper.container).left : slide.getOffset().top - swiper.h.getOffset(swiper.container).top;
            }
        }
        if (isH) {
            wrapperMaxPosition = swiper.h.getWidth(swiper.wrapper) + swiper.wrapperLeft + swiper.wrapperRight - swiper.width;
        }
        else {
            wrapperMaxPosition = swiper.h.getHeight(swiper.wrapper) + swiper.wrapperTop + swiper.wrapperBottom - swiper.height;
        }
    }
    function calcProgress(transform) {
        var transform = transform || { x: 0, y: 0, z: 0 };
        var offsetCenter;
        if (swiper.params.centeredSlides == true) offsetCenter = isH ? -transform.x + swiper.width / 2 : -transform.y + swiper.height / 2;
        else offsetCenter = isH ? -transform.x : -transform.y;
        //Each slide offset from offset center
        for (var i = 0; i < swiper.slides.length; i++) {
            var slide = swiper.slides[i];
            var slideCenterOffset = (swiper.params.centeredSlides == true) ? slide.progressSlideSize / 2 : 0;

            var offsetMultiplier = (offsetCenter - slide.progressSlideOffset - slideCenterOffset) / slide.progressSlideSize;
            slide.progress = offsetMultiplier;

        }
        // Global Swiper Progress
        swiper.progress = isH ? -transform.x / wrapperMaxPosition : -transform.y / wrapperMaxPosition;
        // Callback
        if (swiper.params.onProgressChange) swiper.fireCallback(swiper.params.onProgressChange, swiper);
    }

    //Plugin Hooks
    var hooks = {
        onFirstInit: function (args) {
            initSlides()
            calcProgress({
                x: swiper.getWrapperTranslate('x'),
                y: swiper.getWrapperTranslate('y')
            });
        },
        onInit: function (args) {
            initSlides()
        },
        onSetWrapperTransform: function (transform) {
            calcProgress(transform);
        }
    }
    return hooks
}

// idangerous.swiper.scrollbar.js
Swiper.prototype.plugins.scrollbar = function (swiper, params) {
    var enabled = params && params.container; if (!enabled) return; var defaults = { hide: true, draggable: true, snapOnRelease: false }
    params = params || {}; for (var prop in defaults) { if (!(prop in params)) { params[prop] = defaults[prop] } }
    if (!document.querySelectorAll) { if (!window.jQuery) return; }
    function $$(s) {
        if (document.querySelectorAll)
            return document.querySelectorAll(s)
        else
            return jQuery(s)
    }
    if (!(params.container.nodeType)) { if ($$(params.container).length == 0) return; }
    var container = (params.container.nodeType) ? params.container : $$(params.container)[0]; var isH = swiper.params.mode == 'horizontal', track = container, trackWidth, trackHeight, divider, moveDivider, dragWidth, dragHeight; var drag = document.createElement('div')
    drag.className = 'swiper-scrollbar-drag'; if (params.draggable) drag.className += ' swiper-scrollbar-cursor-drag'; track.appendChild(drag); if (params.hide) track.style.opacity = 0; var te = swiper.touchEvents
    if (params.draggable) {
        var isTouched = false; function dragStart(e) {
            isTouched = true; if (e.preventDefault) e.preventDefault(); else e.returnValue = false; setDragPosition(e); clearTimeout(timeout); swiper.setTransition(track, 0)
            track.style.opacity = 1; swiper.setWrapperTransition(100); swiper.setTransition(drag, 100)
            if (params.onScrollbarDrag) { params.onScrollbarDrag(swiper) }
        }
        function dragMove(e) {
            if (!isTouched) return; if (e.preventDefault) e.preventDefault(); else e.returnValue = false; setDragPosition(e); swiper.setWrapperTransition(0); swiper.setTransition(track, 0)
            swiper.setTransition(drag, 0)
            if (params.onScrollbarDrag) { params.onScrollbarDrag(swiper) }
        }
        function dragEnd(e) {
            isTouched = false; if (params.hide) {
                clearTimeout(timeout)
                timeout = setTimeout(function () { track.style.opacity = 0; swiper.setTransition(track, 400) }, 1000)
            }
            if (params.snapOnRelease) { swiper.swipeReset() }
        }
        var lestenEl = swiper.support.touch ? track : document
        swiper.h.addEventListener(track, te.touchStart, dragStart, false)
        swiper.h.addEventListener(lestenEl, te.touchMove, dragMove, false)
        swiper.h.addEventListener(lestenEl, te.touchEnd, dragEnd, false)
        function setDragPosition(e) {
            var x = y = 0; var position; if (isH) {
                var pageX = (e.type == 'touchstart' || e.type == 'touchmove') ? e.targetTouches[0].pageX : e.pageX || e.clientX; x = (pageX) - swiper.h.getOffset(track).left - dragWidth / 2
                if (x < 0) x = 0; else if ((x + dragWidth) > trackWidth) { x = trackWidth - dragWidth; }
            }
            else { var pageY = (e.type == 'touchstart' || e.type == 'touchmove') ? e.targetTouches[0].pageY : e.pageY || e.clientY; y = (pageY) - swiper.h.getOffset(track).top - dragHeight / 2; if (y < 0) y = 0; else if ((y + dragHeight) > trackHeight) { y = trackHeight - dragHeight; } }
            swiper.setTranslate(drag, { x: x, y: y })//Wrapper Offset
            var wrapX = -x / moveDivider; var wrapY = -y / moveDivider; swiper.setWrapperTranslate(wrapX, wrapY, 0)
            swiper.updateActiveSlide(isH ? wrapX : wrapY);
        }
    }
    function setScrollBars() {
        drag.style.width = ''
        drag.style.height = ''
        if (isH) { trackWidth = swiper.h.getWidth(track, true); divider = swiper.width / (swiper.h.getWidth(swiper.wrapper) + swiper.wrapperLeft + swiper.wrapperRight); moveDivider = divider * (trackWidth / swiper.width); dragWidth = trackWidth * divider; drag.style.width = dragWidth + 'px'; }
        else {
            trackHeight = swiper.h.getHeight(track, true); divider = swiper.height / (swiper.h.getHeight(swiper.wrapper) + swiper.wrapperTop + swiper.wrapperBottom); moveDivider = divider * (trackHeight / swiper.height); dragHeight = trackHeight * divider; if (dragHeight > trackHeight) dragHeight = trackHeight
            drag.style.height = dragHeight + 'px';
        }
        if (divider >= 1) { container.style.display = 'none' }
        else { container.style.display = '' }
    }
    var timeout; var hooks = {
        onFirstInit: function (args) { setScrollBars() }, onInit: function (args) { setScrollBars() }, onTouchMoveEnd: function (args) {
            if (params.hide) {
                clearTimeout(timeout)
                track.style.opacity = 1; swiper.setTransition(track, 200)
            }
        }, onTouchEnd: function (args) {
            if (params.hide) {
                clearTimeout(timeout)
                timeout = setTimeout(function () { track.style.opacity = 0; swiper.setTransition(track, 400) }, 1000)
            }
        }, onSetWrapperTransform: function (pos) {
            if (isH) {
                var newLeft = pos.x * moveDivider; var newWidth = dragWidth; if (newLeft > 0) { var diff = newLeft; newLeft = 0; newWidth = dragWidth - diff; }
                else if ((-newLeft + dragWidth) > trackWidth) { newWidth = trackWidth + newLeft; }
                swiper.setTranslate(drag, { x: -newLeft })
                drag.style.width = newWidth + 'px';
            }
            else {
                var newTop = pos.y * moveDivider; var newHeight = dragHeight; if (newTop > 0) { var diff = newTop; newTop = 0; newHeight = dragHeight - diff; }
                else if ((-newTop + dragHeight) > trackHeight) { newHeight = trackHeight + newTop; }
                swiper.setTranslate(drag, { y: -newTop })
                drag.style.height = newHeight + 'px';
            }
            if (swiper.params.freeMode && params.hide) {
                clearTimeout(timeout)
                track.style.opacity = 1; timeout = setTimeout(function () { track.style.opacity = 0; swiper.setTransition(track, 400) }, 1000)
            }
        }, onSetWrapperTransition: function (args) { swiper.setTransition(drag, args.duration) }, onDestroy: function () {
            var lestenEl = swiper.support.touch ? track : document
            swiper.h.removeEventListener(track, te.touchStart, dragStart, false)
            swiper.h.removeEventListener(lestenEl, te.touchMove, dragMove, false)
            swiper.h.removeEventListener(lestenEl, te.touchEnd, dragEnd, false)
        }
    }
    return hooks;
}
