var app = angular.module('main', []);

app.controller('productDetailController', ['$scope', '$http', '$location', function ($scope, $http, $location) {

    var currentItemId = $location.search().id;
    console.log($location);
    $http.get('/items/' + currentItemId).then(function (data) {
        $scope.item = data.data;
        $scope.itemPhotos = $scope.item.src.split(';');
        console.log($scope.item);
    })

}]);