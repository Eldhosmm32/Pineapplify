<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="Assets/css/start.css" media="screen,projection" />
        <link rel="stylesheet" href="Assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Assets/css/owl.theme.default.min.css">

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Pineapplify</title>
    </head>
    <body class="" style="background-color: #FFF9F1;">
        <!-- navbar -->
        <div class="navbar-fixed">
            <nav class="navbar navbgcol" id="navi" style="background-color: transparent;">
                <div class="container nav-wrapper">
                    <a href="index.jsp" class="brand-logo">
                        <img class="materialboxed logos" width="200" src="Assets/img/logo.png">
                    </a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
                            class="material-icons navulcol">menu</i></a>
                    <ul class="hide-on-med-and-down ul-style">
                        <li class="active"><a class="navulcol">Home</a></li>
                        <li><a class="navulcol" href="about.jsp">About</a></li>
                        <li><a class="navulcol" href="contact.jsp">Contact Us</a></li>
                        <li><a class="navulcol modal-trigger" href="#modal">Login</a></li>
                        <li><a class="waves-effect waves-light red btn" href="UserRegister.jsp">Sign up</a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <!-- sidebar -->
        <ul class="sidenav" id="mobile-demo">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact US</a></li>
            <li><a href="#modal">Login</a></li>
            <li><a href="UserRegister.jsp">Sign up</a></li>
        </ul>

        <!-- modal -->
        <div id="modal" class="modal">
            <div class="modal-content">
                <div class="row left-align" style="margin-bottom: 0px;">
                    <div class="col s12 l4 hide-on-med-and-down"
                         style="background-color:#E6E7E3; padding:80px 24px 40px 24px;">
                        <b>
                            <h4>Login</h4>
                        </b>
                        <h6>Get access to your account</h6>
                        <img class="materialboxed logos responsive-img" width="120px" src="Assets/img/logo.png"
                             style="padding:88px 0px 10px 0px;">
                        <br>
                    </div>
                    <div class="col s12 l4 show-on-medium-and-down hide-on-large-only"
                         style="background-color:#E6E7E3; ">
                        <img class="materialboxed logos" width="200px" src="Assets/img/logo.png"
                             style="display: block; margin: 0 auto;">
                        <br>
                    </div>
                    <div class="col s12 l8 formpad">
                        <br>
                        <form action="Login" method="POST">
                            <div class="input-field col s12">
                                <input name="userName" id="name" type="text" class="validate" value="" required/>
                                <label for="name">Enter Email</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="password" id="password" type="password" class="validate" value="" required/>
                                <label for="password">Enter Password</label>
                            </div>
                            <label><span class="error">${err}</span></label>
                            <label><span class="success">${suc}</span></label>
                            <div class="input-field col s12">
                                <input type="submit" class="waves-effect col s12 waves-light btn" value="LOGIN"/>
                            </div>

                            <div class="input-field col s12 center-align">
                                <a href="UserRegister.jsp" class="">New to Agromart? Sign Up.</a>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!-- carousal -->
        <div class="owl-carousel white-text">
            <div class="item valign-wrapper">
                <div class="row" style="position:absolute;width:100%">
                    <div class="col s12" style="display:flex">
                        <div class="col s3">
                        </div>
                        <div class="col s6 center-align ts-1">
                            <h3>MAKE YOUR CULTIVATION PROCESS MORE EASY WITH US</h3>
                        </div>
                        <div class="col s3">
                        </div>
                    </div>
                </div>
                <img src="Assets/img/bg.jpg">
            </div>

        </div>

        <!-- contents -->
        <div class="container">
            <div class="row">
                <div class="col s12 m12 center-align">
                    <div class="no-shadow">
                        <div class="col s12 m12 center-align">
                            <img class="materialboxed logos centerimg" width="200" src="Assets/img/logo.png"><br>
                        </div>
                        <br>
                        <span class="">
                            We Primarily deal in helping pineapple cultivators to manage their wide spread plantations by
                            giving correct information at correct time.We help by analyzing the progress of cultivated
                            plants, we give the correct procedure to cultivate pineapple, we can also manage irrigation
                            details, fertilization details, plant disease identification, and all solution related to
                            pineapple cultivation.
                        </span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s12 m4 hide-on-small-only">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why.jpg">
                        </div>

                    </div>
                </div>

                <div class="col s12 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why11.jpg">
                        </div>

                    </div>
                </div>

                <div class="col s12 m4 hide-on-small-only">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why6.jpg">
                        </div>

                    </div>
                </div>

                <div class="col s12 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why12.jpg">
                        </div>

                    </div>
                </div>

                <div class="col s12 m4 hide-on-small-only">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why2.jpg">
                        </div>

                    </div>
                </div>

                <div class="col s12 m4">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why13.jpg">
                        </div>

                    </div>
                </div>

                <div class="col s12 m4 hide-on-small-only">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why3.jpg">
                        </div>

                    </div>
                </div>
                <a href="#">
                    <div class="col s12 m4">
                        <div class="card">
                            <div class="card-image">
                                <img src="Assets/img/why14.jpg">

                            </div>
                        </div>
                    </div>
                </a>
                <div class="col s12 m4 hide-on-small-only">
                    <div class="card">
                        <div class="card-image">
                            <img src="Assets/img/why5.jpg">
                        </div>

                    </div>
                </div>
            </div>

            <div class="row">
                <h4 class="pcol-text cfont center-align">Our satisfied customer says</h4>
                <br>
                <div class="col s12 m4 ">
                    <div class="card">
                        <div class="card-content">
                            <img class="circle centerimg" src="Assets/img/person_1.jpg">
                        </div>
                        <div class="card-action">
                            <p>Vegetables should be an important part of your daily diet. They are naturally good and
                                contain vitamins and minerals that can help to keep you healthy. </p>
                            <span class="right">-albert thomas</p>
                        </div>
                        <br>
                    </div>
                </div>
                <div class="col s12 m4 ">
                    <div class="card">
                        <div class="card-content">
                            <img class="circle centerimg" src="Assets/img/person_2.jpg">
                        </div>
                        <div class="card-action">
                            <p>Vegetables should be an important part of your daily diet. They are naturally good
                                and
                                contain vitamins and minerals that can help to keep you healthy. </p>
                            <span class="right">-albert thomas</p>
                        </div>
                        <br>
                    </div>
                </div>

                <div class="col s12 m4 ">
                    <div class="card">
                        <div class="card-content">
                            <img class="circle centerimg" src="Assets/img/person_3.jpg">
                        </div>
                        <div class="card-action">
                            <p>Vegetables should be an important part of your daily diet. They are naturally good
                                and
                                contain vitamins and minerals that can help to keep you healthy. </p>
                            <span class="right">-albert thomas</p>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer -->
        <footer class="page-footer white teal-text lighten-2 z-depth-3">
            <div class="center gotop">
                <a class="scroll btn-floating btn-large pcol">
                    <i class="large material-icons">keyboard_arrow_up</i>
                </a>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col l4 offset-l1 s12">
                        <h5 class="">About Pineapplify</h5>
                        <p class="grey-text text-justify">We majorly deal in helping pineapple cultivators to manage their
                            wide spread plantations by
                            giving correct information at correct time.</p>
                    </div>

                    <div class="col l4 s12 ">
                        <h5 class="">Have Questions?</h5>
                        <ul class="grey-text">
                            <li><img src="Assets/img/add (3).png" alt="" width="14px">
                                <span class=""> Near Municipal Busbay, Thdupuzha, Kerala, India.</span>
                            </li>
                            <li><img src="Assets/img/add (2).png" alt="" width="14px"><span class="text"> +2 392 3929210</span>
                            </li>
                            <li><img src="Assets/img/add (1).png" alt="" width="14px"></span><span class="text">
                                    info@yourdomain.com</span></li>
                        </ul>
                    </div>
                    <div class="col l3 s12">
                        <h5>Menu</h5>
                        <ul class="">
                            <li><a class="grey-text" href="index.jsp">Home</a></li>
                            <li><a class="grey-text" href="about.jsp">About</a></li>
                            <li><a class="grey-text" href="contact.jsp">Contact US</a></li>
                            <li><a class="grey-text" href="#modal">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright teal-text lighten-2">
                <div class="container center-align">
                    © 2020 All Rights Reserved By Pineapplify Pvt. Ltd.
                </div>
            </div>
        </footer>

        <!-- scripts -->
        <script type="text/javascript" src="Assets/js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="Assets/js/materialize.min.js"></script>
        <script src="Assets/js/owl.carousel.min.js"></script>
        <script>
            //NavBar
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                var x = document.getElementById("navi");
                if (document.body.scrollTop > 250 || document.documentElement.scrollTop > 250) {
                    x.style.backgroundColor = "#FFF9F1";
                    x.style.boxShadow =
                            "0 2px 2px 0 rgba(0,0,0,0.14),0 3px 1px -2px rgba(0,0,0,0.12),0 1px 5px 0 rgba(0,0,0,0.2)";
                    x.style.height = "100px";
                } else {
                    x.style.backgroundColor = "transparent";
                    x.style.boxShadow = "none";
                }
            }

            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.owl-carousel').owlCarousel();
                $('.modal').modal('open');
            });

            $(".scroll").click(function (e) {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });

            $(window).on('load', function () {
                $('html, body').scrollTop(0);

            });

            $('.modal').modal({
                dismissible: true
            });

            $('.owl-carousel').owlCarousel({
                items: 1,
                margin: 10,
                autoHeight: true,
                autoplay: true,
                autoplayTimeout: 5000,
                loop: false,
                autoplaySpeed: 2000,
                animateOut: 'fadeOut'
            });
        </script>
    </body>

</html>