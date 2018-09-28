var app = angular.module('main', []);

app.controller('adminController', ['$scope', '$http', function ($scope, $http) {

    $http.get('/categories').then(function (data) {
        $scope.categories = data.data;
    });

    $http.get('colors').then(function(data){
       $scope.colors = data.data;
       console.log($scope.colors);
    });

    $scope.checkColors = function() {
        console.log($scope.colors);
    };

    $scope.activateColor = function(color){
        if(!color.checked){
            color.checked = true;
        }else{
            delete color.checked;
        }
    };

    $scope.getColor = function(color){
            return {
                'color': color.checked ? '#30bf30' : '#e43d3d'
            }
    };

    $scope.upload = function () {

        // if(!$scope.price || !$scope.name || !$scope.category || !$scope.amount){
        //     alert('Не всі основні поля заповнені');
        //     return;
        // }
        //
        // var colors = [];
        // for(var i = 0; i < $scope.colors.length; i++){
        //     if($scope.colors[i].checked){
        //         colors.push($scope.colors[i]);
        //     }
        // }

        var formData = new FormData();
        var files = document.getElementById('input').files;
        for(var index = 1; index < files.length + 1; index++){
            formData.append('photo' + index, files[index-1]);
        }

        formData.append('name', $scope.name);
        formData.append('price', $scope.price);
        formData.append('description', $scope.description);
        $.ajax({
            url: 'uploadFile',
            data: formData,
            type: 'POST',
            contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
            processData: false  // NEEDED, DON'T OMIT THIS
        }).then(function(data){
            alert(data);
        })
    }

}]);