angular.module 'app.test'

.config ($state-provider)!->
  
    $state-provider.state 'app.test.execution-detail', {
      url: '/test/executions/?new_execution_id?box_id?tester_name'
      resolve: data: (api-resolver)-> api-resolver.resolve('testInfo@get')
      views:
        'content@app':
          template-url: 'app/main/test/execution/detail/test-execution-detail.html'
          controller-as: 'vm'
          controller: (data, test-service, $scope, $state-params)!->
            @execution_steps_info = data
            @new_execution_info = test-service.getNewExecution $state-params.new_execution_id, $state-params.box_id, $state-params.tester_name
            console.log "bbbbbb: ", @new_execution_info
            console.log "aaaaaa: ", data
    }
