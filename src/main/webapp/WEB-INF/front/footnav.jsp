<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/13
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <style>
        *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
        }
        .foot {
            width: 100%;
            height: 60px;
            background: #FFFFFF;
            position: fixed;
            bottom: 0;
            display: flex;
            justify-content: space-around;
        }

        .foot li {
            height: 100%;
        }

        .foot li a {
            display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
        }

        .foot li a img {
            display: block;
            width: 38px;
            height: 38px;
            margin: 0 auto;
        }

        .foot li a p {
            font-size: 12px;
            width: 100%;
            text-align: center;

        }


        p.actives {
            color: #35bed1;
        }
    </style>
<div >
<!--img为未选中图片   data-img为选中图片-->
<ul class="foot">
    <li class="Imgbox" img="static/images/footer/ho1.png" data-img="static/images/footer/ho2.png">
        <a href="index.jhtml">
            <img src="static/images/footer/ho1.png" />
            <p class="actives">HOME</p>
        </a>
    </li>
    <li class="Imgbox" img="static/images/footer/hg1.png" data-img="static/images/footer/hg2.png">
        <a href="aboutus/index.jhtml">
            <img src="static/images/footer/hg1.png" />
            <p>ABOUT</p>
        </a>
    </li>
    <li class="Imgbox" img="static/images/footer/sh1.png" data-img="static/images/footer/sh2.png">
        <a href="user/cart/index.jhtml">
            <img src="static/images/footer/sh1.png" />
            <p>SHOP</p>
        </a>
    </li>
    <li class="Imgbox" img="static/images/footer/ep1.png" data-img="static/images/footer/ep2.png">
        <a href="user/mycenter/index.jhtml">
            <img src="static/images/footer/ep1.png" />
            <p>EPICENTER</p>
        </a>
    </li>
</ul>
</div>
<script src="static/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
    $('.foot li').click(function() {
        $(this).find("p").addClass('actives');
        $(this).siblings(".Imgbox").find("p").removeClass('actives');

        var click = $(this).data('img');
        $(this).find('img').attr('src', click);

        $(this).siblings('.Imgbox').each(function() {
            var noclick = $(this).attr('img');
            $(this).find('img').attr('src', noclick);
        })
    })
</script>
