<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/dealer.css" media="screen,projection" />
        <link rel="stylesheet" href="./Assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./Assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" type="text/css" href="./Assets/css/Chart.min.css">
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home</title>
    </head>

    <body class="teal lighten-5">
        <!-- navbar -->
        <div class="navbar-fixed">
            <nav class="navbar navbgcol white" id="navi">
                <div class="container nav-wrapper">
                    <a href="#!" class="brand-logo">
                        <img class="materialboxed logos" width="200" src="./Assets/img/logo.png">
                    </a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
                            class="material-icons navulcol">menu</i></a>
                    <ul class="right hide-on-med-and-down ul-style2">
                        <li><a href=""><i class="material-icons pcol-text"
                                          style="position: absolute;">notifications</i><small
                                          class="notification-badge">5</small></a></li>
                        <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown1">Operations<i
                                    class="material-icons right">arrow_drop_down</i></a></li>
                        <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown2">${userName}<i
                                    class="material-icons right">arrow_drop_down</i></a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <ul id="dropdown1" class="dropdown-content dpos">
            <li><a href="#!">Crops</a></li>
            <li class="divider"></li>
            <li><a href="#!">Announcements</a></li>
            <li class="divider"></li>
            <li><a href="#!">Adv. Request</a></li>
        </ul>

        <ul id="dropdown2" class="dropdown-content dpos">
            <li><a href="ViewProfile">Profile</a></li>
            <li class="divider"></li>
            <li><a href="Logout">Logout</a></li>
        </ul>

        <!-- sidebar -->
        <ul class="sidenav" id="mobile-demo">
            <br>
            <li><a href="">Notifications <span class="badge new red" style="text-align:left;">2</span></a></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Operations</b>
            <li class="divider"></li>

            <ul id="" class="">
                <li><a href="#!">&nbsp;&nbsp;&nbsp;Crops</a></li>
                <li class="divider"></li>
                <li><a href="#!">&nbsp;&nbsp;&nbsp;Announcements</a></li>
                <li class="divider"></li>
                <li><a href="#!">&nbsp;&nbsp;&nbsp;Adv. Request</a></li>

            </ul>
        </li>
        <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${userName}</b>
        <li class="divider"></li>

        <li><a href="#!">&nbsp;&nbsp;&nbsp;Settings</a></li>
        <li class="divider"></li>
        <li><a href="Logout">&nbsp;&nbsp;&nbsp;Logout</a></li>
        <li class="divider"></li>
    </li>
</ul>

<div class="parallax-container" style="height: 400px;">
    <div class="parallax"><img src="./Assets/img/para2.jpg"></div>
