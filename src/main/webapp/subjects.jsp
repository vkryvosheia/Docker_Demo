<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
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
        <%--<a href="#" onclick="menu_open();" style="margin-left: 10px;margin-top: 3px" class="btn btn-primary btn-circle text-center"><i style="margin-top: 6px;" class="fa fa-bars fa-2x" aria-hidden="true"></i></a>--%>
        <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">
            <%--&nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Вийти</a> --%>
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
                    <a   href="index.jsp"><i class="fa fa-university fa-2x"></i> Головна</a>
                </li>
                <li>
                    <a  href="marks.jsp"><i class="fa fa-book fa-2x"></i>Оцінки</a>
                </li>

                <li  >
                    <a  class="active-menu" href="subjects.jsp"><i class="fa  fa-tasks  fa-2x"></i> Предмети</a>
                </li>
                <li  >
                    <a   href="groups.jsp"><i class="fa  fa-braille   fa-2x"></i> Групи</a>
                </li>
                <li  >
                    <a  href="students.jsp"><i class="fa fa-users fa-2x"></i>Студенти</a>
                </li>
                <li>
                    <a  href="documents.jsp"><i class="fa fa-file-text fa-2x"></i> Накази</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-plus fa-2x"></i> Додати<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a  href="add_student.jsp">Студента</a>
                        </li>
                        <li>
                            <a  href="add_subject.jsp">Предмет</a>
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
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Предмети</h2>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="col-md-12">
                <h3>Фільтр</h3>
                <br>
                <div class="btn-group" ng-init="get_spec()">
                    <button class="btn btn-primary" >Спеціальність</button>
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li ng-repeat="spec in specs" class="liHo" ng-click="get_groups(spec.id);"><a>{{spec.name}}</a></li>

                    </ul>
                    <p class="spec_p">{{specp}}</p>

                </div>
            </div>
            <div class="col-md-6">
                <div id="groups" class="hidden">
                    <h4>Групи</h4>
                    <a class="bb btn btn-success ng-but" onclick="disableS(this);" ng-repeat="group in groups"  ng-click="get_subjects(group.id, 1);" ng-disabled="isDisabled" ng-model="isDisabled">{{group.name}}</a>
                </div>
            </div>
            <div class="row hidden" id="student">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Дії</th>
                                        <th>Назва предмету</th>
                                        <th>Викладач</th>
                                        <th>К-ст годин</th>
                                        <th>Оцінка</th>
                                        <th>Тип тесту</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX" ng-repeat="subject in subjects">
                                        <td>
                                            <div class="btn-group">
                                                <button class="btn btn-primary" >Дії</button>
                                                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><span class="caret"></span></button>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="sub_info.jsp">Інформація <br>по предмету</a></li>
                                                        <li class="divider"></li>
                                                        <a href="#" class="btn btn-danger center-block"><i class="fa fa-trash-o fa-lg"></i> Видалити</a>
                                                    </ul>
                                                <p class="spec_p">{{specp}}</p>
                                            </div>
                                        </td>
                                        <td>{{subject.nameOfSubject}}</td>
                                        <td>{{subject.teacher}}</td>
                                        <td>{{subject.amountOfHours}}</td>
                                        <td>{{subject.systemOfMarking}}</td>
                                        <td ng-if="subject.typeOfTest=='Немає'">-</td>
                                        <td ng-if="subject.typeOfTest=='Екзамен'">Екзамен</td>
                                        <td ng-if="subject.typeOfTest=='ДПА'">Дпа</td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
        </div>

    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<!-- MORRIS CHART SCRIPTS -->
<%--<script src="assets/js/morris/raphael-2.1.0.min.js"></script>--%>
<%--<script src="assets/js/morris/morris.js"></script>--%>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>


</body>
</html>
