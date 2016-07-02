angular.module 'app.test'

.config ($state-provider)!->
  
    $state-provider.state 'app.test.execution-detail', {
      url: '/test/executions/?new_execution_id?box_id?tester_name'
      resolve: data: (api-resolver)-> api-resolver.resolve('testInfo@get')
      views:
        'content@app':
          template-url: 'app/main/test/execution/detail/test-execution-detail.html'
          controller-as: 'vm'
          controller: (data, test-service, $scope, $interval, $state-params)!->
            @execution_steps_info = data
            @new_execution_info = test-service.getNewExecution $state-params.new_execution_id, $state-params.box_id, $state-params.tester_name
            @estimateEndTime = 0
            for step in @execution_steps_info.testInfo.steps
              step.status = 'pending'
              @estimateEndTime += step.estimateExecutionTime
            @execution_steps_info.testInfo.steps[0].status = 'active'
            # @execution_steps_info.testInfo.steps[0].estimateEndTime = @execution_steps_info.testInfo.steps[0].estimateExecutionTime
            @completedStepsCount = 0
            @totalStepsCount = @execution_steps_info.testInfo.steps.length
            currentStep = 0
            console.log "@new_execution_info bbbbbb: ", @new_execution_info
            console.log "data aaaaaa: ", data
            # console.log "@estimateEndTime: ", @estimateEndTime
            that = @ #这里还是不太懂，下面executing函数里要是用@就会报错，cannot read testInfo of undefined
            executing = ->
              that.completedStepsCount = currentStep
              that.estimateEndTime -= 1000
              that.execution_steps_info.testInfo.steps[currentStep].estimateExecutionTime -= 1000
              # console.log "why: ", that.execution_steps_info.testInfo.steps[currentStep]
              if that.execution_steps_info.testInfo.steps[currentStep].estimateExecutionTime < 1000
                currentStep++
              # if that.estimateEndTime < 1000
              #   that = 0
              #   timer = $interval executing, 1000
              #   $interval.cancel timer
              # 上面几排是在让执行全部结束后不继续执行，但还有点小bug
            timeChanging = $interval executing, 1000
            @mockSocketMessageStepStarted = ->
              that.execution_steps_info.testInfo.steps[currentStep].estimateExecutionTime = 0
              currentStep++
              tempTime = 0
              for i from currentStep to that.totalStepsCount - 1
                tempTime += that.execution_steps_info.testInfo.steps[i].estimateExecutionTime
              that.estimateEndTime = tempTime
    }
