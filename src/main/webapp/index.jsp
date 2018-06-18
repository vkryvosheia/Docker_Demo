<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en" ng-app="list_app">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ЛК ДУТ</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <script src="assets/js/angular.min.js"></script>

    <script src="assets/js/angular-translate.min.js"></script>
    <script src="assets/js/getMarks.js"></script>
    <!-- MORRIS CHART STYLES-->
    <!--<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>-->
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>

</head>
<body ng-controller="MarksListCtrl">
<div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">ЛК ДУТ</a>
        </div>


    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/photo.png" class="user-image img-responsive"/>
                </li>


                <li>
                    <a class="active-menu" href="index.jsp"><i class="fa fa-university fa-2x"></i> Головна</a>
                </li>
                <li>
                    <a href="marks.jsp"><i class="fa fa-book fa-2x"></i>Оцінки</a>
                </li>

                <li>
                    <a href="subjects.jsp"><i class="fa  fa-tasks  fa-2x"></i> Предмети</a>
                </li>
                <li>
                    <a href="groups.jsp"><i class="fa  fa-braille   fa-2x"></i> Групи</a>
                </li>
                <li>
                    <a href="students.jsp"><i class="fa fa-users fa-2x"></i>Студенти</a>
                </li>
                <li>
                    <a href="documents.jsp"><i class="fa fa-file-text fa-2x"></i> Накази</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-plus fa-2x"></i> Додати<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="add_student.jsp">Студента</a>
                        </li>
                        <li>
                            <a href="add_subject.jsp">Предмет</a>
                        </li>
                        <li>
                            <a href="add_group.jsp">Групу</a>
                        </li>
                        <li>
                            <a href="add_doc.jsp">Наказ</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>

    <!-- /. NAV SIDE  -->

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Головна</h2>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr/>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <a href="students.jsp" class="no-line">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-red set-icon">
                                <i class="fa fa-users"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">560</p>
                                <p class="text-muted">Студентів</p>
                            </div>

                        </div>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <a href="subjects.jsp" class="no-line">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-tasks"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">134</p>
                                <p class="text-muted">Предмети</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <a href="groups.jsp" class="no-line">
                    <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-blue set-icon">
                                <i class="fa fa-braille"></i>
                            </span>
                        <div class="text-box">
                            <p class="main-text">16</p>
                            <p class="text-muted">Групи</p>
                        </div>
                    </div>
                        </a>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <a href="documents.jsp" class="no-line">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-brown set-icon">
                            <i class="fa fa-rocket"></i>
                        </span>
                        <div class="text-box">
                            <p class="main-text">2</p>
                            <p class="text-muted">Накази</p>
                        </div>
                    </div>
                        </a>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr/>
            <div class="row">
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>
                        <div class="text-box">
                            <p class="main-text">Нагадування </p>
                            <p class="text-muted">30.10.2016</p>
                            <hr/>
                            <p class="text-muted">
                          <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i>
                              Зробити зміни в розкладі групи ОК-31
                               </span>
                            </p>
                        </div>
                    </div>
                </div>

            <%--</div>--%>
            <!-- /. ROW  -->

            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- MORRIS CHART SCRIPTS -->
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<%--<script src="assets/js/morris/raphael-2.1.0.min.js"></script>--%>
<%--<script src="assets/js/morris/morris.js"></script>--%>
<!-- CUSTOM SCRIPTS -->
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<script src="assets/js/custom.js"></script>

</body>
</html>
