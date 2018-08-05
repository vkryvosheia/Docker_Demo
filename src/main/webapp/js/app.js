var main = angular.module('main', []);

main.controller('mainController', ['$scope', '$http', function ($scope, $http) {
    $scope.items = [];
    $http.get('/items').then(function(data){
        console.log(data);
        $scope.items = data.data;
    });

    $http.get('/categories').then(function (data) {
        console.log(data.data);
        $scope.categories = data.data;
    })
}]);