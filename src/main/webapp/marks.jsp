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
                    <h2>Оцінки</h2>

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
                        <li ng-repeat="spec in specs" class="liHo" ng-click="get_groups(spec.id); insert(spec.name); spec_p(spec.name);"><a>{{spec.name}}</a></li>

                    </ul>
                    <p class="spec_p">{{specp}}</p>
                </div>
            </div>
            <div class="col-md-6">
                <div id="groups" class="hidden">
                    <h4>Групи</h4>
                    <a class="bb btn btn-success ng-but" onclick="disableS(this);" ng-repeat="group in groups"  ng-click="disableClick(); get_students(group.id); get_subjects(group.id, 1); get_marks(group.id, 1);" ng-disabled="isDisabled" ng-model="isDisabled">{{group.name}}</a>
                </div>
                <div id="sem" class="hidden">
                    <h4>Семестри</h4>
                    <a href="#" class="bb45 ggb btn btn-primary btn-sm disabled" onclick="disableS2(this);" ng-click="get_students(gr); get_subjects(gr, 1); get_marks(gr, 1);">1 семестр</a>
                    <a href="#" class="bb45 btn btn-primary btn-sm" onclick="disableS2(this);" ng-click="get_students(gr); get_subjects(gr, 2); get_marks(gr, 2);">2 семестр</a>
                    <br><br>

                </div>

            </div>

            <div class="row hidden" id="student">

                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <a href="#" class="btn btn-danger btn-md" ng-click="sortBy('sum')">42%</a>
                        </div>
                        <div class="panel-body" id="first_cont">
                            <div>
                                <span class="btn btn-default ng-red"></span> - незадовільна оцінка
                                <span class="btn btn-default"></span> - 12-ти бальна система
                                <span class="btn btn-default ng-gr"></span> - 5-ти бальна система
                                <span class="btn btn-default ng-d2"></span> - звичайна стипендія
                                <span class="btn btn-default ng-b22"></span> - підвищена стипендія
                            </div><br>
                            <div class="table-responsive">
                                <div class="loader"></div>

                                <table class="table table-striped table-bordered table-hover vv hidden">
                                    <thead >
                                    <tr>
                                        <th>Прізвище, ім’я, по батькові</th>
                                        <th class="verticaltext_content" ng-class="{'ng-gr': subject.systemOfMarking==5}" ng-repeat="subject in subjects"><div><span>{{subject.nameOfSubject}}</span></div></th>
                                        <th class="verticaltext_content" style="background-color: rgba(255, 108, 0, 0.6)" ng-click="sortBy('sum')"><div><span>Додатковий бал</span></div></th>
                                        <th class="verticaltext_content" style="background-color: rgba(255, 255, 0, 0.6)" ng-click="sortBy('sum')"><div><span>Бал</span></div></th>
                                        <th class="verticaltext_content" style="background-color: rgba(98, 255, 53, 0.6)"><div><span>Стипендія</span></div></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="odd gradeX" ng-repeat="student in students | orderBy:propertyName:true" ng-class="{'ng-gr34': student.selected==true}" >
                                        {{student}}
                                        <td>
                                            <a href = "stud_info.jsp?id={{student.id}}"  style="text-decoration: none; color: black"> {{student.pib}}</a>
                                        </td>
                                        <td ng-repeat="subject in subjects" style="padding: 0px !important;" ng-init="model = { show: 'true'}">
                                            <div class="ng-b2" contenteditable="true"  ng-repeat="mark in marks track by $index" ng-if="mark.idStud==student.id && mark.idSubject==subject.id" ng-class="{'ng-red': mark.mark==2 || mark.mark==1, 'ng-gr': subject.systemOfMarking==5}" ng-model="myModel" ng-init="model.show= 'false'"  mark="{{mark}}" markId="{{$index}}" sysMark="{{subject.systemOfMarking}}" >{{mark.mark}}</div>
                                            <div class="ng-b2" contenteditable="true"  ng-class="{'ng-gr': subject.systemOfMarking==5}" ng-model="myModel" mark='{"idStud": {{student.id}}, "idSubject": {{subject.id}}, "idGroup": {{gr}}, "idSem": {{sm}}}' ng-if="model.show== 'true'" sysMark="{{subject.systemOfMarking}}" >{{mark.mark}}</div>
                                        </td>
                                        <td class="ng-gr4" data-toggle="modal" data-target="#myModal" id="modal{{student.id}}" ng-click="open_modal(student)" ng-init="get_addit_marks(student.id, student.term, student.idGroup, student)">{{student.addit_mark}}</td>
                                        <td class="ng-yellow" >{{sum_mark(student, (marks | filter:{idStud:student.id}), subjects.length)+student.addit_mark}}</td>
                                        <!--<td class="ng-yellow" ng-class="{'ng-b': sum_mark(student, (marks | filter:{idStud:student.id}), subjects.length)==5, 'ng-d': sum_mark(student, (marks | filter:{idStud:student.id}), subjects.length)<5 && sum_mark(student, (marks | filter:{idStud:student.id}), subjects.length)>=4}" ng-if="marks && m==5"></td>-->
                                        <!--<td class="ng-yellow" ng-class="{'ng-b': sum_mark(student, (marks | filter:{idStud:student.id}), subjects.length)>=10, 'ng-d': sum_mark(student, (marks | filter:{idStud:student.id}), subjects.length)<10 && sum_mark(student, (marks | filter:{idStud:student.id}), subjects.length)>=7}" ng-if="marks && m==12"></td>-->
                                    </tr>
                                    </tbody>
                                </table>
                                <!--<table id="header-fixed"></table>-->
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
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" ng-init="get_addition()">
    <div class="modal-dialog  modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Додаткові бали</h4>
            </div>
            <div class="modal-body">
                <p ng-repeat="addit_mark in addit_makrs" style="background: rgba(244, 242, 226, 0.84); padding: 10px" >
                    <span style="font-size:14px; float: left; color: black">{{addit_mark.name}}
                    </span>
                    <input style="margin: 8px; background-color: #00CE6F" type="checkbox" class="addit_mark_check" mark="{{addit_mark.mark}}" id="{{addit_mark.id}}">
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning">10</button>
                <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="save_student_point(students)" ng-init="students">Зберегти</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Закрити</button>
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
