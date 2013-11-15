(function() {

  angular.module('checklists').directive('container', function($timeout) {
    return {
      scope: true,
      link: function($scope, elem, attrs) {
        var containerTop;
        $scope.categoryHeaders = {};
        containerTop = elem[0].getBoundingClientRect().top;
        return angular.element(elem).bind('scroll', function() {
          var categoryName, element, scrolledCategories, _ref;
          _ref = $scope.categoryHeaders;
          for (categoryName in _ref) {
            element = _ref[categoryName];
            if (element[0].getBoundingClientRect().bottom < containerTop) {
              scrolledCategories = categoryName;
            }
          }
          console.log(scrolledCategories);
          return $scope.$parent.setActiveCategory(scrolledCategories);
        });
      }
    };
  });

}).call(this);
