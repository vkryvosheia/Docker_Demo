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
    <link rel="stylesheet" href="assets/css/build.css"/>
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
<div class="back_load hidden">
    <div class="div_loader"></div>
</div>
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
font-size: 16px;"> &nbsp;
        <%--//    <a href="#" class="btn btn-danger square-btn-adjust">Вийти</a> --%>
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
                    <a href="marks.jsp"><i class="fa fa-book fa-2x"></i>Оцінки</a>
                </li>

                <li  >
                    <a   href="subjects.jsp"><i class="fa  fa-tasks  fa-2x"></i> Предмети</a>
                </li>
                <li  >
                    <a   href="groups.jsp"><i class="fa  fa-braille   fa-2x"></i> Групи</a>
                </li>
                <li  >
                    <a class="active-menu" href="students.jsp"><i class="fa fa-users fa-2x"></i>Студенти</a>
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
                    <h2>Студенти</h2>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="col-md-12">
                <h3>Фільтр</h3>
                <!--<input type="button" ng-click = "testt()">TEST-->
                <br>
                <div class="btn-group" ng-init="get_spec()">
                    <button class="btn btn-primary" >Спеціальність</button>
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li ng-repeat="spec in specs" class="liHo" ng-click="get_groups(spec.id); clear_table();"><a>{{spec.name}}</a></li>

                    </ul>
                    <h2 style="visibility: hidden" class = "stud_id_on_page">{{student.id}}</h2>
                    <p class="spec_p">{{specp}}</p>

                </div>
            </div>
            <div class="col-md-6">
                <div id="groups" class="hidden">
                    <h4>Групи</h4>
                    <a class="bb btn btn-success ng-but" onclick="disableS(this);" ng-repeat="group in groups"  ng-click="get_students(group.id);" ng-disabled="isDisabled" ng-model="isDisabled" onclick = "show_table()">{{group.name}}</a>
                </div>
            </div>
            <div class="row hidden vv" id="student">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="#" style="color: black" class="btn btn-default center-block" ng-click="import_all_files(gr)"><i class="fa fa-save fa-lg"></i> Зберегти файли групи</a>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Дії</th>
                                        <th>Прізвище, ім’я, по батькові</th>
                                        <th>Дата народження</th>
                                        <th>Адреса</th>
                                        <th>Роки</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="odd_gradeX" ng-repeat="student in students" ng-init = "show_undecreed()">
                                        {{enabled[1]}}
                                        <td>
                                            <div class = "td_hide">
                                                <a style="float:left;" class="btn btn-success bt_dn" ng-click = "import_into_file(student.id)"><i class="fa fa-file-word-o fa-lg"></i></a>
                                                <a href="#" class="btn btn-danger"><i class="fa fa-trash-o fa-lg"></i></a>
                                                <p class="spec_p">{{specp}}</p>
                                            </div>

                                            <div style="visibility: hidden;" class="transfer_checkbox">
                                                <input type="checkbox" class = "transfer_checkbox_ch" name = "transfer checkbox"  ng-click="test_checkboxes(student.id)"/><span>Перевести</span>
                                            </div>
                                        </td>
                                        <td><a href = "stud_info.jsp?id={{student.id}}" style="text-decoration: none; color: black">{{student.pib}}</a></td>
                                        <td>{{student.dateOfBirth}}</td>
                                        <td class="center">{{student.addressOfResidence}}</td>
                                        <td>{{student.currentYear}} / {{student.currentYear+1}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                         <button id = "transfer_button" class = "btn btn-primary" ng-click = "transfer_students_select(student.id)">Перевести на наступний курс</button>
                         <button id = "transfer_group_button" class = "btn btn-primary" ng-click = "transfer_full_group()">Перевести всю групу</button>
                         <button id = "submit_transfer_button" class = "btn btn-warning" ng-click = "transfer_students()">Перевести вибраних студентів</button>
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