</div>
<!-- contents -->
<div class="container-fluid">
    <br>
    <div class="row">
        <div class="col s12 m8 offset-m2">
            <div class="col s12 m12">
                <nav class="nav-height">
                    <div class="nav-wrapper">
                        <form>
                            <div class="input-field" style="background-color: #4DB6AC;">
                                <input id="search" type="search" required>
                                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                                <i class="material-icons">close</i>
                            </div>
                        </form>
                    </div>
                </nav>
            </div>
        </div>

        <div class="col s12 m3">
            <br>

            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align"><b>Notifications</b></span>

                        <ul class="collection with-header">
                            <li class="collection-item">
                                <div>notification..<a href="#!" class="secondary-content"><span
                                            class="new badge green"></span></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>notification..<a href="#!" class="secondary-content"><span
                                            class="new badge green"></span></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>notification..<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>notification..<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>notification..<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>notification..<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align"><b>Agri.News</b></span>

                        <ul class="collection with-header">
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <div class="col s12 m6">
            <br>
            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align"><b>Vegetables & Crops</b></span>
                        <div class="owl-carousel white-text cfont">
                            <img class="item valign-wrapper" src="./Assets/img/product-1.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-2.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-3.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-4.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-5.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-6.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-7.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-8.jpg">
                            <img class="item valign-wrapper" src="./Assets/img/product-9.jpg">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align"><b>Farmers Announcements</b></span>

                        <ul class="collection with-header">
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                            <li class="collection-item">
                                <div>Alvin<a href="#!" class="secondary-content"></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align"><b>Farmers Announcements</b></span>

                        <canvas id="bar-chart" width="400" height="250"></canvas>
                    </div>
                </div>
            </div>
        </div>



        <div class="col s12 m3">
            <br>
            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align"><b>Weather Today</b></span>
                        <ul class="collection with-header">
                            <li class="collection-item">
                                <a class="weatherwidget-io" href="https://forecast7.com/en/10d8576d27/kerala/"
                                   data-theme="pure"></a>
                                <script>
                                    !function (d, s, id) {
                                        var js, fjs = d.getElementsByTagName(s)[0];
                                        if (!d.getElementById(id)) {
                                            js = d.createElement(s);
                                            js.id = id;
                                            js.src = 'https://weatherwidget.io/./Assets/js/widget.min.js';
                                            fjs.parentNode.insertBefore(js, fjs);
                                        }
                                    }(document, 'script', 'weatherwidget-io-js');
                                </script>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col s12 m12">
                <div class="card">
                    <div class="card-content">
                        <ul class="collection with-header">
                            <li class="collection-item"><b>Department of Agriculture Development and Farmers'
                                    Welfare</b></li>
                            <li class="collection-item">Vikas Bhavan,</li>
                            <li class="collection-item">Thiruvananthapuram-695 033</li>
                            <li class="collection-item">Phone: 0471 - 2304480, 2304481</li>
                            <li class="collection-item">E-mail: krishidirector@gmail.com</li>

                        </ul>
                    </div>
                </div>
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
                    <li><img src="./Assets/img/add (3).png" alt="" width="14px">
                        <span class=""> Near Municipal Busbay, Thdupuzha, Kerala, India.</span>
                    </li>
                    <li><img src="./Assets/img/add (2).png" alt="" width="14px"><span class="text"> +2 392 3929210</span>
                    </li>
                    <li><img src="./Assets/img/add (1).png" alt="" width="14px"></span><span class="text">
                            info@yourdomain.com</span></li>
                </ul>
            </div>
            <div class="col l3 s12">
                <h5>Menu</h5>
                <ul class="">
                    <li><a class="grey-text" href="sass.html">Home</a></li>
                    <li><a class="grey-text" href="badges.html">About</a></li>
                    <li><a class="grey-text" href="collapsible.html">Contact US</a></li>
                    <li><a class="grey-text" href="mobile.html">Login</a></li>
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
<script type="text/javascript" src="./Assets/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="./Assets/js/materialize.min.js"></script>
<script src="./Assets/js/owl.carousel.min.js"></script>
<script src="./Assets/js/Chart.min.js"></script>
<script>
                                    $(document).ready(function () {
                                        $('.sidenav').sidenav();
                                        $('.parallax').parallax();
                                        $('.collapsible').collapsible();
                                        $('.dropdown-trigger').dropdown();
                                    });
                                    $('.owl-carousel').owlCarousel({
                                        items: 3,
                                        margin: 10,
                                        autoHeight: false,
                                        autoplay: true,
                                        autoplayTimeout: 5000,
                                        loop: true,
                                        autoplaySpeed: 2000,
                                        animateOut: 'fadeOut'
                                    });
                                    $(".scroll").click(function (e) {
                                        $('html, body').animate({scrollTop: 0}, 'slow');
                                    });
</script>


<script>
    var years = [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050];
    // For drawing the lines
    var africa = [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478];
    var asia = [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267];
    var europe = [168, 170, 178, 190, 203, 276, 408, 547, 675, 734];
    var latinAmerica = [40, 20, 10, 16, 24, 38, 74, 167, 508, 784];
    var northAmerica = [6, 3, 2, 2, 7, 26, 82, 172, 312, 433];

    new Chart(document.getElementById("bar-chart"), {
        type: 'line',
        data: {
            labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
            datasets: [{
                    label: "Population (millions)",
                    backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                    data: [2478, 5267, 734, 784, 433],
                    fill: false
                }]
        },
        options: {
            legend: {
                display: false
            },
            title: {
                display: true,
                text: 'Predicted world population (millions) in 2050'
            }
        }
    });
</script>
</body>

</html>