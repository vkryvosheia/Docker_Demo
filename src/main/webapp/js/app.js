var main = angular.module('main', []);

main.controller('mainController', ['$scope', '$http', function ($scope, $http) {

    $http.get('/items').then(function(data){
        console.log(data);
        $scope.items = data.data;
    });

    $http.get('/categories').then(function (data) {
        console.log(data.data);
        $scope.categories = data.data;
    });

    $scope.getItemSrc = function(src){
        return src.split(';')[0];
    };

    $scope.showModal = function (e, itemId) {
        $http.get('/items/' + itemId).then(function (data) {
            $scope.item = data.data;
            $scope.itemPhotos = $scope.item.src.split(';');
            console.log($scope.item);
            $('.js-modal1').addClass('show-modal1');
        });
    };

    $scope.closeModal = function () {
        delete $scope.item;
        delete $scope.itemPhotos;
        $('.js-modal1').removeClass('show-modal1');
    };

}]);