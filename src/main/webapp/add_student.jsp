<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="list_app">
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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script src="assets/js/angular.min.js"></script>
    <script src="assets/js/angular-translate.min.js"></script>
    <script src="assets/js/addMark.js"></script>
    <script src="assets/js/getMarks.js"></script>
</head>
<body ng-controller="MarksListCtrl" ng-init="get_specs(); get_groups_list()">
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
                    <a  href="index.jsp"><i class="fa fa-university fa-2x"></i> Головна</a>
                </li>
                <li>
                    <a  href="marks.jsp"><i class="fa fa-book fa-2x"></i>Оцінки</a>
                </li>

                <li  >
                    <a   href="subjects.jsp"><i class="fa  fa-tasks  fa-2x"></i> Предмети</a>
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
                <li class="active">
                    <a href="#"><i class="fa fa-plus fa-2x"></i> Додати<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="active-menu" href="add_student.jsp">Студента</a>
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
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Додати студента</h2>
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

                                    <form role="form" name = "register_form" id="register_form">
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Прізвище, ім'я, по-батькові: </span>
                                            <input type="text" id = "pib" class="form-control" name  = "pib">
                                        </div>
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Дата народження: </span>
                                            <input type="text" id = "date_of_birth" class="form-control" name  = "dateOfBirth">
                                        </div>
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Місце народження: </span>
                                            <input type="text" id = "place_of_birth" class="form-control" name  = "studentsPlaceOfBirth">
                                        </div>
                                            <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Місце проживання: </span>
                                            <input type="text" id="place_of_living" class="form-control" name  = "studentsPlaceOfLiving">

                                        </div>
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Інститут, факультет, відділення: </span>
                                            <input type="text" id = "institute" class="form-control" name  = "studentsFaculty">
                                        </div>

                                        <div class="form-groupsModel">
                                            <label>Спеціалізація:</label>
                                            <select class="form-control" id = "training_direction">
                                                <option value="Телекомунікації">Телекомунікації</option>
                                                <option value="Комп'ютерна інженерія">Комп'ютерна інженерія</option>
                                            </select>
                                        </div>


                                        <div class="form-groupsModel">
                                            <label>Освітньо-кваліфікаційний рівень:</label>
                                            <select class="form-control" id = "level">
                                                <option value="0">-Виберіть спеціальність-</option>
                                                <option value="1">Молодший спеціаліст</option>
                                                <option value = "2">Бакалавр</option>
                                                <option value = "3">Спеціаліст</option>
                                            </select>
                                        </div>
                                        <div>
                                        <div class="form-groupsModel">
                                            <label>Напрям підготовки:</label>
                                            <div>
                                                <select ng-model="selectedSpec" id = "way_of_training" ng-options="spec.name for spec in specs_list" ng-change="send_spec_id(selectedSpec.id)">
                                                    <option value="">-- Виберіть напрям --</option>
                                                </select>
                                            </div>

                                            <label> Група:</label>
                                            <div class="radio" id = "group" ng-repeat="group in active_groups">
                                                   <span>
                                                        <input type="radio" name="groupsRadios" value="{{group.id}}"/>{{group.name}}
                                                   </span>
                                            </div>
                                        </div>

                                        </div>
                                        <div class="form-groupsModel" id = "term">
                                            <label> Cеместр:</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="1" checked /> 1
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios4" value="2"/> 2
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Рік поступлення: </span>
                                            <input type="text" id = "year" class="form-control" name  = "studentsYear" maxlength="4">
                                        </div>

                                        <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                            <span class="input-groupsModel-addon">Зараховано наказом від: </span>
                                            <input type="text" id = "decree" class="form-control" name  = "studentsDecree">
                                        </div>
                                            <br>
                                            <div class="form-groupsModel input-groupsModel input-groupsModel-sm">
                                                <button type="submit" class="btn btn-primary" ng-click="add_student()">Додати</button>
                                                <button type="reset" class="btn btn-delete">Скинути дані</button>
                                                <span id="studentAddedLabel" style='visibility: hidden'>СТУДЕНТ ДОДАНИЙ</span>
                                            </div>


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
    <script>
        $("#imgf").change(function(){
            readURL(this);
        });
    </script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>

</div>
</body>
</html>
