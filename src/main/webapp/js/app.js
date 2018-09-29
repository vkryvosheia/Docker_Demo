var main = angular.module('main', ['ngCookies']);

main.controller('mainController', ['$scope', '$http', '$cookies', function ($scope, $http, $cookies) {

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
            console.log($scope.itemPhotos);
            $('.js-modal1').addClass('show-modal1');
        });
    };

    $scope.closeModal = function () {
        delete $scope.item;
        delete $scope.itemPhotos;
        $('.js-modal1').removeClass('show-modal1');
    };


    $scope.removeFromCart = function(item) {
        var idToDelete = $scope.cart.map(function(item) {
            return item.id
        }).indexOf(item.id);

        $scope.cart.splice(idToDelete, 1);
        if($scope.cart.length){
            $cookies.put('cart', JSON.stringify($scope.cart));
        } else {
            $cookies.remove('cart');
        }
    };

    $scope.showCartNumber = function () {
        $scope.cart = $cookies.get('cart') ? JSON.parse($cookies.get('cart')) : [];
    };

    $scope.getCartTotal = function () {
        var total = 0;
        if ($scope.cart) {

            $scope.cart.map(function (elem) {
                total += elem.price * elem.amount;
            });
        }
        return total;
    }


}]);