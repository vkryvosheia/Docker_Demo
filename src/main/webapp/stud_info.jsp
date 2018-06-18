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
    <script src="assets/js/addMark.js"></script>
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
<div id="wrapper" ng-init="get_student(); get_decrees(); get_fields(); get_spec(); get_level(); get_doc();">
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
            <%--&nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Вийти</a>--%>
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
                    <a class="active-menu" href="marks.jsp"><i class="fa fa-book fa-2x"></i>Оцінки</a>
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
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>{{student.pib}}</h2>
                    <h5>Інформація по студенту</h5>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <!-- /. ROW  -->
            <div class="alert alert-success hidden">
                <strong>Поле успішно відредаговане!</strong>
            </div>

            <!-- /. ROW  -->
            <div class="row" >
                <div class="col-md-9 col-sm-12 col-xs-10">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Інформація
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Інформація</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="field in fields" ng-init="x=false" ng-model="x">
                                        <td class="info">{{field.name}}:</td>
                                        <td ng-repeat="(key, value) in student" ng-click="edit_field(key)" ng-if="key==field.idName">
                                            <span class="cl2{{key}} infoStud">{{student[key]}}</span>
                                            <div class="input-groupsModel cl{{key}} hidden" ng-if="!field.useTable.length>=1">
                                                <input class="form-control" ng-click="get_groups(x3)" type="text" value="{{student[key]}}">
                                                <span class="form-groupsModel input-groupsModel-btn">
                                                    <button class="btn btn-success btn-xs" ng-click="save_stud_info(key, student[key], $event)" type="button">Зберегти</button>
                                                    <!--<button class="btn btn-danger btn-xs" ng-click="remove_field(key)" type="button">Відмінити</button>-->
                                                </span>
                                            </div>
                                            <div class="input-groupsModel cl{{key}} hidden" ng-if="field.useTable=='education_level'">
                                                <select class="form-control" type="text" value="{{student[key]}}" >
                                                    <option ng-repeat="x1 in edLevel">{{x1.level}}</option>
                                                </select>
                                                <span class="form-groupsModel input-groupsModel-btn">
                                                    <button class="btn btn-success btn-xs" ng-click="save_stud_info(key, student[key], $event)" type="button">Зберегти</button>
                                                    <!--<button class="btn btn-danger btn-xs" ng-click="remove_field(key)" type="button">Відмінити</button>-->
                                                </span>
                                            </div>
                                            <div class="input-groupsModel cl{{key}} hidden" ng-if="field.useTable=='spec'">
                                                <select class="form-control" type="text" value="{{student[key]}}" >
                                                    <option ng-repeat="x1 in specs" ng-click="ch_gr2(x1.id)">{{x1.name}}</option>
                                                </select>
                                                <span class="form-groupsModel input-groupsModel-btn">
                                                    <button class="btn btn-success btn-xs" ng-click="save_stud_info(key, student[key], $event); get_groups3();" type="button">Зберегти</button>
                                                    <!--<button class="btn btn-danger btn-xs" ng-click="remove_field(key)" type="button">Відмінити</button>-->
                                                </span>
                                            </div>
                                            <div class="input-groupsModel cl{{key}} hidden" ng-if="field.useTable=='groups'">
                                                <select class="form-control" type="text" value="{{student[key]}}" >
                                                    <option ng-repeat="x1 in groups" ng-click="ch_gr(x1.id)">{{x1.name}}</option>
                                                </select>

                                                <span class="form-groupsModel input-groupsModel-btn">
                                                    <button class="btn btn-success btn-xs" ng-click="save_stud_info(183, 'stud', $event); save_stud_info(key, student[key], $event);" type="button">Зберегти</button>
                                                    <!--<button class="btn btn-danger btn-xs" ng-click="remove_field(key)" type="button">Відмінити</button>-->
                                                </span>
                                            </div>
                                            <div class="input-groupsModel cl{{key}} hidden" ng-if="field.useTable=='documents'">
                                                <select class="form-control" type="text" value="{{student[key]}}" >
                                                    <option ng-repeat="x1 in doced">{{x1.name+"-"+x1.date}}</option>
                                                </select>
                                                <span class="form-groupsModel input-groupsModel-btn">
                                                    <button class="btn btn-success btn-xs" ng-click="save_stud_info(key, student[key], $event)" type="button">Зберегти</button>
                                                    <!--<button class="btn btn-danger btn-xs" ng-click="remove_field(key)" type="button">Відмінити</button>-->
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div ng-repeat = "field in fields">
                                <div class="panel-body"  ng-if = "field.useTable =='decrees'">
                                    <div class="panel-groupsModel" id="accordion{{field.id}}" ng-repeat = "decree in decrees">
                                        <div class="panel-warning">




                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion{{field.id}}" href="#collapse{{decree.id}}" class="collapsed"><i class="fa fa-check fa-1x" aria-hidden="true"></i>
                                                        {{decree.name}}
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse{{decree.id}}" class="panel-collapse collapse" style="height: auto;">
                                                <div class="panel-body">
                                                    <div class="panel-body">
                                                        <input class="form-control" name = "decrees_input" ng-click="get_groups(x3)" type="text" value="{{student[decree.fieldName]}}">

                                                        <span class="form-groupsModel input-groupsModel-btn"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="btn btn-success btn-xs" ng-click="save_decrees()" type="button">Зберегти</button>
                                </div>
                               </div>


                            </div>

                        </div>
                    </div>

                </div>










                <div class="col-md-2 col-sm-12 col-xs-12">
                    <div class="panel panel-default img_edit">
                        <img src="images/{{student.id}}.jpg" id="photo" style="width: 140px;" class="img-rounded" alt="Додайте зображення..." height="auto">
                    </div>
                </div>
                <div class="col-md-2 col-sm-12 col-xs-12">

                </div>

                <div class="col-md-2 col-sm-12 col-xs-12">
                    <div class="panel panel-default text-center bg-color-blue no-boder">

                        <div class="panel-body">
                            <label class="btn btn-default btn-file">
                                <i class="fa fa-camera fa-2x"></i> <input type="file" id="imgf" file-model="myFile" style="display: none;">
                            </label><br>
                            <label class="btn btn-default btn-file">
                            <i class="fa fa-save fa-2x" ng-click="uploadFile()"></i>
                        </label>

                        </div>
                    </div>
                </div>

                <a class="col-md-2 col-sm-12 col-xs-12 bt_dn" style="text-decoration: none; outline: none;" ng-click = "import_into_file(student.id)" download="">

                    <div class="panel panel-primary text-center no-boder bg-color-green" >
                        <div class="panel-body">
                            <i class="fa fa-file-word-o fa-5x"></i>
                        </div>
                        <div class="panel-footer back-footer-green">
                            Зберегти в документ студента № {{student.id}}
                        </div>
                    </div>
                </a>
                <div class="col-md-2 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder bg-color-red">
                        <div class="panel-body">
                            <i class="fa fa-trash-o fa-5x"></i>
                        </div>
                        <div class="panel-footer back-footer-red">
                            Видалити студента
                        </div>
                    </div>
                </div>
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
<%--<script src="assets/js/morris/raphael-2.1.0.min.js"></script>--%>
<%--<script src="assets/js/morris/morris.js"></script>--%>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>

<script>
    $("#imgf").change(function(){
        readURL(this);
    });
</script>
</div>
</div>
    </div>
</body>
</html>
