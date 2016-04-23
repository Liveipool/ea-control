'use strict'
angular.module 'app.sample', []
  
  .config ($state-provider, $translate-partial-loader-provider, ms-navigation-service-provider)!->

    $state-provider.state 'app.sample', {
      url: '/sample'
      resolve: result: (api-resolver)-> api-resolver.resolve('sample@get')
      views:
        'content@app':
          template-url: 'app/main/sample/sample.html'
          controller: (result, $scope)!->
            console.log "result: ", result
            $scope.hello-text = result.data.hello-text
    }
