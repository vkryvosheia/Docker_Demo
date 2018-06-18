var myApp = angular.module('list_app', []);

myApp.controller('myCtrl', ['$scope', 'fileUpload', function($scope, fileUpload){

    $scope.uploadFile = function(){
        var file = $scope.myFile;
        console.log('file is ' );
        console.dir(file);
        var uploadUrl = "uploadFile";
        fileUpload.uploadFileToUrl(file, uploadUrl);
    };

}]);