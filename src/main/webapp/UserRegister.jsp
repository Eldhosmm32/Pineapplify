<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="Assets/css/common.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="Assets/css/home.css" media="screen,projection" />
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register</title>
    </head>

    <body>
        <!-- navbar -->
        <div class="navbar-fixed">
            <nav class="navbar navbgcol" id="navi">
                <div class="container nav-wrapper">
                    <a href="index.jsp" class="brand-logo">
                        <img class="materialboxed logos" width="200" src="Assets/img/logo.png">
                    </a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
                            class="material-icons navulcol">menu</i></a>
                    <ul class="hide-on-med-and-down ul-style">
                        <li><a class="navulcol" href="index.jsp">Home</a></li>
                        <li><a class="navulcol" href="about.jsp">About</a></li>
                        <li><a class="navulcol" href="contact.jsp">Contact Us</a></li>
                        <li><a class="navulcol modal-trigger" href="#modal">Login</a></li>
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
        </ul>
        
        <!--Modal-->
        <div id="modal" class="modal">
            <div class="modal-content">
                <div class="row left-align" style="margin-bottom: 0px;">
                    <div class="col s12 m4 hide-on-small-only"
                         style="background-color:#E6E7E3; padding:80px 24px 40px 24px;">
                        <b>
                            <h4>Login</h4>
                        </b>
                        <h6>Get access to your account</h6>
                        <img class="materialboxed logos" width="120px" src="Assets/img/logo.png"
                             style="padding:88px 0px 10px 0px;">
                        <br>
                    </div>
                    <div class="col s12 m8" style="padding: 24px;">
                        <br>
                        <form action="Login" method="POST">
                            <div class="input-field col s12">
                                <input name="userName" id="name" type="text" class="validate" value="thankan23@gmail.com" required/>
                                <label for="name">Enter Email</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="password" id="password" type="password" class="validate" value="11111111" required/>
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

        <!-- parallax -->
        <div class="parallax-container p-cont">
            <div class="parallax responsive-img"><img src="Assets/img/para1.jpg"></div>
        </div>

        <!-- contents -->
        <div class="container">
            <div class="row" style="position: relative; margin-top: -250px">
                <div class="col s12 m12 center-align">
                    <div class="card-panel pcol-text">
                        <h3>PINEAPPLIFY - Farmer Helper</h3>
                    </div>
                </div>
                <div class="col s12 m4 center-align">
                    <div class="card-panel">

                        <ul class="collection">
                            <li class="collection-item">
                                <h5 class="pcol-text cfont">Registration advise<br> </h5>
                            </li>
                            <li class="collection-item"> You can register as a Wholesaler (Maybe as a Company) or a
                                Plantation owner.</li>
                            <li class="collection-item">All the Fields are mandatory.</li>
                            <li class="collection-item">The information about users will be safe in Pineapplify</li>
                            <li class="collection-item">You can use any email-id to create an account, the give email will
                                be your user identification.</li>
                            <li class="collection-item">Password should have 8 Character includes numbers and special
                                Characters.
                            </li>
                            <li class="collection-item">After sign in you can access your Pineapplify account immediately.
                            </li>
                            <li class="collection-item">
                                <img class="materialboxed" width="250" src="Assets/img/logo.png">
                            </li>
                        </ul>


                    </div>
                </div>
                <div class="col s12 m8 center-align">
                    <div class="card-panel">
                        <h5 class="cfont pcol-text">Register here!<br> </h5>
                        <form method="POST" action="UserRegister" onsubmit="return validate()">
                            <div class="row">
                                <div class="input-field col s12 m6 offset-m3">
                                    <select name="role" id="role" class="icons" required>
                                        <option value="0" disabled selected>Choose your Role</option>
                                        <option value="1" data-icon="Assets/img/farmer.png" class="left">Owner</option>
                                        <option value="2" data-icon="Assets/img/wholesale.png" class="left">Wholesalers</option>
                                    </select>
                                </div>
                                <div class="input-field col s12 m12">
                                    <input id="name" name="name" type="text" value="" required>
                                    <label for="name">Name / Company Name</label>
                                </div>
                                <div class="input-field col s12 m12">
                                    <textarea id="address" name="address" class="materialize-textarea" required></textarea>
                                    <label for="address">Address</label>
                                </div>
                                <div class="input-field col s12 m6">
                                    <input id="phone" name="phone" type="number" required>
                                    <label for="phone">Phone Number</label>
                                </div>
                                <div class="input-field col s12 m6">
                                    <input id="place" name="place" type="text" required>
                                    <label for="place">Place</label>
                                </div>
                                <div class="input-field col s12 m12">
                                    <input id="mail_id" name="mail_id" type="email" required>
                                    <label for="mail_id">Mail Id</label>
                                </div>
                                <div class="input-field col s12 m6">
                                    <input id="password_1" name="password_1" type="text" required>
                                    <label for="password_1">Enter password</label>
                                </div>
                                <div class="input-field col s12 m6">
                                    <input id="password_2" name="password_2" type="text" required>
                                    <label for="password_2">Re-Enter password</label>
                                </div>
                                <div class="input-field col s12">
                                    <input type="submit" class="waves-effect col s12 waves-light btn" value="SIGN IN">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>



            </div>
        </div>


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
                            <li><a class="grey-text" href="index.jsp">Login</a></li>
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
                            $(document).ready(function () {
                                $('.sidenav').sidenav();
                                $('.parallax').parallax();
                                $('select').formSelect();
                                $('.modal').modal();
                            });
                            $(window).on('load', function () {
                                $('html, body').scrollTop(0);
                            });
                            $(".scroll").click(function (e) {
                                $('html, body').animate({scrollTop: 0}, 'slow');
                            });
        </script>

        <script>
            function validate() {
                var password = document.getElementById("password_1").value;
                var password2 = document.getElementById("password_2").value;
                var name = document.getElementById("name").value;
                var phone = document.getElementById("phone").value;
                var role = document.getElementById("role").value;
                if (name === "") {
                    Error("name");
                    document.documentElement.scrollTop = 230;
                    return false;
                }
                if (role === "0") {
                    alert('Please Choose your role');
                    Error("role");
                    document.documentElement.scrollTop = 200;
                    return false;
                }
                else if (password.length < 8) {
                    alert('Password must be at least 8 characters long');
                    return false;
                }
                else if (password !== password2) {
                    alert('Passwords not matching');
                    Error("password_1");
                    Error("password_2");
                    document.documentElement.scrollTop = 430;
                    return false;
                }
                else if (phone.length !== 10) {
                    alert('Phone must have 10 characters long');
                    Error("phone");
                    return false;
                }
                else {
                    return true;
                }
            }
            function Error(id) {
                document.getElementById(id).style["borderBottom"] = '1px solid #F44336';
                document.getElementById(id).style["WebkitBoxShadow"] = '0 1px 0 0 #F44336';
                document.getElementById(id).style["boxShadow"] = '0 1px 0 0 #F44336';
            }
            function Change(id) {
                document.getElementById(id).style["borderBottom"] = '1px solid #9e9e9e';
                document.getElementById(id).style["WebkitBoxShadow"] = 'none';
                document.getElementById(id).style["boxShadow"] = 'none';
            }
        </script>
    </body>

</html>