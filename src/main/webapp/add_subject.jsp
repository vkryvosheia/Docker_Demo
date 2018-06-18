<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" ng-app="list_app">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ЛК ДУТ</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">

    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href="assets/css/bootstrap-switch.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link href="assets/css/roundslider.css" rel="stylesheet">
    <script src="assets/js/angular.min.js"></script>

    <script src="assets/js/angular-translate.min.js"></script>
    <script src="assets/js/getMarks.js"></script>
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/roundslider.js"></script>

    <script src="assets/js/bootstrap-switch.js"></script>
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
        <%--<a href="#" onclick="menu_open();" style="margin-left: 10px;margin-top: 3px" class="btn btn-primary btn-circle text-center"><i style="margin-top: 6px;" class="fa fa-bars fa-2x" aria-hidden="true"></i></a>--%>
        <%--<div style="color: white;--%>
<%--padding: 15px 50px 5px 50px;--%>
<%--float: right;--%>
<%--font-size: 16px;">--%>
            <%--&lt;%&ndash;&nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Вийти</a> &ndash;%&gt;--%>
        <%--</div>--%>
    </nav>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/photo.png" class="user-image img-responsive"/>
                </li>


                <li>
                    <a   href="index.jsp"><i class="fa fa-university fa-2x"></i> Головна</a>
                </li>
                <li>
                    <a class="active-menu" href="marks.jsp"><i class="fa fa-book fa-2x"></i>Оцінки</a>
                </li>

                <li  >
                    <a   href="subjects.jsp"><i class="fa  fa-tasks  fa-2x"></i> Предмети</a>
                </li>
                <li  >
                    <a   href="groups.jsp"><i class="fa  fa-braille fa-2x"></i> Групи</a>
                </li>
                <li  >
                    <a  href="students.jsp"><i class="fa fa-users fa-2x"></i>Студенти</a>
                </li>
                <li>
                    <a  href="documents.jsp"><i class="fa fa-file-text fa-2x"></i> Накази</a>
                </li>
                <li class="active">
                    <a href="#"><i class="fa fa-plus fa-2x"></i> Додати<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a  href="add_student.jsp">Студента</a>
                        </li>
                        <li>
                            <a class="active-menu" href="add_subject.jsp">Предмет</a>
                        </li>
                        <li>
                            <a  href="add_group.jsp">Групу</a>
                        </li>
                        <li>
                            <a  href="add_doc.jsp">Наказ</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>

    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Додати предмет</h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">

                                    <form role="form">
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Предмет: </span>
                                            <input type="text" class="form-control" id="nameOfSubject" name  = "studentsName">
                                        </div>
                                        <br>
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">К-ст годин: </span>
                                            <input type="number" class="form-control" id="amountOfHours" name  = "studentsName">
                                        </div>
                                        <br>
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Система маркування: </span>
                                            <select class="form-control" id="systemOfMarking">
                                                <option value="12">12</option>
                                                <option value="5">5</option>
                                            </select>
                                        </div>
                                        <br>
                                        <div class="form-groupsModel" ng-init="get_spec()">
                                            <label>Спеціальність:</label>
                                            <select class="form-control" ng-change="get_groups2()" ng-model="selectedItem">
                                                <option ng-repeat="spec in specs"  ng-click="get_groups(spec.id);" value="{{spec.id}}">{{spec.name}}</option>
                                            </select>
                                        </div>
                                        <br>
                                        <div class="form-groupsModel" >
                                            <label>Група:</label>
                                            <select class="form-control" id="groups">
                                                <option value="0">Вибрати групу</option>
                                                <option ng-repeat="group in groups" value="{{group.id}}">{{group.name}}</option>
                                            </select>
                                        </div>
                                        <br>
                                        <div class="form-groupsModel" >
                                        <label>Семестр:</label>
                                        <select class="form-control" id="semester">
                                            <option>1</option>
                                            <option>2</option>
                                        </select>
                                    </div>
                                        <br>
                                        <div class="form-groupsModel" >
                                            <label>Іспит:</label>
                                            <select class="form-control" id="typeOfTest">
                                                <option>Немає</option>
                                                <option>Залік</option>
                                                <option>Екзамен</option>
                                                <option>ДПА</option>
                                            </select>
                                        </div>
                                        <br>
                                        <div class="form-groupsModel" >
                                            <label>Викладач:</label>
                                            <select class="form-control" id="teacher">
                                                <option value="1">Викладач 1</option>
                                                <option value="2">Викладач 2</option>
                                                <option value="3">Викладач 3</option>
                                                <option value="4">Викладач 4</option>
                                            </select>
                                        </div>
                                        <br>
                                        <button type="submit" class="btn btn-primary vvf" ng-click="add_subjects();">Додати</button>
                                        <div class="loader hidden" style="width: 10px; height: 10px; margin: 6px;"></div>
                                        <!--<button type="reset" class="btn btn-primary">Скинути дані</button>-->

                                    </form>
                                    <br />
                                </div>


                            </div>
                        </div>
                    </div>
                    <!-- End Form Elements -->
                </div>
            </div>
            <!-- /. ROW  -->
            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. NAV SIDE  -->


    <!-- /. PAGE WRAPPER  -->
    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->

    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("[name='my-checkbox']").bootstrapSwitch();
            $("#demo").roundSlider({
                min: 0,
                max: 300,
                step: 2,
                radius: 50,
                value: 0,
                sliderType: "min-range"

            });
        });
    </script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>

</div>
</body>
</html>
