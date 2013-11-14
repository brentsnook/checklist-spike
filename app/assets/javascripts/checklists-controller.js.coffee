ChecklistsController = ($scope, $http) ->

  $http(method: 'GET', url: '/checklists/1.json').success (data, status, headers, config) ->
    $scope.categories = data.categories

  $scope.complete_count = (category) ->
    (item for item in category.items when item.status == 'Y').length

  $scope.complete_percentage = (category) ->
    category.completion.percentage

  $scope.magic = ->
    $('ul').list({ headerSelector : 'li.header' })
    console.log 'howdy'

angular.module('checklists', []).controller('ChecklistsController', ChecklistsController)
