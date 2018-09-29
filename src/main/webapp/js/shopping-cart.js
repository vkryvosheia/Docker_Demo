var app = angular.module('main', ['ngCookies']);

app.controller('cartController', ['$scope', '$http', '$cookies', function ($scope, $http, $cookies) {

    $scope.getItemSrc = function(src){
        return src.split(';')[0];
    };

    $scope.showModal = function (e, itemId) {
        $http.get('/items/' + itemId).then(function (data) {
            $scope.item = data.data;
            $scope.item.amount = 0;
            $scope.itemPhotos = $scope.item.src.split(';');
            $('.js-modal1').addClass('show-modal1');
        });
    };

    $scope.closeModal = function () {
        delete $scope.item;
        delete $scope.itemPhotos;
        $('.js-modal1').removeClass('show-modal1');
    };

    $scope.addToCart = function () {
        if(!$scope.item.amount) {
            swal($scope.item.name, "Спочатку виберіть кількість", "warning");
            return;
        }
        if(!$cookies.get('cart')){
            $cookies.put('cart', "["+ JSON.stringify($scope.item) + "]");
        }else {
            var value = $cookies.get('cart').substring(0, $cookies.get('cart').lastIndexOf(']'));
            var currentCart = JSON.parse($cookies.get('cart'));
            var foundElem = currentCart.find(function (element) {
                return element.id === $scope.item.id;
            });

            if(!foundElem){
                $cookies.put('cart', value + ',' + JSON.stringify($scope.item) + "]");
            }
        }
        $scope.showCartNumber();

        swal($scope.item.name, "Додано в кошик!", "success");
    };

    $scope.incrementAmount = function(item) {
      item.amount ++;
    };

    $scope.decrementAmount = function(item) {
        if(item.amount > 0) {
            item.amount--;
        }
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
        console.log($scope.cart);
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