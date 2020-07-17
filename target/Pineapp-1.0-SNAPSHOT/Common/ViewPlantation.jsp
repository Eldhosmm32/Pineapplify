<%-- 
    Document   : Plantation
    Created on : Jun 13, 2020, 6:27:30 PM
    Author     : user
--%>


<%
    response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
    String name = (String) session.getAttribute("userName");
    if (name == "") {
        response.sendRedirect("./");
    }
%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean class="com.pineapplify.services.PlantationServices" id="ps"></jsp:useBean>
<jsp:useBean class="com.pineapplify.services.OwnerHomeServices" id="ohs"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <!--Import materialize.css-->
        <link href="./Assets/css/material.icons.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/owner.css" media="screen,projection" />
        <script type="text/javascript" src="./Assets/js/jquery-3.4.1.js"></script>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Cultivation</title>
    </head>

    <body>
        <!-- navbar -->
        <nav class="navbar navbgcol white" id="navi">
            <div class="container nav-wrapper">
                <a href="Login" class="brand-logo">
                    <img class="materialboxed logos" width="200" src="./Assets/img/logo.png">
                </a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
                        class="material-icons navulcol">menu</i></a>
                <ul class="right hide-on-med-and-down ul-style2">
                    <li><a href="" class="dropdown-trigger" data-target="noti"><i class="material-icons pcol-text" style="position: absolute;">notifications</i><small
                                class="notification-badge"><% out.print(ohs.getUpdateCount(session.getAttribute("userMail").toString())); %></small></a></li>
                    <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown1">Operations<i
                                class="material-icons right">arrow_drop_down</i></a></li>
                    <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown2">${userName}<i
                                class="material-icons right">arrow_drop_down</i></a></li>
                </ul>
            </div>
        </nav>

        <!--notification drop-down-->
        <ul id="noti" class="dropdown-content dpos2">
            <li style="padding-top:7px"><h6>&nbsp;&nbsp;&nbsp;&nbsp;NOTIFICATIONS</h6></li>
            <li class="divider"></li>
        </ul>

        <ul id="dropdown1" class="dropdown-content dpos">
            <li><a href="ManagePlantation">Manage</a></li>
            <li class="divider"></li>
            <li><a href="ViewCultivation">Cultivation</a></li>
        </ul>

        <ul id="dropdown2" class="dropdown-content dpos">
            <li><a href="Login">Home</a></li>
            <li class="divider"></li>
            <li><a href="ViewProfile">Profile</a></li>
            <li class="divider"></li>
            <li><a href="Logout">Logout</a></li>
        </ul>

        <!-- sidebar -->
        <ul class="sidenav" id="mobile-demo">
            <br>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${userName}</b>
            <li class="divider"></li>
            <li><a href="Login">&nbsp;&nbsp;&nbsp;Home</a></li>
            <li class="divider"></li>
            <li><a href="ViewNotification">&nbsp;&nbsp;&nbsp;Notifications 
                    <span class="badge new red" style="text-align:left;"><% out.print(ohs.getUpdateCount(session.getAttribute("userMail").toString())); %>
                    </span>
                </a>
            </li>
            <li class="divider"></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Operations</b>
            <li class="divider"></li>
            <li><a href="ManagePlantation">&nbsp;&nbsp;&nbsp;Manage</a></li>
            <li class="divider"></li>
            <li><a href="ViewCultivation">&nbsp;&nbsp;&nbsp;Cultivation</a></li>
            <li class="divider"></li>
            <li><a href="Logout"><b>Logout</b></a></li>
            <li class="divider"></li>
        </ul>

        <!-- contents -->
        <br class="hide-on-small-only">
        <div class="container-fluid">
            <%
                String id = session.getAttribute("id").toString();
                ResultSet rs = ps.loadPlantationAll(session.getAttribute("userMail").toString(), id);
                rs.next();
            %>
            <div class="row card-panel">
                <div class="col s12 m6 l6">
                    <h3 class="mt-0 mb-0 <%= rs.getString("col_name") + "-text"%> "><%= rs.getString("plt_name")%></h3>
                    <span>Here you can see and change the cultivation details of a plantation.</span>
                </div>
                <div class="col s12 m6 l3">
                    <div class="col">
                        <label class="col">IMPORTANT DATES</label>
                        <br>
                        <img class="col" src="./Assets/img/calendar.png" height=20>
                        <label class="col pl-0">Plantation Added:&nbsp;<%= ps.convertDate(rs.getString("plt_date"))%></label>
                        <br>
                        <img class="col" src="./Assets/img/calendar.png" height=20>
                        <label class="col pl-0">Cultivation Started:&nbsp;<%
                            if (!rs.getString("cul_start").equals("N/A")) {
                                out.print(ps.convertDate(rs.getString("cul_start")));
                            } else {
                                out.print("N/A");
                            }%> </label>
                    </div>
                </div>
                <div class="col s12 m6 l3">
                    <div class="col">
                        <img class="col" src="./Assets/img/calendar.png" height=20>
                        <label>1st Harvest (expected):&nbsp;<%
                            if (!rs.getString("cul_rot1").equals("N/A")) {
                                out.print(ps.convertDate(rs.getString("cul_rot1")));
                            } else {
                                out.print("N/A");
                            }%> </label>
                    </div>
                    <div class="col">
                        <img class="col" src="./Assets/img/calendar.png" height=20>
                        <label>2nd Harvest (expected):&nbsp;<%
                            if (!rs.getString("cul_rot2").equals("N/A")) {
                                out.print(ps.convertDate(rs.getString("cul_rot2")));
                            } else {
                                out.print("N/A");
                            }%> </label>
                    </div>
                    <div class="col">
                        <img class="col" src="./Assets/img/calendar.png" height=20>
                        <label>3rd Harvest (expected):&nbsp;<%
                            if (!rs.getString("cul_rot3").equals("N/A")) {
                                out.print(ps.convertDate(rs.getString("cul_rot3")));
                            } else {
                                out.print("N/A");
                            }%> </label>
                    </div>
                </div>
            </div>


            <div class="row card-panel
                 <%
                     if (!rs.getString("cul_start").equals("N/A")) {
                         out.print("hide");
                     }
                 %>
                 ">
                <div class="col s12 m6 l6 offset-l3 offset-m3">
                    <ul class="collection">
                        <form action="ViewPlantation" method="post" id="UpdateForm">
                            <li class="collection-item">
                                <h5>Set Cultivation starting date</h5>
                                <label class="red-text">Set cultivation start date. Once it is done it can"t be changed.</label>
                            </li>
                            <li class="collection-item">
                                <div class="row mb-0">
                                    <div class="input-field col s12 m10 l6 offset-m1 offset-l3">
                                        <input id="date" type="text" name="startDate" class="datepicker col l12 white" required>
                                        <label for="date">Cultivation start date</label>
                                    </div>

                                </div>
                            </li>
                            <li class="collection-item">
                                <h5>Set cultivation process Intervals</h5>
                                <label class="green-text">Changing interval will affect all connected plantation dates (default interval values initialized.)</label>
                            </li>
                            <li class="collection-item">
                                <p class="range-field mb-0 mt-0" style="font-size: 15px">
                                    <input name="manuring" type="range" id="manuring" value="<%= rs.getString("int_manuring")%>" min="1" max="120"
                                           onchange="updateTextInput(this.value, this.name);" />
                                    <span id="showm">Manuring interval is <b><%= rs.getString("int_manuring")%></b> days </span>
                                </p>
                            </li>
                            <li class="collection-item">
                                <p class="range-field mb-0 mt-0">
                                    <input name="cleaning" type="range" id="cleaning" value="<%= rs.getString("int_cleaning")%>" min="1" max="120"
                                           onchange="updateTextInput(this.value, this.name);" />
                                    <span id="showc">Cleaning interval is <b><%= rs.getString("int_cleaning")%></b> days </span>
                                </p>
                            </li>
                            <li class="collection-item">
                                <p class="range-field mb-0 mt-0">
                                    <input name="checking" type="range" id="checking" value="<%= rs.getString("int_checking")%>" min="1" max="120"
                                           onchange="updateTextInput(this.value, this.name);" />
                                    <span id="showch">Checking interval is <b><%= rs.getString("int_checking")%></b> days </span>
                                </p>
                            </li>
                            <li class="collection-item">
                                <p class="range-field mb-0 mt-0">
                                    <input name="watering" type="range" id="watering" value="<%= rs.getString("int_watering")%>" min="1" max="120"
                                           onchange="updateTextInput(this.value, this.name);" />
                                    <span id="showw">Watering interval is <b><%= rs.getString("int_watering")%></b> days </span>
                                </p>
                            </li>
                            <li class="collection-item white">
                                <button class="btn waves-effect waves-light" type="submit" type="submit">Update</button>
                                <input type="hidden" name="update" value="1">
                                <input type="hidden" name="email" value=<%= rs.getString("plt_owner")%>>
                                <input type="hidden" id="plantation" name="plantation" value=<%=id%>>
                            </li>
                        </form>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid row <% if (rs.getString("cul_start").equals("N/A")) {
                out.print("hide");
            }%>">
            <div class="col s12 m12 l9">
                <div class="col l12 s12 m12 white z-depth-1">
                    <div class="pcol-text"><h5 class="center-align">TimeLine</h5></div>
                    <section class="collection">
                        <ul class="collection border-n ulpad">
                            <div class="newpadding center-align">
                                <i class="material-icons small brown-text">golf_course</i>
                            </div>
                            <div class="block z-depth-1"></div>
                            <%
                                ResultSet rs5 = ps.loadTimeLine(id);
                                Boolean RL = true;
                                while (rs5.next()) {
                                    String loc, icon = "", col = "";
                                    if (RL == true) {
                                        loc = "";
                                        RL = false;
                                    } else {
                                        loc = "offset-l6 offset-m6";
                                        RL = true;
                                    }
                                    out.print("<div class='col l6 m6 s12 " + loc + "'>"
                                            + "<div class='card mb-40 newborder'>"
                                            + "<div class='card-content newpadding'>"
                                            + "<span class='card-title center-align mb-0'>" + rs5.getString("dat_cat") + " on " + ps.convertDate(rs5.getString("dat_date")) + "");
                                    if (rs5.getString("dat_status").equals("0")) {
                                        col = "yellow-text";
                                        icon = "watch_later";
                                    }
                                    if (rs5.getString("dat_status").equals("1")) {
                                        col = "green-text";
                                        icon = "check_circle";
                                    }
                                    if (rs5.getString("dat_status").equals("2")) {
                                        col = "red-text";
                                        icon = "cancel";
                                    }
                                    out.print("<i class='material-icons right small " + col + "'>" + icon + "</i>"
                                            + "</span></div></div></div>");
                                }
                                rs5.close();
                            %>
                        </ul>
                        <div class="newpadding center-align">
                            <i class="material-icons small brown-text">gps_fixed</i>
                        </div>
                        <div class="col l6 m6 s12 offset-l3 mb-10">
                            <div class="card mt-40 newborder">
                                <div class="card-content newpadding">
                                    <span class="card-title center-align mb-0">Expect 1st harvest around 
                                        <%
                                            if (!rs.getString("cul_start").equals("N/A")) {
                                                out.print(ps.convertDate(rs.getString("cul_rot1")));
                                            }
                                        %>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col l6 m6 s12 offset-l3 mb-10">
                            <div class="card mt-40 newborder">
                                <div class="card-content newpadding">
                                    <span class="card-title center-align mb-0">Expect 2nd harvest around 
                                        <%
                                            if (!rs.getString("cul_start").equals("N/A")) {
                                                out.print(ps.convertDate(rs.getString("cul_rot2")));
                                            }
                                        %>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col l6 m6 s12 offset-l3 mb-10">
                            <div class="card mt-40 newborder">
                                <div class="card-content newpadding">
                                    <span class="card-title center-align mb-0">Expect 3rd harvest around 
                                        <%  if (!rs.getString("cul_start").equals("N/A")) {
                                                out.print(ps.convertDate(rs.getString("cul_rot3")));
                                            }
                                        %>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>


            <div class="col s12 m12 l3">
                <div class="col l12 s12 m12 white z-depth-1">
                    <div class="collection">
                        <a class="collection-item"><h5 class="pcol-text">Intervals</h5></a>
                        <a class="collection-item pcol-text"><span class="badge"><%= rs.getString("int_manuring")%> Days</span>Manuring</a>
                        <a class="collection-item pcol-text"><span class="badge"><%= rs.getString("int_cleaning")%> Days</span>Cleaning</a>
                        <a class="collection-item pcol-text"><span class="badge"><%= rs.getString("int_checking")%> Days</span>Checking</a>
                        <a class="collection-item pcol-text"><span class="badge"><%= rs.getString("int_watering")%> Days</span>Watering</a>
                    </div>

                    <div class="collection">
                        <a class="collection-item"><h5 class="pcol-text">Specific dates</h5></a>
                        <div class="collection-item">
                            <form method="post" action="CategoryListing" name="form" onchange="javascript:document.form.submit();">
                                <select class="browser-default" name="category" required>
                                    <option value="<%=id%>|0" selected>Select Category</option>
                                    <option value="<%=id%>|1">Manuring</option>
                                    <option value="<%=id%>|2">Cleaning</option>
                                    <option value="<%=id%>|3">Checking</option>
                                    <option value="<%=id%>|4">Watering</option>
                                </select>
                            </form>

                        </div>
                        <%
                            ResultSet rs1 = (ResultSet) request.getAttribute("dates");
                            if (rs1 != null) {
                                Boolean f = true;
                                if (rs1.first() == false) {
                                    f = false;
                                } else {
                                    rs1.first();
                                }
                                do {
                                    if (f == true) {
                                        out.print("<a class='collection-item pcol-text'><span class='badge'>" + ps.convertDate(rs1.getString("dat_date")) + "</span>" + rs1.getString("dat_cat") + " date: </a>");
                                    }
                                } while (rs1.next());
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <%
            rs.close();
            ps.closeConnection();
            ohs.closeConnection();
        %>
        <br class="hide-on-small-only">
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
                            <li><img src="./Assets/img/add (2).png" alt="" width="14px"><span class="text"> +2 392
                                    3929210</span>
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

        <script type="text/javascript" src="./Assets/js/materialize.min.js"></script>
        <script type="text/javascript" src="./Assets/js/sweetalert.min.js"></script>

        <script>
                                if (document.getElementById('UpdateForm')) {
                                    document.querySelector('#UpdateForm').addEventListener('submit', function (e) {
                                        var form = this;
                                        e.preventDefault(); // <--- prevent form from submitting
                                        swal({
                                            title: "Pineapplify",
                                            text: "Once updated it cant be chenged, Are you sure?",
                                            icon: "warning",
                                            buttons: [
                                                'No, cancel it!',
                                                'Yes, I am sure!'
                                            ],
                                            dangerMode: true
                                        }).then(function (isConfirm) {
                                            if (isConfirm) {
                                                swal({
                                                    title: 'Pineapplify!',
                                                    text: 'Cultivation starting date updated successfully!',
                                                    icon: 'success'
                                                }).then(function () {
                                                    form.submit(); // <--- submit form programmatically
                                                });
                                            } else {
                                                swal("Pineapplify", "No changes maded", "warning");
                                            }
                                        });
                                    });
                                }
        </script>

        <script>
            function updateTextInput(val, name) {
                if (name === "manuring") {
                    document.getElementById('showm').innerHTML = "Manuring interval is <b>" + val + "</b> days";
                }
                if (name === "cleaning") {
                    document.getElementById('showc').innerHTML = "Cleaning interval is <b>" + val + "</b> days";
                }
                if (name === "checking") {
                    document.getElementById('showch').innerHTML = "Checking interval is <b>" + val + "</b> days";
                }
                if (name === "watering") {
                    document.getElementById('showw').innerHTML = "Watering interval is <b>" + val + "</b> days";
                }
            }

            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.parallax').parallax();
                $('.collapsible').collapsible();
                $('.dropdown-trigger').dropdown({alignment: 'right'});
                $('.datepicker').datepicker({
                    selectMonths: true,
                    format: 'dd/mm/yyyy'
                });
            });
            $(".scroll").click(function (e) {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });
            if (window.history.replaceState) {
                window.history.replaceState(null, null, "ViewPlantation");
            }
        </script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "GET",
                    url: "ViewNotificationList",
                    success: function (data) {
                        $("#noti").html(data);
                    }
                });
            });
        </script>
    </body>

</html>