var app = angular.module('main', []);

app.controller('productController', ['$scope', '$http', function ($scope, $http) {

    $http.get('/categories').then(function (data) {
        $scope.categories = data.data;
    });

    $http.get('/items').then(function(data){
        console.log(data);
        $scope.items = data.data;
    });

}]);