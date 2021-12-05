window.addEventListener('load', function() {
    var focus = document.querySelector('.focus');
    var arrow_l = document.querySelector('.arrow-l');
    var arrow_r = document.querySelector('.arrow-r');
    var focusWidth = focus.offsetWidth;
    console.log(focusWidth); //721
    // 牢记mouseenetr 与mouseover区别
    // mouseover 鼠标经过自身盒子会触发，经过子盒子还会触发。 mouseenter  只会经过自身盒子触发
    // 之所以这样，就是因为mouseenter不会冒泡

    focus.addEventListener('mouseenter', function() {
        arrow_l.style.display = 'block';
        arrow_r.style.display = 'block';
        clearInterval(timer);
        timer = null; //清除计算器变量

    })
    focus.addEventListener('mouseleave', function() {
        arrow_l.style.display = 'none';
        arrow_r.style.display = 'none';
        timer = setInterval(function() {
            arrow_r.click();
        }, 2000);
    })

    //有几张图生成几张图片
    var ul = focus.querySelector('ul');
    console.log(ul);
    var ol = document.querySelector('.circle');
    console.log(ul.children.length);
    for (var i = 0; i < ul.children.length; i++) {
        // 创建一个li 循环几次创建几个
        var li = document.createElement('li');
        // 自定义index  element.setAttribute('属性', '值');  主要针对于自定义属性
        li.setAttribute('index', i);
        // 不知道什么原因没有获取到

        // 把创建的里添加到ol中 element.appChild(li);
        ol.appendChild(li);
        // 小圆圈排他思想 点击一个其它全部关闭
        li.addEventListener('click', function() {
            for (var i = 0; i < ol.children.length; i++) {
                ol.children[i].style.backgroundColor = '';
                // ol.children[i].backgroundColor = '';
            }
            // this.style.className = 'current';
            this.style.backgroundColor = '#fff'
                // 实现点击小圆圈实现换图片的功能
                // ul移动的距离 小圆圈的索引号乘图片的宽度 、
                // / 当我们点击了某个小li 就拿到当前小li 的索引号
                // 这里得到的是index
            var index = this.getAttribute('index');
            //处理bug 当我们点击了某个li 就要把li 的索引号给num
            num = index;
            circle = index;
            console.log(index);

            // animate(ul,target,callback);  动画移动
            animate(ul, -index * focusWidth)

        })
    }
    // 把ol里面的第一个小li设置类名为 current
    ol.children[0].className = 'current';
    // 克隆第一张 到第一张无缝滚动
    // 知道什么深克隆里面为true会克隆里面的节点  浅克隆
    var first = ul.children[0].cloneNode(true);
    ul.appendChild(first);




    // 6.点击右侧按钮，图片滚动一张  bug最后一张走完了 留一个空白
    var num = 0;
    // circle控制小圆圈的播放  全局变量
    var circle = 0;
    arrow_r.addEventListener('click', function() {
        // 如果走到最后一张图片了 此时我们ul 要快速复原 left 改为0
        if (num == ul.children.length - 1) {
            ul.style.left = 0;
            num = 0;
        }
        num++;
        animate(ul, -num * focusWidth);

        // 点击右侧按钮 小圆圈跟着一起变化 可以再声明一个变量控制小圆圈的播放
        circle++;
        // 如果circle==4 说明走到最后我们克隆的这张图片
        if (circle == ol.children.length) {
            circle = 0;
        }
        //清楚其余小圆圈的current类名
        circleChange();

    })

    // 左侧按钮
    arrow_l.addEventListener('click', function() {
            // 如果走到最后一张图片了 此时我们ul 要快速复原 left 改为0
            if (num == 0) {
                num = ul.children.length - 1;
                ul.style.left = -num * focusWidth + 'px';

            }
            num--;
            animate(ul, -num * focusWidth);

            // 点击右侧按钮 小圆圈跟着一起变化 可以再声明一个变量控制小圆圈的播放
            circle--;
            // 如果circle<0说明第一张图片 则小圆圈要改为第四个小圆圈
            // 这个if可以用三元表达式
            if (circle < 0) {
                circle = ol.children.length - 1;
            }
            //清楚其余小圆圈的current类名
            // 调用这个代码
            circleChange();
        })
        // 封装一个函数 
    function circleChange() {
        for (var i = 0; i < ol.children.length; i++) {
            ol.children[i].className = '';
        }
        //留下当前的小圆圈的current类名
        ol.children[circle].className = 'current';
    }


    // 定时器 自动播放 类似于点击了右侧按钮  手动调用事件
    var timer = setInterval(function() {
        arrow_r.click();
    }, 4000);
    // 

})