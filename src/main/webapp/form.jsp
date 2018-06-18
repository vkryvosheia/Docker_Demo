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
                    <a class="active-menu"  href="index.jsp"><i class="fa fa-university fa-2x"></i> Головна</a>
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
                     <h2>Forms Page</h2>   
                        <h5>Welcome Jhon Deo , Love to see you back. </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               <div class="row">
                <div class="col-md-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Form Element Examples
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Basic Form Examples</h3>
                                    <form role="form">
                                        <div class="form-groupsModel">
                                            <label>Text Input</label>
                                            <input class="form-control" />
                                            <p class="help-block">Help text here.</p>
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>Text Input with Placeholder</label>
                                            <input class="form-control" placeholder="PLease Enter Keyword" />
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>Just A Label Control</label>
                                            <p class="form-control-static">info@yourdomain.com</p>
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>File input</label>
                                            <input type="file" />
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>Text area</label>
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>Checkboxes</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="" />Checkbox Example One
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value=""/>Checkbox Example Two
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value=""/>Checkbox Example Three
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>Inline Checkboxes Examples</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox"/> One
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox"/> Two
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox"/> Three
                                            </label>
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>Radio Button Examples</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked />Radio Example One
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"/>Radio Example Two
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3"/>Radio Example Three
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div class="form-groupsModel">
                                            <label>Select Example</label>
                                            <select class="form-control">
                                                <option>One Vale</option>
                                                <option>Two Vale</option>
                                                <option>Three Vale</option>
                                                <option>Four Vale</option>
                                            </select>
                                        </div>
                                        <div class="form-groupsModel">
                                            <label>Multiple Select Example</label>
                                            <select multiple class="form-control">
                                                <option>One Vale</option>
                                                <option>Two Vale</option>
                                                <option>Three Vale</option>
                                                <option>Four Vale</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-primary">Reset Button</button>

                                    </form>
                                    <br />
                                      <h3>With radio & checkboxes</h3>
                                    <form>

    <div class="form-groupsModel input-groupsModel">
      <span class="input-groupsModel-addon">
        <input type="checkbox" />
      </span>
      <input type="text" class="form-control" />
    </div>
                                         <div class="form-groupsModel input-groupsModel">
      <span class="input-groupsModel-addon">
        <input type="radio" />
      </span>
      <input type="text" class="form-control" />
    </div>
                                    </form>

                                 
    </div>
                                
                                <div class="col-md-6">
                                    <h3>Disabled Form State Examples</h3>
                                    <form role="form">
                                        <fieldset disabled="disabled">
                                            <div class="form-groupsModel">
                                                <label for="disabledSelect">Disabled input</label>
                                                <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled />
                                            </div>
                                            <div class="form-groupsModel">
                                                <label for="disabledSelect">Disabled select </label>
                                                <select id="disabledSelect" class="form-control">
                                                    <option>Disabled select</option>
                                                </select>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" />Disabled Checkbox
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Disabled Button</button>
                                        </fieldset>
                                    </form>
                                    <h3>Validation State Examples</h3>
                                    <form role="form">
                                        <div class="form-groupsModel has-success">
                                            <label class="control-label" for="inputSuccess">Input with success</label>
                                            <input type="text" class="form-control" id="inputSuccess">
                                        </div>
                                        <div class="form-groupsModel has-warning">
                                            <label class="control-label" for="inputWarning">Input with warning</label>
                                            <input type="text" class="form-control" id="inputWarning">
                                        </div>
                                        <div class="form-groupsModel has-error">
                                            <label class="control-label" for="inputError">Input with error</label>
                                            <input type="text" class="form-control" id="inputError">
                                        </div>
                                    </form>
                                    <h3>Input Group Examples</h3>
                                    <form role="form">
                                        <div class="form-groupsModel input-groupsModel">
                                            <span class="input-groupsModel-addon">@</span>
                                            <input type="text" class="form-control" placeholder="Username">
                                        </div>
                                        <div class="form-groupsModel input-groupsModel">
                                            <input type="text" class="form-control">
                                            <span class="input-groupsModel-addon">.00</span>
                                        </div>
                                        <div class="form-groupsModel input-groupsModel">
                                            <span class="input-groupsModel-addon"><i class="fa fa-eur"></i>
                                            </span>
                                            <input type="text" class="form-control" placeholder="Font Awesome Icon">
                                        </div>
                                        <div class="form-groupsModel input-groupsModel">
                                            <span class="input-groupsModel-addon">$</span>
                                            <input type="text" class="form-control">
                                            <span class="input-groupsModel-addon">.00</span>
                                        </div>
                                        <div class="form-groupsModel input-groupsModel">
                                            <input type="text" class="form-control">
                                            <span class="input-groupsModel-btn">
                                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </form>
                                    <h3>Different Size Input Groups</h3>
                                     <form role="form">
  <div class=" form-groupsModel input-groupsModel input-groupsModel-lg">
  <span class="input-groupsModel-addon">@</span>
  <input type="text" class="form-control" placeholder="Username" />
</div>

<div class="form-groupsModel input-groupsModel">
  <span class="input-groupsModel-addon">@</span>
  <input type="text" class="form-control" placeholder="Username" />
</div>

<div class="form-groupsModel input-groupsModel input-groupsModel-sm">
  <span class="input-groupsModel-addon">@</span>
  <input type="text" class="form-control" placeholder="Username" />
</div>
                                         
                                     </form>
                                    <h3>Different Size Input Groups</h3>
                                     <form role="form">
                                  <div class="input-groupsModel">
      <span class="form-groupsModel input-groupsModel-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
      <input type="text" class="form-control" />
    </div>
<br />
                                           <div class="input-groupsModel">
     
      <input type="text" class="form-control" />
                                                <span class="form-groupsModel input-groupsModel-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
    </div>
                                         </form>
                                </div>
                            </div>
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-12">
                        <h3>More Customization</h3>
                         <p>
                        For more customization for this template or its components please visit official bootstrap website i.e getbootstrap.com or <a href="http://getbootstrap.com/components/" target="_blank">click here</a> . We hope you will enjoy our template. This template is easy to use, light weight and made with love by binarycart.com 
                        </p>
                    </div>
                </div>
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
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
