(function ()
{
    'use strict';

    angular
        .module('app.calendar', [
            'ui.calendar'
        ])
        .config(config);

    /** @ngInject */
    function config($stateProvider, $translatePartialLoaderProvider, msNavigationFactoryProvider)
    {
        // State
        $stateProvider.state('app.calendar', {
            url      : '/calendar',
            views    : {
                'content@app': {
                    templateUrl: 'app/main/apps/calendar/calendar.html',
                    controller : 'CalendarController as vm'
                }
            },
            bodyClass: 'calendar'
        });

        // Translation
        $translatePartialLoaderProvider.addPart('app/main/apps/calendar');

        // Navigation
        msNavigationFactoryProvider.saveItem('fuse.calendar', {
            title : 'Calendar',
            icon  : 'icon-calendar-today',
            state : 'app.calendar',
            weight: 2
        });
    }
})();