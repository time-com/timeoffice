
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>时间工作室</title>
    
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-app-capable" content="yes">
    <meta name="apple-mobile-app-status-bar-style" content="black">
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="cononico">
    <meta name="application-name" content="Cononico" >

    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/process.css">
    <link rel="shortcut icon"  type="image/x-icon" href="favicon.ico" />
    
    <script type="text/javascript">
        //设定rem值
        document.getElementsByTagName("html")[0].style.fontSize = document.documentElement.clientWidth/20 + 'px';
    </script>
</head>
<body>
	<header class="head">
        <div class="head_logo_div">
            <img class="logo_img" src="images/upload/head.jpg"></a>
        </div>
        <div class="head_nav_div">
             <nav class="head_nav">
                <ul id="nav_ul">
                    <li class="nav_li_on nav_ul_li">首页</li>
                    <li class="nav_ul_li">Skill</li>
                    <li class="nav_ul_li">主要人员</li>
                    <li class="nav_ul_li">好书推荐</li>
                    <li class="nav_ul_li">联系方式</li>
                </ul>
            </nav>
        </div>
        <script>
            'use strict';
        
            window.addEventListener('load', function () {
                var carousels = document.querySelectorAll('.carousel');
        
                for (var i = 0; i < carousels.length; i++) {
                    carousel(carousels[i]);
                }
            });
        
            function carousel(root) {
                var figure = root.querySelector('figure'),
                    nav = root.querySelector('nav'),
                    images = figure.children,
                    n = images.length,
                    gap = root.dataset.gap || 0,
                    bfc = 'bfc' in root.dataset,
                    theta = 2 * Math.PI / n,
                    currImage = 0;
        
                setupCarousel(n, parseFloat(getComputedStyle(images[0]).width));
                window.addEventListener('resize', function () {
                    setupCarousel(n, parseFloat(getComputedStyle(images[0]).width));
                });
        
                setupNavigation();
        
                function setupCarousel(n, s) {
                    var apothem = s / (2 * Math.tan(Math.PI / n));
        
                    figure.style.transformOrigin = '50% 50% ' + -apothem + 'px';
        
                    for (var i = 0; i < n; i++) {
                        images[i].style.padding = gap + 'px';
                    }for (i = 1; i < n; i++) {
                        images[i].style.transformOrigin = '50% 50% ' + -apothem + 'px';
                        images[i].style.transform = 'rotateY(' + i * theta + 'rad)';
                    }
                    if (bfc) for (i = 0; i < n; i++) {
                        images[i].style.backfaceVisibility = 'hidden';
                    }rotateCarousel(currImage);
                }
        
                function setupNavigation() {
                    nav.addEventListener('click', onClick, true);
        
                    function onClick(e) {
                        e.stopPropagation();
        
                        var t = e.target;
                        if (t.tagName.toUpperCase() != 'BUTTON') return;
        
                        if (t.classList.contains('next')) {
                            currImage++;
                        } else {
                            currImage--;
                        }
        
                        rotateCarousel(currImage);
                    }
                }
        
                function rotateCarousel(imageIndex) {
                    figure.style.transform = 'rotateY(' + imageIndex * -theta + 'rad)';
                }
            }
                </script>
        <div class="clear"></div>
    </header>
    
    <ul class="float_btn" id="float_btn">
        <li class="btn_on"></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
    
    <div class="wrapBox" id="wrapBox">
        <div class="box">
            <img class="box_bg" src="images/upload/pic_1.jpg">
            <div class="box01_content">
                <div class="head_div">
                    <div class="cycle_item">
                        <a href="http://www.codejie.net/" class="github_a" id="github_a" target="_blank">
                            <span class="github_icon"></span>
                            <span class="github_text"><p class="item_name">GitHub</p></span>
                        </a>
                        <a href="http://www.codejie.net/" class="weibo_a" id="weibo_a" target="_blank">
                            <span class="weibo_icon"></span>
                            <span class="weibo_text"><p class="item_name">微博</p> </span>
                        </a>
                        <a href="http://www.codejie.net/" class="blog_a" id="blog_a" target="_blank">
                            <span class="blog_icon"></span>
                            <span class="blog_text"><p class="item_name"> 博客</p></span>
                        </a>

                        <div class="green_cycle">
                            <img class="green_cycle_img" src="images/icon/green_cycle.svg">
                            <div class="yellow_cycle">
                                <img class="yellow_cycle_img" src="images/icon/yellow_cycle.svg">
                                <div class="blue_cycle">
                                    <img class="blue_cycle_img" src="images/icon/blue_cycle.svg">
                                    <div class="head_img_div">
                                        <img class="head_img" src="images/upload/head.jpg">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h1 class="title">时间工作室</h1>
                <h2 class="title_h2"> Make Friends With Time </h2>
                <div id="box01_text">
                </div>
            </div>
            <div class="arrow_div">
                <img class="arrow_img" src="images/icon/arrowhead.png">
            </div>
        </div>
        
        <div class="box">
            <img class="box_bg" src="images/upload/pic_2.jpg">
            
            <div class="box02_content box_content">
                <div id='bar_container' class="bar_container">
                    <div class='bar mint' data-percent='45' data-skill='HTML5'></div>
                    <div class='bar red' data-percent='25' data-skill='EV3'></div>
                    <div class='bar orange' data-percent='30' data-skill='css和js'></div>
                    <div class='bar gray' data-percent='20' data-skill='C++'></div>
                    <div class="bar blue" data-percent='50' data-skill='Python'></div>
                    <div class="bar green" data-percent='80' data-skill='Scratch'></div>
                </div>
                <div id="box02_text">
                    <h1>About Us</h1>
                    <div class="overline"></div>
                    <p></p>
                </div>
                <div class="clear"></div>
            </div>
            
            <div class="arrow_div">
                <img class="arrow_img" src="images/icon/arrowhead.png">
            </div>
            
        </div>
        
        <div class="box">
            <img class="box_bg" src="images/upload/pic_3.jpg">
            
            <div class="box_content box03_content">
                <ul id="timeUl" class="timeUl">
                    <li>
                        <div>
                            <h1>郭潇</h1>
                            <p>时间工作室的创始人</p>
                            <p>五年级</p>
                            <p>创意点超多</p>
                            <p>鬼点子+技术支持</p>
                        </div>
                    </li>
                    <li>
                        <div>
                            <h1>纪孝炎</h1>
                            <p>郭潇</p>
                            <p>时间工作室python&tk担当</p>
                            <p>四年级</p>
                            <p>tk大佬</p>
                        </div>
                    </li>
                    <li>
                        <div>
                            <h1>王翊临</h1>
                            <p>时间工作室的大神</p>
                            <p>五年级</p>
                            <p>会JavaScript，CSS,HTML等</p>
                            <p>时间工作室的大部分作品他都参与<p>
                        </div>
                    </li>
                    <li>
                        <div>
                            <h1>谭钧巍</h1>
                            <p>四年级</p>
                            <p>时间工作室的技术支持&源码分享</p>
                            <p>王翊临会的他有些也会</p>
                            <p>N多毁机文件</p>
                        </div>
                    </li>
                    <li>
                       <div>
                            <h1>李辉恒</h1>
                            <p>一个很不错的成员</p>
                            <p>目前已经初一了</p>
                            <p>会Scratch，Python，一点点HTML和EV3</p>
                        </div>
                    </li>
                    
                </ul>
                 <div class="left_div" id="left_div">
                     <img class="left_arrow" src="images/icon/arrowleft.png">
                 </div>
                 <div class="right_div" id="right_div">
                      <img class="right_arrow" src="images/icon/arrowright.png">
                 </div>
            </div>
            
             <div class="arrow_div">
                <img class="arrow_img" src="images/icon/arrowhead.png">
            </div>
        </div>
        
        
        <div class="box">
            
            <img class="box_bg" src="images/upload/pic_4.jpg">
            <div class="box_content box04_content">
                <h1 class="box04_title">推荐一些好书</h1>
                <ul class="hobby_content">
                    <li class="hobby_02">
                        <div class="hobby_img_div">
                            <div class="spinner spinner_02"></div>
                            <div class="hobby_img">
                                <img src="images/upload/acg.png">
                            </div>
                            <div class="hobby_img_info">
                                <h1>C++书目推荐</h1>
                            </div>
                        </div>
                        <div class="hobby_text_div">
                            <div class="hobby_img_info_mob">
                                <h1>C++书目推荐</a></h1>
                            </div>
                            <p class="about_p">
                                该书阐述了包括结构化代码和自顶向下设计在内的编程原理，涵盖了类、继承、模板、异常以及最新的面向对象编程技术等内容
                            </p>
                            <p>
                                本书是一本友好而易于使用的自学指南，适合用做编程课程的教材，也可供熟悉其他语言的开发人员参考，以更深入地理解C++语言的基本知识。
                            </p>
                        </div>
                    </li>
                                        <li class="hobby_01">
                        <div class="hobby_img_div">
                            <div class="spinner spinner_01"></div>
                            <div class="hobby_img">
                                <img src="images/upload/kapok.jpg">
                            </div>
                            <div class="hobby_img_info">
                                <h1>把时间当作朋友</h1>
                            </div>
                        </div>
                        <div class="hobby_text_div">
                            <div class="hobby_img_info_mob">
                                <h1>把时间当作朋友</h1>
                            </div>
                            <p class="about_p">
                                为什么你总是说“没有时间了”，勤奋而又懒惰？最节省时间的方式是学习，为什么你砍柴而不肯磨刀？
                                基于过程的记录，为什么迥异于基于结果的记录？一个人对时间的精确感知能力真的能训练得像特异功能？都是平凡人，为什么若干年后彼此已成天壤之别？时间这条船，为什么只送心智成熟的人去往梦想的彼岸？绝大多数的成功根本与智商没有任何关系，所有的失败都与且只与时间限制有关。 
                            </p>
                            <p>
                                当你把时间花费到一个人身上的时候，相当于在他的身上倾注了你生命的一段，哪管最终的结果如何，反正，那个人那件事都成了你生命中的一部分，不管最后你喜欢还是不喜欢。
                                </a>
                            </p>
                        </div>
                    </li>
                    <li class="hobby_03">
                        <div class="hobby_img_div">
                            <div class="spinner spinner_03"></div>
                            <div class="hobby_img">
                                <img src="images/upload/reading.jpg">
                            </div>
                            <div class="hobby_img_info">
                                <h1>从零开始学Python</h1>
                            </div>
                        </div>
                        <div class="hobby_text_div">
                            <div class="hobby_img_info_mob">
                                <h1>从零开始学Python</h1>
                            </div>
                            <p class="about_p">
                                Python是一种跨平台的计算机程序设计语言。是一种面向对象的动态类型语言，最初被设计用于编写自动化脚本(shell)，随着版本的不断更新和语言新功能的添加，越多被用于独立的、大型项目的开发。
                                自从20世纪90年代初Python语言诞生至今，它已被逐渐广泛应用于系统管理任务的处理和Web编程。
                                Python在设计上坚持了清晰划一的风格，这使得Python成为一门易读、易维护，并且被大量用户所欢迎的、用途广泛的语言。
                            </p>
                            <p>
                                Python还可以以交互模式运行，比如主流操作系统Unix/Linux、Mac、Windows都可以直接在命令模式下直接运行Python交互环境。直接下达操作指令即可实现交互操作。
                            </p>
                        </div>
                    </li>
                    <div class="clear"></div>
                </ul>
            </div>
             <div class="arrow_div">
                <img class="arrow_img" src="images/icon/arrowhead.png">
            </div>
        </div>
        
        <foot id="foot" class="foot">
            <h1 class="foot_title">Contact With Me</h1>
            <div class="foot_info_main">
                <ul>
                    <li class="weibo_items">
                        <a href="时间工作室\talk\微博.html" target="_blank">微博</a>
                    
                    </li>
                    <li class="zhihu_items">
                        <a href="时间工作室\talk\知乎.html" target="_blank">知乎</a>
                    
                     </li>
                     <li class="blog_items">
                        <a href="时间工作室\talk\博客.html" target="_blank">博客</a>
                    
                     </li>
                     <li class="email_items">
                        <a href="时间工作室\talk\邮箱.html" target="_blank">邮箱</a>
                    </li>
                    <div class="clear"></div>
                </ul>
                <div class="qrcode_div">
                    <span class="weixin">
                        <a class="weixin_icon"></a>
                        <img class="weixin_img" src="images/upload/weixin_qr.png">
                    </span>
                    <span class="dingding">
                        <a class="dingding_icon"></a>
                        <img class="dingding_img" src="images/upload/dingding_qr.png">
                    </span>
                    <span class="qq">
                        <a class="qq_icon"></a>
                        <img class="qq_img" src="images/upload/qq_qr.jpg">
                    </span>
                </div>
            </div>
            <div class="foot_power">
                <h3>©2020 
                    <p>时间工作室</p>
                </h3>
            </div>
        </foot>
    </div>
    <script type="text/javascript" src="js/main.js"></script>
    <canvas class="fireworks" style="position:fixed;left:0px;top:0px;z-index:1;pointer-events:none;width:1440px;height:451px;" width="2880" height="902"></canvas>
    <script src="js/anime.min.js"></script>
    <script src="js/onclick.effects.js"></script>
</body>
    
</html>

 
