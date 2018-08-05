var app = angular.module('main', []);

app.controller('adminController', ['$scope', '$http', function ($scope, $http) {

    $http.get('/categories').then(function (data) {
        $scope.categories = data.data;
    });

    $scope.imageSrc = "";

    $scope.upload = function () {
        // $http.get('uploadFile?file='+ $scope.imageSrc).then(function (data) {
        //     console.log(data.data);
        // })
        var formData = new FormData();
        formData.append('file', document.getElementById('input').files[0]);
        console.log(formData);
        console.log(document.getElementById('input').files[0]);

        $.ajax({
            url: 'uploadFile',
            data: formData,
            type: 'POST',
            contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
            processData: false  // NEEDED, DON'T OMIT THIS
            // ... Other options like success and etc
        });
    }

}]);

app.directive("imgUpload",function($http,$compile){
    return {
        restrict : 'AE',
        scope : {
            url : "@",
            method : "@"
        },
        template : 	'<input class="fileUpload" type="file" multiple />'+
            '<div class="dropzone">'+
            '<p class="msg">Click or Drag and Drop files to upload</p>'+
            '</div>'+
            '<div class="preview clearfix">'+
            '<div class="previewData clearfix" ng-repeat="data in previewData track by $index">'+
            '<img src={{data.src}}></img>'+
            '<div class="previewDetails">'+
            '<div class="detail"><b>Name : </b>{{data.name}}</div>'+
            '<div class="detail"><b>Type : </b>{{data.type}}</div>'+
            '<div class="detail"><b>Size : </b> {{data.size}}</div>'+
            '</div>'+
            '<div class="previewControls">'+
            '<span ng-click="upload(data)" class="circle upload">'+
            '<i class="fa fa-check"></i>'+
            '</span>'+
            '<span ng-click="remove(data)" class="circle remove">'+
            '<i class="fa fa-close"></i>'+
            '</span>'+
            '</div>'+
            '</div>'+
            '</div>',
        link : function(scope,elem,attrs){
            var formData = new FormData();
            scope.previewData = [];

            function previewFile(file){
                var reader = new FileReader();
                var obj = new FormData().append('file',file);
                reader.onload=function(data){
                    var src = data.target.result;
                    var size = ((file.size/(1024*1024)) > 1)? (file.size/(1024*1024)) + ' mB' : (file.size/		1024)+' kB';
                    scope.$apply(function(){
                        scope.previewData.push({'name':file.name,'size':size,'type':file.type,
                            'src':src,'data':obj});
                    });
                    console.log(scope.previewData);
                }
                reader.readAsDataURL(file);
            }

            function uploadFile(e,type){
                e.preventDefault();
                var files = "";
                if(type == "formControl"){
                    files = e.target.files;
                } else if(type === "drop"){
                    files = e.originalEvent.dataTransfer.files;
                }
                for(var i=0;i<files.length;i++){
                    var file = files[i];
                    if(file.type.indexOf("image") !== -1){
                        previewFile(file);
                    } else {
                        alert(file.name + " is not supported");
                    }
                }
            }
            elem.find('.fileUpload').bind('change',function(e){
                uploadFile(e,'formControl');
            });

            elem.find('.dropzone').bind("click",function(e){
                $compile(elem.find('.fileUpload'))(scope).trigger('click');
            });

            elem.find('.dropzone').bind("dragover",function(e){
                e.preventDefault();
            });

            elem.find('.dropzone').bind("drop",function(e){
                uploadFile(e,'drop');
            });
            scope.upload=function(obj){
                $http({method:scope.method,url:scope.url,data: obj.data,
                    headers: {'Content-Type': undefined},transformRequest: angular.identity
                }).success(function(data){

                });
            }

            scope.remove=function(data){
                var index= scope.previewData.indexOf(data);
                scope.previewData.splice(index,1);
            }
        }
    }
});