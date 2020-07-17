<%-- 
    Document   : EditPlantation
    Created on : Apr 22, 2020, 1:18:37 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<jsp:useBean class="com.pineapplify.services.ManageServices" id="ms"></jsp:useBean>
<jsp:useBean class="com.pineapplify.services.OwnerHomeServices" id="ohs"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <!--Import Google Icon Font-->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

            <!--Import materialize.css-->
            <script type="text/javascript" src="http://livejs.com/live.js"></script>
            <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
            <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
            <link type="text/css" rel="stylesheet" href="./Assets/css/owner.css" media="screen,projection" />

            <!--Let browser know website is optimized for mobile-->
            <title>Manage</title>
        </head>

        <body>
            <!-- navbar -->
            <nav class="navbar navbgcol white" id="navi">
                <div class="container nav-wrapper">
                    <a href="#!" class="brand-logo">
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
        </ul>

        <ul id="dropdown2" class="dropdown-content dpos">
            <li><a href="Login">Home</a></li>
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
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Operations</b></li>
            <li class="divider"></li>
            <li><a href="ManagePlantation">&nbsp;&nbsp;&nbsp;Manage</a></li>
            <li class="divider"></li>
            <li><a href="Logout"><b>Logout</b></a></li>
            <li class="divider"></li>
        </ul>

        <!-- contents -->
        <br class="hide-on-small-only">
        <div class="container">
            <div class="row mb-0">
                <div class="col s12 m12 l6 offset-l3">
                    <div class="card-panel">
                        <form method="post" action="UpdatePlantation" id="UpdateForm" class="row mb-0">
                            <%
                                if (!request.getParameter("pname").toString().equals("")) {
                                    ResultSet rs = (ResultSet) request.getAttribute("updplt");
                                    rs.next();
                                    String name = rs.getString("plt_name");
                                    String col = rs.getString("col_name");
                                    String place = rs.getString("plc_name");
                                    String ver = rs.getString("ver_name");
                                    String wor = rs.getString("wrk_name");
                                    String id = rs.getString("plt_id");
                                    out.print("<h5 class='col m12 s12 " + rs.getString("col_name") + "-text " + " mt-0'>Update " + name + "</h5>");
                                    rs.close();
                            %>
                            <div class="col s12 m12 ">
                            </div>
                            <div class="input-field col s12 m12">
                                <select class="icons" name="verity" required>
                                    <option value="" disabled selected> Choose</option>
                                    <%  ResultSet rs1 = (ResultSet) ms.loadVerities();
                                        if (rs1 != null) {
                                            while (rs1.next()) {
                                                if (rs1.getString("ver_name").equals(ver)) {
                                                    out.print("<option data-icon='./Assets/img/pineapple.png' value=" + rs1.getString("ver_id") + " class='left' selected>" + rs1.getString("ver_name") + "</option>");
                                                } else {
                                                    out.print("<option data-icon='./Assets/img/pineapple.png' value=" + rs1.getString("ver_id") + " class='left'>" + rs1.getString("ver_name") + "</option>");
                                                }
                                            }
                                        }
                                        rs1.close();
                                        out.print("</select> "
                                                + "<label>Pineapple verity</label> "
                                                + " </div> "
                                                + " <input type='hidden' value=" + id + " name='id'>"
                                                + "<div class='input-field col s12 m12'> "
                                                + "<select class='icons' name='place' required> "
                                                + "<option value='' disabled> Choose</option> ");

                                        ResultSet rs2 = (ResultSet) ms.loadPlaceDop();
                                        if (rs2 != null) {
                                            while (rs2.next()) {
                                                if (rs2.getString("plc_name").equals(place)) {
                                                    out.print("<option  value=" + rs2.getString("plc_id") + " class='left' selected>" + rs2.getString("plc_name") + "</option>");
                                                } else {
                                                    out.print("<option  value=" + rs2.getString("plc_id") + " class='left'>" + rs2.getString("plc_name") + "</option>");
                                                }
                                            }
                                        }
                                        rs2.close();

                                        out.print("</select> "
                                                + "<label>Place</label> "
                                                + "</div> "
                                                + "<div class='input-field col s12 m12'> "
                                                + "<select class='icons' name='color' required> "
                                                + "<option value='' disabled selected> Choose</option> ");

                                        ResultSet rs4 = (ResultSet) ms.loadColor();
                                        if (rs4 != null) {
                                            while (rs4.next()) {
                                                if (rs4.getString("col_name").equals(col)) {
                                                    out.print("<option data-icon='./Assets/img/farmer.png' value=" + rs4.getString("col_id") + " class='left' selected>" + rs4.getString("col_name") + "</option>");
                                                } else {
                                                    out.print("<option data-icon='./Assets/img/farmer.png' value=" + rs4.getString("col_id") + " class='left'>" + rs4.getString("col_name") + "</option>");
                                                }
                                            }
                                        }
                                        rs4.close();

                                        out.print("</select> "
                                                + "<label>Color</label> "
                                                + "</div> "
                                                + "<div class='input-field col s12 m12'> "
                                                + "<select class='icons' name='worker' required> "
                                                + "<option value='' disabled selected> Choose</option> ");

                                        ResultSet rs3 = (ResultSet) ms.loadWorker(session.getAttribute("userMail").toString());
                                        if (rs3 != null) {
                                            while (rs3.next()) {
                                                if (rs3.getString("wrk_name").equals(wor)) {
                                                    out.print("<option data-icon='./Assets/img/farmer.png' value=" + rs3.getString("wrk_id") + " class='left' selected>" + rs3.getString("wrk_name") + "</option>");
                                                } else {
                                                    out.print("<option data-icon='./Assets/img/farmer.png' value=" + rs3.getString("wrk_id") + " class='left'>" + rs3.getString("wrk_name") + "</option>");
                                                }
                                            }
                                    %>
                                </select>
                                <label>Worker</label> 
                            </div>
                            <div class="input-field col s12 m12 l12">
                                <input type="submit" class="waves-effect col s12 waves-light pcol btn" value="Update">
                            </div>
                        </form> 
                        <form method="post" action="UpdatePlantation" id="DeleteForm">
                            <div class="row mb-0 mt-0">
                                <div class="input-field col s12 m12 l12 mt-0">
                                    <input type="hidden" name="delete" name="delete"/>
                                    <input type="hidden" name="id" value= <%
                                                out.print(id);
                                            }
                                            rs3.close();
                                            ms.closeConnection();
                                            ohs.closeConnection();
                                        }%> >
                                    <input type="submit" class="waves-effect col s12 waves-light red accent-1 btn" value="Delete plantation">
                                </div>
                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
                        <p class="grey-text text-justify">We majorly deal in helping pineapple cultivators to manage
                            their
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
        <script type="text/javascript" src="./Assets/js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="./Assets/js/materialize.min.js"></script>
        <script type="text/javascript" src="./Assets/js/sweetalert.min.js"></script>
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
        <script>
            document.querySelector('#UpdateForm').addEventListener('submit', function (e) {
                var form = this;
                e.preventDefault(); // <--- prevent form from submitting
                swal({
                    title: "Pineapplify",
                    text: "Update the details, Are you sure?",
                    icon: "warning",
                    buttons: [
                        'No, cancel it!',
                        'Yes, I am sure!'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        swal({
                            title: 'Pineapplify!',
                            text: 'Plantaion details updated!',
                            icon: 'success'
                        }).then(function () {
                            form.submit(); // <--- submit form programmatically
                        });
                    } else {
                        swal("Pineapplify", "No changes maded", "error");
                    }
                })
            });

            document.querySelector('#DeleteForm').addEventListener('submit', function (e) {
                var form = this;
                e.preventDefault(); // <--- prevent form from submitting
                swal({
                    title: "Pineapplify",
                    text: "Delete the plantation, Are you sure?",
                    icon: "error",
                    buttons: [
                        'No, cancel it!',
                        'Yes, I am sure!'
                    ],
                    dangerMode: true,
                }).then(function (isConfirm) {
                    if (isConfirm) {
                        swal({
                            title: 'Pineapplify!',
                            text: 'Plantaion deleted!',
                            icon: 'success'
                        }).then(function () {
                            form.submit(); // <--- submit form programmatically
                        });
                    } else {
                        swal("Pineapplify", "No changes maded", "warning");
                    }
                })
            });</script>

        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, "ManagePlantation");
            }

            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.dropdown-trigger').dropdown({alignment: 'right'});
                $('select').formSelect();
            });
            $(document).click(function () {
                $('li[id^="select-options"]').on('touchend', function (e) {
                    e.stopPropagation();
                });
            });
            $(".scroll").click(function (e) {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });
        </script>
    </body>

</html>