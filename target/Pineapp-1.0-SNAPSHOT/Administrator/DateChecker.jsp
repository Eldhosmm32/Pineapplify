<%-- 
    Document   : DateChecker
    Created on : Jul 7, 2020, 4:23:49 PM
    Author     : user
--%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="com.pineapplify.services.AdminServices" id="ads"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<br>
<div class="container">
    <div class="row">
        <h4>Monthly Work information</h4>
        <br>
        <select class="browser-default col l2" name="User" id="User" size="0" required>
            <option value="0" selected>Users</option>
            <%
                ResultSet rs = ads.loadUsers();
                while (rs.next()) {
                    out.print("<option value=" + rs.getString("us_mail") + ">" + rs.getString("us_name") + "</option>");
                }
            %>
        </select>

        <select class="browser-default col l3 offset-l1" name="Plantation" id="Plantation">
            <option value="0">Plantation Name</option>
        </select>

        <select class="browser-default col l2 offset-l1" name="Year" id="Year">
            <option value="0">Year</option>
        </select>

        <select class="browser-default col l2  offset-l1" name="Month" id="Month" disabled>
            <option value="0">Month</option>
            <option value="01">Jan</option>
            <option value="02">Feb</option>
            <option value="03">Mar</option>
            <option value="04">Apr</option>
            <option value="05">May</option>
            <option value="06">Jun</option>
            <option value="07">Jul</option>
            <option value="08">Aug</option>
            <option value="09">Sep</option>
            <option value="10">Oct</option>
            <option value="11">Nov</option>
            <option value="12">Dec</option>
        </select>
        <ul class="collection col l6 white" id="Dates" style="padding: 0px">
            <a class="collection-item"><h6 class="pcol-text">Works</h6></a>
            <li class="collection-item">Select details.</li>
        </ul>
    </div>
</div>
<%
    ads.closeConnection();
%>
<script type="text/javascript">
    $user = $("#User");
    $plantation = $("#Plantation");
    $month = $("#Month");
    $year = $("#Year");
    $user.change(function () {
        $.ajax({
            type: "GET",
            url: "../AdminDateCheck",
            data: {
                user: $user.val()
            },
            success: function (data) {
                $("#Plantation").html(data);
            }
        });
    });

    $plantation.change(function () {
        $.ajax({
            type: "GET",
            url: "../AdminDateCheck",
            data: {
                plantation: $plantation.val()
            },
            success: function (data) {
                $("#Year").html(data);
                $month.prop('disabled', false);
                $month.val(0);
                $("#Dates").html("\
        <a class='collection-item'><h6 class='pcol-text'>Works</h6></a>\n\
<li class='collection-item'>Select details.</li>");
            }
        });
    });

    $month.change(function () {
        $.ajax({
            type: "GET",
            url: "../AdminDateCheck",
            data: {
                month: $month.val(),
                plantation: $plantation.val(),
                year: $year.val()
            },
            success: function (data) {
                $("#Dates").html(data);
            }
        });
    });
</script>

<jsp:include page="footer.jsp"/>