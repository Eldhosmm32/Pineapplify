<%-- 
    Document   : header
    Created on : Jul 10, 2020, 12:10:22 PM
    Author     : user
--%>

<br>
<script type="text/javascript" src="<%=request.getContextPath()%>/Assets/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Assets/js/materialize.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Assets/js/sweetalert.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/Assets/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/Assets/css/common.css" media="screen,projection" />
<%
    out.print("<span class='new badge left' data-badge-caption='Welcome Admin'></span>");
%>
<a href="<%=request.getContextPath()%>/Login"><span class="new badge green left" data-badge-caption="Home"></span></a>
<a href="<%=request.getContextPath()%>/Administrator/DateChecker.jsp"><span class="new badge brown left" data-badge-caption="Date Checker"></span></a> 
<a href="<%=request.getContextPath()%>/Administrator/PendingWorks.jsp"><span class="new badge blue left" data-badge-caption="Pending Works"></span></a> 
<a href="<%=request.getContextPath()%>/Administrator/ShowProcessList.jsp"><span class="new badge black left" data-badge-caption="Process"></span></a> 
<a href="<%=request.getContextPath()%>/Logout"><span class="new badge red left" data-badge-caption="Logout"></span></a>
<br>

<style>
    .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        text-align: center;
    }
</style>
<body>