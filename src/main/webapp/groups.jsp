<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
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
</head>
<body>
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
        <a href="#" onclick="menu_open();" style="margin-left: 10px;margin-top: 3px" class="btn btn-primary btn-circle text-center"><i style="margin-top: 6px;" class="fa fa-bars fa-2x" aria-hidden="true"></i></a>
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
                    <a  href="index.jsp"><i class="fa fa-university fa-2x"></i> Головна</a>
                </li>
                <li>
                    <a  href="marks.jsp"><i class="fa fa-book fa-2x"></i>Оцінки</a>
                </li>

                <li  >
                    <a   href="subjects.jsp"><i class="fa  fa-tasks  fa-2x"></i> Предмети</a>
                </li>
                <li  >
                    <a  class="active-menu" href="groups.jsp"><i class="fa  fa-braille   fa-2x"></i> Групи</a>
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
                    <h2>Групи</h2>

                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="col-md-11">
                <br>
                <div class="btn-group">
                    <button class="btn btn-primary">Спеціальність</button>
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle"><span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="#">5.05010201- Обслуговування комп ’ютерних систем і мереж</a></li>
                        <li><a href="#">5.05090308 – Монтаж, обслуговування та експлуатація апаратних засобів інформатизації</a></li>
                        <li><a href="#">5.05090302 – Технічне обслуговування і ремонт апаратури зв’язку та оргтехніки</a></li>
                        <li><a href="#">5.05090301 – Монтаж, обслуговування і ремонт станційного обладнання електрозв’язку</a></li>
                    </ul><br><br>
                    <h5>5.05090308 – Монтаж, обслуговування та експлуатація апаратних засобів інформатизації</h5>
                </div>
                <h4>Групи</h4>
                <div class="panel-warning panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <input type="checkbox" checked="checked">
                            <a data-toggle="collapse" class="btn btn-default btn-xs" data-parent="#accordion" href="#collapse2"><i class="fa fa-refresh fa-1x" aria-hidden="true"></i>
                                ОК-11 (3 семестр) <i class="fa fa-chevron-down fa-1x" aria-hidden="true"></i>
                            </a>
                            Наказ від
                            <div class="btn-group">
                                <button data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle">Вибрати наказ <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a>"<span>25</span>" червня 2010 року № 252345</a></li>
                                    <li class="divider"></li>
                                    <li><a>"<span>25</span>" червня 2010 року № 252345</a></li>
                                    <li class="divider"></li>
                                    <li><a>"<span>25</span>" червня 2010 року № 252345</a></li>
                                    <li class="divider"></li>
                                </ul>
                            </div>

                            <p style="margin-left: 30px" class="btn btn-warning btn-xs"><i class="fa fa-play fa-1x" aria-hidden="true"></i> Перевести</p>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse" style="height: auto;">
                        <div class="panel-body">
                            <div class="panel-body">
                                <p class="btn btn-info">2015(1)</p> - <p class="btn btn-info">2015</p><br><br>
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Прізвище, ім’я, по батькові</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input checked="checked" type="checkbox"></td>
                                        <td>Баньковська Наталія Михайлівна</td>
                                    </tr>
                                    <tr>
                                        <td><input checked="checked" type="checkbox"></td>
                                        <td>Баньковська Наталія Михайлівна</td>
                                    </tr>
                                    <tr>
                                        <td><input checked="checked" type="checkbox"></td>
                                        <td>Баньковська Наталія Михайлівна</td>
                                    </tr>
                                    <tr>
                                        <td><input checked="checked" type="checkbox"></td>
                                        <td>Баньковська Наталія Михайлівна</td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-warning panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <input type="checkbox" checked="checked">
                            <a data-toggle="collapse" class="btn btn-default btn-xs" data-parent="#accordion" href="#collapse3"><i class="fa fa-refresh fa-1x" aria-hidden="true"></i>
                                ОК-21 (3 семестр) <i class="fa fa-chevron-down fa-1x" aria-hidden="true"></i>
                            </a>
                            Наказ від
                            <div class="btn-group">
                                <button data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle">Вибрати наказ <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a>"<span>25</span>" червня 2010 року № 252345</a></li>
                                    <li class="divider"></li>
                                    <li><a>"<span>25</span>" червня 2010 року № 252345</a></li>
                                    <li class="divider"></li>
                                    <li><a>"<span>25</span>" червня 2010 року № 252345</a></li>
                                    <li class="divider"></li>
                                </ul>
                            </div>

                            <p style="margin-left: 30px" class="btn btn-warning btn-xs"><i class="fa fa-play fa-1x" aria-hidden="true"></i> Перевести</p>
                        </h4>
                    </div>
                    <div id="collapse3" class="panel-collapse collapse" style="height: auto;">
                        <div class="panel-body">
                            <div class="panel-body">
                                <p class="btn btn-info">2015(1)</p> - <p class="btn btn-info">2015</p><br><br>
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Прізвище, ім’я, по батькові</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><input checked="checked" type="checkbox"></td>
                                        <td>Баньковська Наталія Михайлівна</td>
                                    </tr>
                                    <tr>
                                        <td><input checked="checked" type="checkbox"></td>
                                        <td>Баньковська Наталія Михайлівна</td>
                                    </tr>
                                    <tr>
                                        <td><input checked="checked" type="checkbox"></td>
                                        <td>Баньковська Наталія Михайлівна</td>
                                    </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <br>

                <p class="btn btn-success"><i class="fa fa-play fa-1x" aria-hidden="true"></i> Перевести</p>
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
