(function() {
  var ChecklistsController;

  ChecklistsController = function($scope, $http) {
    $scope.categories = {};
    $scope.activeCategory = null;
    $http({
      method: 'GET',
      url: 'checklists/1.json'
    }).success(function(data, status, headers, config) {
      $scope.categories = data.categories;
      return $scope.activeCategory = $scope.categories[0];
    });
    $scope.complete_count = function(category) {
      var item;
      return ((function() {
        var _i, _len, _ref, _results;
        _ref = category.items;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          item = _ref[_i];
          if (item.status === 'Y') {
            _results.push(item);
          }
        }
        return _results;
      })()).length;
    };
    $scope.complete_percentage = function(category) {
      return category.completion.percentage;
    };
    return $scope.setActiveCategory = function(categoryName) {
      var category;
      $scope.activeCategory = ((function() {
        var _i, _len, _ref, _results;
        _ref = $scope.categories;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          category = _ref[_i];
          if (category.name === categoryName) {
            _results.push(category);
          }
        }
        return _results;
      })())[0];
      return $scope.$apply();
    };
  };

  angular.module('checklists', []).controller('ChecklistsController', ChecklistsController);

}).call(this);
