<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="../main">JaeHee</a>
        <!-- Sidebar Toggle-->
        <!-- <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button> -->
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <c:if test="${sessionScope.auth_code == 'normal'}">
                            <a class="nav-link" href="../main">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Home
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.auth_code == 'admin'}">
                            <a class="nav-link" href="../main_admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Home
                            </a>
                        </c:if>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_message" aria-expanded="false" aria-controls="collapse_message">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	??????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_message" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../message/write">????????????</a>
                                <a class="nav-link" href="../message/message_receive">???????????????</a>
                                <a class="nav-link" href="../message/message_send">???????????????</a>
                                <a class="nav-link" href="../message/message_important">???????????????</a>
                                <a class="nav-link" href="../message/message_temp">???????????????</a>
                                <a class="nav-link" href="../message/message_reserved">???????????????</a>
                                <a class="nav-link" href="../message/message_trash">?????????</a>
                            </nav>
                        </div>
                        <c:if test="${sessionScope.auth_code eq 'normal'}">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEDMS"
                            aria-expanded="false" aria-controls="collapseEDMS">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	????????????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseEDMS" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../EDMS/EDMS_home">???????????????</a>
                                <a class="nav-link" href="../EDMS/EDMS_new">???????????????</a>
                                <a class="nav-link" href="../EDMS/EDMS_Temporary_box">???????????????</a>
                                <a class="nav-link" href="../EDMS/EDMS_wait">???????????????</a>
                                <a class="nav-link" href="../EDMS/EDMS_ing">???????????????</a>
                                <a class="nav-link" href="../EDMS/EDMS_end">????????????</a>
                            </nav>
                        </div>


                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_worktime" aria-expanded="false" aria-controls="collapse_worktime">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	????????????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_worktime" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../worktime/worktime_home">???????????????</a>
                                <a class="nav-link" href="../worktime/worktime_new">??????????????????</a>
                                <a class="nav-link" href="../worktime/worktime_wait">???????????????</a>
                                <a class="nav-link" href="../worktime/worktime_ing">???????????????</a>
                                <a class="nav-link" href="../worktime/worktime_end">????????????</a>
                                <a class="nav-link" href="../worktime/worktime_view">???????????????</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="../todo/todo">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            	ToDo+
                        </a>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_calendar" aria-expanded="false" aria-controls="collapse_calendar">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	??????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_calendar" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../calendar">?????????</a>
                                <a class="nav-link" href="../calendar/calendar_mycalendar.html">??? ????????? ??????</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_booking" aria-expanded="false" aria-controls="collapse_booking">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	??????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_booking" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../booking/booking_new">????????????</a>
                                <a class="nav-link" href="../booking/booking_view">?????? ?????? ?????? </a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapse_board" aria-expanded="false" aria-controls="collapse_board">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	?????????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapse_board" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../board/board_notice">???????????????</a>
                                <a class="nav-link" href="../board/board_normal">???????????????</a>
                                <a class="nav-link" href="../board/board_docu">?????????</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collaps_address" aria-expanded="false" aria-controls="collapse_address">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            	?????????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collaps_address" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="../address/address_all">?????? ?????????</a>
                                <a class="nav-link" href="../address/address_personal">?????? ?????????</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="../office_map/office_map">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            	?????????
                        </a>
                        </c:if>
                        <c:if test="${sessionScope.auth_code eq 'admin'}">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEDMS"
                           aria-expanded="false" aria-controls="collapseEDMS">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            ???????????????
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <c class="collapse" id="collapseEDMS" aria-labelledby="headingOne"
                             data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="">??????????????????</a>
                                <a class="nav-link" href="">????????????</a>
                                <a class="nav-link" href="">????????????</a>
                                <a class="nav-link" href="">???????????????</a>
                                <a class="nav-link" href="../admin/admin_personnelCard">??????????????????</a>
                                <a class="nav-link" href="">??????????????????</a>
                                <a class="nav-link" href="">????????????</a>
                            </nav>
                            </c:if>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
        </div>
    
    
    