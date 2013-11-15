(function() {

  angular.module('checklists').directive('category', function($timeout) {
    return {
      restrict: 'A',
      scope: {
        headerCategory: '=category'
      },
      link: function(scope, elem, attrs) {
        return scope.$parent.categoryHeaders[scope.headerCategory.name] = elem;
      }
    };
  });

}).call(this);
