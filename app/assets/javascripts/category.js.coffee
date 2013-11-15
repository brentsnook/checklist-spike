angular.module('checklists').directive 'category', ($timeout) ->
  restrict: 'A',
  scope:  {
    headerCategory: '=category'
  }
  link : (scope, elem, attrs) ->
    scope.$parent.categoryHeaders[scope.headerCategory.name] = elem