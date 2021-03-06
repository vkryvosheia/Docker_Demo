var app = angular.module('main', ['ngCookies']);

app.controller('productController', ['$scope', '$http', '$cookies', function ($scope, $http, $cookies) {
    $http.get('/categories').then(function (data) {
        $scope.categories = data.data;
    });

    $http.get('/items').then(function(data){
        console.log(data);
        $scope.items = data.data;
    });

//    $scope.hasPrevious = false;
//    $scope.hasNext = true;
//    $scope.activeThumb = 1;

    $scope.getItemSrc = function(src){
        return src.split(';')[0];
    };

    $scope.showModal = function (e, itemId) {
        $http.get('/items/' + itemId).then(function (data) {
            $scope.item = data.data;
            $scope.item.amount = 0;
            $scope.itemPhotos = $scope.item.src.split(';');
            console.log($scope.itemPhotos);
            if($scope.itemPhotos[2]){
                console.log('shit')
            }
            $('.js-modal1').addClass('show-modal1');
        });
    };

//    $scope.prev = function () {
//        if($scope.itemPhotos.length > 1) {
//           $scope.hasNext = true;
//        }
//
//        if($scope.activeThumb > 1) {
//            $scope.activeThumb--;
//        }
//        if($scope.activeThumb === 1) {
//            $scope.hasPrevious = false;
//        }
//        console.log('prev')
//    }
//
//    $scope.next = function () {
//        $scope.hasPrevious = true;
//        $scope.activeThumb++;
//        if($scope.activeThumb >= $scope.itemPhotos.length - 1){
//            $scope.hasNext = false;
//        }
//        console.log('next');
//    }

    $scope.closeModal = function () {
        delete $scope.item;
        delete $scope.itemPhotos;
        $('.slick3-dots').find('li').removeClass('slick-active slick-center slick-current');
        $('.click-track').find('div').removeClass('slick-active slick-current');
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

    $scope.incrementAmount = function() {
      $scope.item.amount ++;
    };

    $scope.decrementAmount = function() {
        if($scope.item.amount > 0) {
            $scope.item.amount--;
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