angular.module('checklists').directive 'container', ($timeout) ->
  scope: true
  link : ($scope, elem, attrs) ->
    $scope.categoryHeaders = {}
    containerTop = elem[0].getBoundingClientRect().top
    angular.element(elem).bind 'scroll', ->
      scrolledCategories = categoryName for categoryName, element of $scope.categoryHeaders when element[0].getBoundingClientRect().bottom < containerTop
      $scope.$parent.setActiveCategory(scrolledCategories)