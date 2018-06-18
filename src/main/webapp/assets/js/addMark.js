var listApp = angular.module('list_app', ['pascalprecht.translate'],
    function ($translateProvider) {}).directive('compileUnsafe', function ($compile) {
    return function (scope, element, attr) {
        scope.$watch(attr.compileUnsafe, function (val, oldVal) {
            if (!val || (val === oldVal && element[0].innerHTML)) return;
            element.html(val);
            $compile(element)(scope);
        });
    };
});

listApp.controller('MarksListCtrl', function ($scope,$http) {
    $scope.get_spec = function() {
        // console.log(marks)

        $http.get("c_specs").success(function(data)
        {
            $scope.specs = data;
        });
    }
    $scope.get_groups = function(spec) {
        $('#groups').removeClass("hidden");
        $http.get("c_group_by_spec/"+spec).success(function(data)
        {
            $scope.groups = data;
        });
    };
    $scope.get_students = function(group) {

        $http.get("c_student_by_group/"+group).success(function(data)
        {

            $('.loader').addClass("hidden");
            $('.vv').removeClass("hidden");
            $scope.gr=group
            $scope.students = data;
        });
    };
    $scope.get_subjects = function(group, semester) {
        $http.get("c_subject_by_group_and_sem/"+group+"/"+semester).success(function(data)
        {
            $scope.subjects = data;
            $scope.m=12;
            // $scope.sub_sys=data['systemOfMarking'];
            for(var i=0; i<data.length; i++){
                var x=data[i].systemOfMarking;
                if(x===5){
                    $scope.m=5;
                    break
                }
            }
        });
    };
    $scope.get_marks = function(group) {
        $http.get("c_get_mark_by_group/"+group).success(function(data)
        {
            $scope.marks = data;
        });
        $('.vv').addClass("hidden");
        $('.loader').removeClass("hidden");
        $('#sem').removeClass("hidden");
        $('#student').removeClass("hidden");
    };
    $scope.isActive = false;
    $scope.activeButton = function() {
        $scope.isActive = !$scope.isActive;
    }
    $scope.spec_p = function(specp1) {
        $scope.specp = specp1;
    }



    $scope.sum_mark = function(student, marks, subject) {
        var sums=0;
        student.sum={};
        if(marks.length<subject || marks==undefined){
            sums="";

        }else {
            for (var i = 0; i <marks.length; i++) {
                var sys=12;
                for(var i2=0; i2<$scope.subjects.length; i2++){
                    if(marks[i].idSubject==$scope.subjects[i2].id) {
                        sys = $scope.subjects[i2].systemOfMarking;
                    }
                }
                // console.log(marks[i])
                // if(subject)
                var x=parseInt(marks[i].mark);
                if($scope.m==12) {

                }else if(sys==5) {

                }else if(sys==12){

                    if(x>=10 && x<=12){
                        x=5;
                    }else if(x>=7 && x<=9) {
                        x=4;
                    }else if(x>=3 && x<=6) {
                        x=3;
                    }else if(x>=1 && x<=3) {
                        x=2;
                    }else {
                        x='';
                    }
                }
                sums+=x;
            }
            sums=(sums/subject).toFixed(2)
            if(sums==0.00 || isNaN(sums)){
                sums='';
            }
        }
        return sums;
    }
    $scope.add_subjects= function() {
        $('.vvf').addClass("hidden");
        $('.loader').removeClass("hidden");
        if($('#groups').val()==0){
            $('#groups').addClass('imp')
        }
        if($('#nameOfSubject').val()==''){
            $('#nameOfSubject').addClass('imp')
        }
        var str=$('#amountOfHours').val();
        var str2=str.replace(/[^0-9]/gi,'');
        if(str!=str2){
            $('#amountOfHours').val('')
            $('#amountOfHours').addClass('imp')
        }
        if($('#amountOfHours').val()==''){
            $('#amountOfHours').addClass('imp')
        }
        if($('#groups').val()==0 || $('#nameOfSubject').val()=='' || $('#amountOfHours').val()==''){
            $('.loader').addClass("hidden");
            $('.vvf').removeClass("hidden");
            $('body').scrollTop()
        }else {
            $('#groups').removeClass('imp')
            $('#nameOfSubject').removeClass('imp')
            $('#amountOfHours').removeClass('imp')
            var data = {
                groups: $('#groups').val(),
                nameOfSubject: $('#nameOfSubject').val(),
                systemOfMarking: $('#systemOfMarking').val(),
                amountOfHours: $('#amountOfHours').val(),
                typeOfTest: $('#typeOfTest').val(),
                semester: $('#semester').val(),
                teacher: $('#teacher').val()
            };
            $http.post("c_add_subject", data).success(function (data1) {
                $('.loader').addClass("hidden");
                $('.vvf').removeClass("hidden");
            })
        }
    }
}).directive("contenteditable", function($http) {
    return {
        require: "ngModel",
        link: function (scope, element, attrs, ngModel) {

            function read() {

                var str=JSON.parse(element[0]['attributes'][2]['value']);
                if(element.text()==''){

                    if(element[0]['attributes'][6]['value']!=''){
                        var data = {
                            id: element[0]['attributes'][6]['value'],
                        };
                        var deleteEl = confirm("Видалити оцінку?");
                        if(deleteEl){
                            element[0]['attributes'][7]['value']='';
                            $http.get("c_delete/" + element[0]['attributes'][6]['value']).success(function (data1) {
                                // for (var i = 0; i <scope.marks.length; i++) {
                                //
                                //     if (scope.marks[i]['id'] ==element[0]['attributes'][6]['value']) {
                                //         scope.marks[i].splice(0,1);
                                //         // delete scope.marks[i]
                                //         // scope.marks[i].splice(i, 1);
                                //     }
                                // }
                            });
                        }else {
                            element.text(element[0]['attributes'][7]['value']);
                        }
                    }else {

                    }
                }else {

                    if(element[0]['attributes'][6]['value']!=undefined){
                        var data = {
                            id: element[0]['attributes'][6]['value'],
                            mark: element.text(),
                            idStud: element[0]['attributes'][3]['value'],
                            idSubject: element[0]['attributes'][5]['value'],
                            idGroup: element[0]['attributes'][4]['value']
                        };
                    }else {
                        var data = {
                            mark: element.text(),
                            idStud: element[0]['attributes'][3]['value'],
                            idSubject: element[0]['attributes'][5]['value'],
                            idGroup: element[0]['attributes'][4]['value']
                        };
                    }



                    if(element.text().length!=102) {
                        $http.post("c_add_mark", data).success(function (data1) {
                            var ix=true;
                            for (var i = 0; i <scope.marks.length; i++) {
                                if (scope.marks[i]['id'] == data1['id']) {
                                    ix=false;
                                    // console.log(scope.marks[i])
                                    scope.marks[i]=data1;
                                    // console.log()
                                }
                            }
                            if(ix==true) {
                                scope.marks[scope.marks.length] = data1
                            }
                            // console.log(scope.marks)
                            element.html(data1['mark']);
                            //scope.sum_mark(element[0]['attributes'][3]['value'], scope.marks, element[0]['attributes'][5]['value'])
                            element[0]['attributes'][6]['value'] = data1['id']
                            element[0]['attributes'][7]['value'] = element.text()

                        });
                        // console.log(scope.marks)
                    }
                }
            }
            function check() {
                if(element.text()==2 || element.text()==1){
                    element.addClass("ng-red")
                }else {
                    element.removeClass("ng-red")
                }
            }
            function checkLength() {

                var t1=parseInt(element.text());

                // element.text(t1)
                var str=element.text();
                var str2=str.replace(/[^0-9]/gi,'');
                if(str!=str2){
                    element.html('')
                }
                var t=typeof parseInt(element.text());

                if(element.text()>12 || element.text()<1){
                    element.text('')

                }
                if(t!='number'){
                    element.text(t1)
                }
                if(isNaN(t1)){
                    element.text('')
                }
                if(element[0]['attributes'][9]['value']==5){
                    if(element.text()>5 || element.text()<1){
                        element.text('')

                    }
                }
            }
            ngModel.$render = function () {
            };
            element.bind("blur", function () {
                scope.$apply(read);
            });
            element.bind("keyup", function () {
                scope.$apply(check);
                scope.$apply(checkLength);
            });

            element.css('outline', 'none');
            element.bind("keydown keypress", function (event) {
                if (event.which === 13) {
                    element[0].blur();
                    event.preventDefault();
                }
            });

        }
    };
});

function disableS(el) {
    $('.bb').each(function () {
        $(this).removeClass('disabled')
    })
    el['classList'].add("disabled")
}
