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


listApp.controller('MarksListCtrl', function ($scope, $http, fileUpload) {
    $scope.selectedItem = {};
    $scope.sorted =[];
    $scope.selectedSpec = {};



    $scope.transfer_students_select = function () {

        for(var i = 0; i < document.getElementsByClassName('td_hide').length;i++){
            document.getElementsByClassName('td_hide').item(i).style.visibility = "hidden";
        }

        for(var i = 0; i < document.getElementsByClassName('td_show').length;i++){
            document.getElementsByClassName('td_show').item(i).style.visibility = "visible";
        }

        for(var i = 0; i < document.getElementsByClassName('transfer_checkbox').length;i++){
            document.getElementsByClassName('transfer_checkbox').item(i).style.visibility = "visible";
        }

    };


    var transfer_ids = [];

    function compareNumeric(a, b) {
        if (a > b) return 1;
        if (a < b) return -1;
    }


    $scope.test_checkboxes = function (id) {
        transfer_ids[transfer_ids.length] = id;
        transfer_ids.sort(compareNumeric);

       console.log(transfer_ids);

    };

$scope.groups_list =[];
$scope.get_groups_list = function () {
    $http.get("c_groups").success(function(data){
        $scope.groups_list = data;
        console.log($scope.groups_list[1].id);
    })

};


$scope.specs_list = [];
$scope.get_specs = function () {
    $http.get("c_specs").success(function(data){
        $scope.specs_list = data;
        console.log($scope.specs_list[1].id);
    })

};

$scope.active_groups =[];
$scope.send_spec_id = function (id) {
    $http.get("c_group_by_spec/"+id).success(function (data) {
        $scope.active_groups = data;
        console.log($scope.active_groups);
    })

};


$scope.decrees = [];

$scope.get_decrees = function () {

    $http.get("/get_all_decrees").success(function (data) {
        $scope.decrees = data;
        console.log('decrees   ' + $scope.decrees);
    })

};

$scope.studentAdded = false;


    $scope.add_student = function () {
        var fd = new FormData();
        fd.append("pib", document.getElementById("pib").value);
        fd.append("date_of_birth", document.getElementById("date_of_birth").value);
        fd.append("place_of_birth", document.getElementById("place_of_birth").value);
        fd.append("place_of_living", document.getElementById("place_of_living").value);
        fd.append("institute", document.getElementById("institute").value);
        fd.append("training_direction", document.getElementById("training_direction").value);
        fd.append("level", document.getElementById("level").value);
        fd.append("way_of_training", document.getElementById("way_of_training").value);
        fd.append("group", document.getElementById("group").value);

        for(var i = 0; i <document.getElementsByName("groupsRadios").length;i++) {
            if(document.getElementsByName("groupsRadios").item(i).checked) {
                fd.append("group", document.getElementsByName("groupsRadios").item(i).value);
            }
        }

        for(var i = 0; i <document.getElementById("term").getElementsByTagName("input").length;i++) {
            if(document.getElementsByName("optionsRadios").item(i).checked) {
                fd.append("term", document.getElementsByName("optionsRadios").item(i).value);
            }
        }

        $.ajax({
            url: '/c_add_student',
            data: fd,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data) {
                if (data === "added") {
                    document.getElementById("studentAddedLabel").style.visibility = 'visible';
                    setTimeout(function () {
                        document.getElementById("studentAddedLabel").style.visibility = 'hidden';
                    }, 3000)
                }else{
                    alert('Помилка');
                }
            }
        });
    };

    $scope.clear_table = function () {
        $(".vv").addClass("hidden");
    };


    $scope.students_year_model =
        $scope.transfer_students = function () {

            var fd = new FormData();
            fd.append('transfer_ids', transfer_ids);

            $http.post("transfer_students", fd, {
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
            })
                .success(function(data){
                    console.log(data);
                    $scope.enabled = data;
                    for(var i = 0; i < $(".odd_gradeX").length;i++) {
                        console.log(transfer_ids[i]);
                        if(transfer_ids[i]!=undefined) {
                            document.getElementsByClassName("odd_gradeX").item(i).style.cssText = "background-color:#A1FF62;"
                        }
                    }
                    transfer_ids = [];

                })
                .error(function(){
                });
        };

    $scope.show_undecreed = function () {
        console.log('show undecreed');

       for (var i = 0; i < $scope.students.length; i++){
           if($scope.students[i].transfer_to_sec_year ==null){
               document.getElementsByClassName("odd_gradeX").item(i).style.cssText = "background-color: #FFA643;";
           }
       }
       console.log($scope.students.length);

    };


    $scope.get_spec = function() {
        $http.get("c_specs").success(function(data)
        {
            $scope.specs = data;

        });
    }
    $scope.get_level = function() {
        $http.get("educat_level/getall").success(function(data)
        {
            $scope.edLevel = data;
        });
    }
    $scope.get_doc = function() {
        $http.get("documents/getall").success(function(data)
        {
            $scope.doced = data;
        });
    }
    $scope.get_groups = function(spec) {

        $('#groups').removeClass("hidden");
        $http.get("c_group_by_spec/"+spec).success(function(data)
        {
            $scope.groups = data;
        });
    };
    $scope.get_groups2 = function() {
        console.log($scope.selectedItem)
        $('#groups').removeClass("hidden");
        $http.get("c_group_by_spec/"+$scope.selectedItem).success(function(data)
        {
            $scope.groups = data;
        });
    };
    $scope.ch_gr2 = function(y) {
        $scope.spec5=y;
    };
    $scope.get_groups3 = function() {
        $scope.spec6='stud2';
        $('#groups').removeClass("hidden");
        $http.get("c_group_by_spec/"+$scope.spec5).success(function(data)
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
            // $scope.gr2=group.
            $scope.students = data;
            $scope.countStudents=data.length;
            $scope.percent=Math.floor((data.length*42)/100)
            $scope.group_ids = data;
        });


    };


    $scope.users = [];

    $scope.get_users = function () {
       $http.get("get_all_users").success(function (data) {
           console.log(data);
       })
    };




    $scope.login_sys = function () {

        console.log('login');
        var fd = new FormData();
        fd.append("username", document.getElementsByName('username').item(0).value);
        fd.append("password", document.getElementsByName('password').item(0).value);
        console.log(document.getElementsByName('username').item(0).value);
        console.log(document.getElementsByName('password').item(0).value);

        $.ajax({
            url: 'http://localhost:8080/sign_up',
            data: fd,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {
                console.log(data)
            }
        });
    };






    $scope.ids_of_full_group = [];
    $scope.transfer_full_group = function () {

        for(var i = 0; i < $scope.group_ids.length;i++){
            ids_of_full_group.push($scope.group_ids[i].id);
        }


        console.log(ids_of_full_group);
    };



    $scope.transfer_full_group = function () {

        var fd = new FormData();
        fd.append('transfer_ids', ids_of_full_group);

        $http.post("transfer_students", fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
            .success(function (data) {
                $scope.enabled = data;

                $scope.transfer_ids = [];
                $scope.ids_of_full_group = [];

            })
            .error(function () {
            });

    };

    $scope.get_addition = function() {
        debugger;
        $http.get("c_addit_mark_info").success(function(data)
        {
            $scope.addit_makrs = data;
        });
    };
    var id_modal=[];
    $scope.open_modal = function(student) {
        $('.addit_mark_check').each(function(){
            $(this).removeAttr("checked", "")
        })
        id_modal=student;
        debugger;
        $http.get("c_get_mark_point_stud_sem_group_list/"+id_modal.id+"/"+id_modal.term+"/"+id_modal.idGroup).success(function(data)
        {
            $('.addit_mark_check').each(function(){
                for(var i=0; i<data.length; i++){
                    if($(this).attr('id')==data[i].idPoint){
                        $(this)[0]['checked']=true
                    }
                }

            })
        });

    }

    $scope.addit_mark=0;
    $scope.get_addit_marks = function(stud, sem, group, student) {

        $http.get("c_get_mark_point_stud_sem_group/"+stud+"/"+sem+"/"+group).success(function(data)
        {
            debugger
            var index = $scope.students.indexOf(student);
            student.addit_mark = parseFloat(data);

            $scope.students[index] = student;

        });

    };

    $scope.save_student_point = function(st) {
        var mark=0;
        var index = $scope.students.indexOf(id_modal);

        $http.get("c_get_mark_point_stud_sem_group_delete/"+id_modal.id+"/"+id_modal.term+"/"+id_modal.idGroup).success(function(data)
        {
            console.log("deleted");
        });
        $('.addit_mark_check').each(function(){
            if($(this).is(":checked")) {
                var data = {
                    mark: $(this).attr("mark"),
                    idStud: id_modal.id,
                    idPoint: $(this).attr("id"),
                    idGroup: id_modal.idGroup,
                    idSem: id_modal.term
                };
                $http.post("c_add_mark_point", data).success(function(data)
                {
                    console.log("poster");
                    console.log("term" + id_modal.term);
                });

                // $(this).attr("checked", "checked")
                // $(this).attr('id')
                mark=mark+parseFloat($(this).attr("mark"));
            }
        })

        if(mark<=10){
            console.log(mark)

        }else {
            mark=10
        }

        var mun=parseFloat(id_modal.sum);
        if(mun>0){
            mun=mun+mark;
        }else {
            mun=0;
        }

        id_modal.sum=mun;

        $('#modal'+id_modal.id).html(mark)
        $scope.sortBy('sum');
        // console.log("бля"+id_modal.sum);
        // console.log($scope.students);
        $scope.students[index] = student;
        debugger;
    };



    $scope.enabled = [];
        $scope.get_student = function() {
        $http.get("c_student/"+getParameterByName('id')).success(function(data)
        {
            $scope.student=data;
        });
    };
    $scope.import_into_file = function (id) {
        $('.back_load').removeClass('hidden')
        $('body').addClass('over')
        $http.get("/c_student/parse/" + id).success(function (data) {
                var a = document.createElement('a');
                a.href = 'http://localhost:8080/documents/'+id+'.docx';
                a.target = '_blank';
                a.download = '';
                document.body.appendChild(a);
            $('.back_load').addClass('hidden')
            $('body').removeClass('over')
                a.click();
        })
    };
    $scope.import_all_files = function (id) {
        $('.back_load').removeClass('hidden')
        $('body').addClass('over')
        var jsonObj = [{
            studentsId:[],
            members: id
        }];
        for(var i=0; i<$scope.students.length; i++) {
            jsonObj[0].studentsId.push($scope.students[i].id);
            var i2=i;
            $http.get("/c_student/parse/" + $scope.students[i].id).success(function (data) {
                // console.log($scope.students.length+" "+i2)

            })
            if(i==$scope.students.length-1){
                $http.post("/zip/students", jsonObj).success(function (data) {
                    var a = document.createElement('a');
                    a.href = 'http://localhost:8080/documents/'+id+'.zip';
                    a.target = '_blank';
                    a.download = '';
                    document.body.appendChild(a);
                    $('.back_load').addClass('hidden')
                    $('body').removeClass('over')
                    a.click();
                    // $http.get("/cleanDirectory").success(function(data){
                    //
                    // })
                })
            }
        }
        // if(i==$scope.students.length-1){
        //     // console.log($scope.students.length-1+" "+i)

        // }

    };
    $scope.get_select_fields = function(table) {

        $http.get("c_student/107").success(function(data)
        {

            $scope.student=data;
        });
    };
    $scope.get_fields = function() {
        $http.get("fieldsstud/getall").success(function(data)
        {
            $scope.fields=data;
        });
    };
    $scope.ch_gr = function(y) {
        $scope.gr=y;
    };

    $scope.save_decrees = function() {

        var fd = new FormData();

        var arr = window.location.href.split('=');
        fd.append("idst",arr[1]);

        // for(var i = 0; i <document.getElementsByName('decrees_input').length;i++){
        //
        //     console.log("decree" + i);
        // }

        fd.append("decree" + 0, document.getElementsByName('decrees_input').item(0).value);
        fd.append("decree" + 1, document.getElementsByName('decrees_input').item(1).value);
        fd.append("decree" + 2, document.getElementsByName('decrees_input').item(2).value);

        $.ajax({
            url: 'http://localhost:8080/c_update_student_decree',
            data: fd,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {
                console.log(data)
            }
        });
    };
    $scope.save_stud_info = function(key, value, event) {

        console.log('savestudinfo');
        console.log(key);
        console.log(value);
        if(value=='stud'){
            $scope.student['idGroup']=$scope.gr
        }else {
            $scope.student[key]=event['explicitOriginalTarget']['offsetParent']['children'][1]['children'][0]['value']
        }
        $http.post("c_update_student", $scope.student).success(function (data) {
            $(".cl"+key).addClass('hidden');
            $(".cl2"+key).removeClass('hidden')
        })
    };
    $scope.edit_field=function(key) {

        // if(spec6!='stud2'){
        //
        // }else {
        //
        // }
            if ($(".cl2" + key).hasClass('hidden')) {

            } else {
                $('.input-groupsModel').each(function () {
                    $(this).addClass('hidden')
                })
                $('.infoStud').each(function () {
                    $(this).removeClass('hidden')
                })
                $(".cl" + key).removeClass('hidden')
                $(".cl" + key).find('input').focus();
                $(".cl2" + key).addClass('hidden')
            }
    };
    $scope.remove_field=function(key) {
        $(".cl"+key).addClass('hidden')
        $(".cl2"+key).removeClass('hidden')
    };
    $scope.get_subjects = function(group, semester) {

        $('#student').removeClass("hidden");
        $scope.marks = '';
        $scope.sm=semester;
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
    $scope.get_all_subjects = function() {
        $http.get("c_subjects").success(function(data)
        {
            $scope.subjects=data;
        });
    };
    $scope.get_subject_id_group = function(group) {
        $http.get("c_subject_by_group/"+group).success(function(data)
        {
            $scope.subjects = data;
        });
    };
    $scope.get_marks = function(group, sem) {
        $http.get("c_get_mark_by_group/"+group+"/"+sem).success(function(data)
        {
            console.log('get mark by group');
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
    $scope.propertyName = 'name';
    $scope.reverse = true;

    $scope.sortBy = function(propertyName) {

            $scope.sorted = []
            for (var i3 = 0; i3 < $scope.students.length; i3++) {
                $scope.students[i3].selected = false;
            }
            $scope.reverse = ($scope.propertyName === propertyName) ? false : false;
            $scope.propertyName = propertyName;
            for (var i2 = 0; i2 < $scope.students.length; i2++) {
                if (Number($scope.students[i2].sum)) {
                    $scope.sorted.push($scope.students[i2])
                } else {
                    // $scope.students[i2].sum=0
                }
            }
            function compare(obj1, obj2) {
                if (Number(obj1.sum) > Number(obj2.sum))
                    return -1;
                if (Number(obj1.sum) < Number(obj2.sum))
                    return 1;
                return 0;
            }


            var nr=$scope.percent
            $scope.sorted = $scope.sorted.sort(compare);
            if($scope.sorted.length<=$scope.percent){

                $scope.percent=$scope.sorted.length
            }
            for (var i = 0; i < $scope.percent; i++) {
                for (var i2 = 0; i2 < $scope.students.length; i2++) {
                    if ($scope.students[i2].id == $scope.sorted[i].id) {
                        $scope.students[i2].selected = true;
                    }
                }
            }
            $scope.percent=nr


    };
    $scope.sum_mark = function(student, marks, subject) {
        var sums=0;
        var system=12;
        var allCredit=0;
        student.sum={};
        if(marks.length<subject || marks===undefined){
            sums='';
        }else {
            for (var i = 0; i <marks.length; i++) {
                var sys=12;
                var credit=0;
                for(var i2=0; i2<$scope.subjects.length; i2++){
                    if(marks[i].idSubject===$scope.subjects[i2].id) {
                        sys = $scope.subjects[i2].systemOfMarking;
                        if(sys==5){
                            system=5;
                        }
                        credit = ($scope.subjects[i2].amountOfHours/36).toFixed(2);
                    }
                }
                var x=parseInt(marks[i].mark);
                if($scope.m===12) {

                }else if(sys===5) {

                }else if(sys===12){

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
                sums+=(x*Number(credit));
                allCredit+=Number(credit);
            }
            sums=(90*((sums).toFixed(2)/(system*(allCredit).toFixed(2)))).toFixed(2)
            student.sum=parseFloat(sums);
            if(sums==0.00 || isNaN(sums)){
                sums='';
            }
        }
        $scope.sortBy('sum')
        return sums;
    };

    $scope.add_subjects= function() {
        var amountOfHours=$('#amountOfHours');
        $('.vvf').addClass("hidden");
        $('.loader').removeClass("hidden");

        if($('#groups').val()===0){
            $('#groups').addClass('imp')
        }

        if($('#nameOfSubject').val()===''){
            $('#nameOfSubject').addClass('imp')
        }

        var str=amountOfHours.val();
        var str2=str.replace(/[^0-9]/gi,'');

        if(str!==str2){
            amountOfHours.val('')
            amountOfHours.addClass('imp')
        }

        if(amountOfHours.val()===''){
            amountOfHours.addClass('imp')
        }

        if($('#groups').val()===0 || $('#nameOfSubject').val()==='' || amountOfHours.val()===''){
            $('.loader').addClass("hidden");
            $('.vvf').removeClass("hidden");
            $('body').scrollTop()
        }else {
            $('#groups').removeClass('imp')
            $('#nameOfSubject').removeClass('imp')

            amountOfHours.removeClass('imp')

            var data = {
                groups: $('#groups').val(),
                nameOfSubject: $('#nameOfSubject').val(),
                systemOfMarking: $('#systemOfMarking').val(),
                amountOfHours: amountOfHours.val(),
                typeOfTest: $('#typeOfTest').val(),
                semester: $('#semester').val(),
                teacher: $('#teacher').val()
            };

            $http.post("c_add_subject", data).success(function (data1) {
                $('.loader').addClass("hidden");
                $('.vvf').removeClass("hidden");
            })
        }
    };


    $scope.uploadFile = function(){
        $('.back_load').removeClass('hidden')
        $('body').addClass('over')
        var file = $scope.myFile;
        console.log('file is ' );
        var uploadUrl = "/uploadFile";
        fileUpload.uploadFileToUrl(file, $scope.student['id']);
    };



}).directive("contenteditable", function($http) {
    return {
        require: "ngModel",
        link: function (scope, element, attrs, ngModel) {

            function read() {
                var markAttr=JSON.parse(attrs['mark'])
                if(element.text()==''){
                    if(markAttr['id']!=undefined && markAttr['id']!=null){
                        var data = {
                            id: markAttr['id']
                        };
                        var deleteEl = confirm("Видалити оцінку?");
                        var m=markAttr['id'];
                        if(deleteEl){
                            $http.get("c_delete/" + markAttr['id']).success(function (data1) {

                            });
                        }else {
                            element.text(m['mark']);
                        }
                    }else {

                    }
                }else {

                    if(markAttr['id']!='undefined'){
                                var data = {
                            id: markAttr['id'],
                            mark: element.text(),
                            idStud: markAttr['idStud'],
                            idSubject: markAttr['idSubject'],
                            idGroup: markAttr['idGroup'],
                            idSem: markAttr['idSem']
                        };

                    }else {
                        var data = {
                            mark: element.text(),
                            idStud: markAttr['idStud'],
                            idSubject: markAttr['idSubject'],
                            idSem: markAttr['idSem']
                        };

                    }
                    $http.post("c_add_mark", data).success(function (data1) {
                        if(markAttr['id']!=undefined){
                            scope.marks[attrs['markid']]=data;
                            element.html(data['mark']);
                        }else {
                            scope.marks[scope.marks.length]=data1;
                            attrs['mark']=data1;
                            element.html(data1['mark']);
                        }
                    });
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
                if(attrs['sysmark']==5){
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
})




listApp.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);


listApp.service('fileUpload', ['$http', function ($http) {

    this.uploadFileToUrl = function(file, id){

        var fd = new FormData();
        fd.append('name', id);
        fd.append('file', file);
        $http.post("uploadFile", fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
            .success(function(){
                $('.back_load').addClass('hidden')
                $('body').removeClass('over')
            })
            .error(function(){
            });
    }
}]);

function disableS(el) {
    $('.bb').each(function () {
        $(this).removeClass('disabled')
    })
    $('.bb45').each(function () {
        $(this).removeClass('disabled')
    })
    $('.ggb').addClass('disabled')
    el['classList'].add("disabled")
}
function disableS2(el) {
    $('.bb45').each(function () {
        $(this).removeClass('disabled')
    })
    el['classList'].add("disabled")
}
function getParameterByName(name, url) {
    if (!url) {
        url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#photo').remove();
            $('.img_edit').html('<img id="photo" src="'+e.target.result+'" style="width: 140px;" class="img-rounded" alt="Cinque Terre" height="auto">')
        };
        reader.readAsDataURL(input.files[0]);

    }

}
