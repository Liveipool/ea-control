(function ()
{
    'use strict';

    angular
        .module('app.mail', [])
        .config(config);

    /** @ngInject */
    function config($stateProvider, $translatePartialLoaderProvider, msNavigationFactoryProvider)
    {
        // State
        $stateProvider.state('app.mail', {
            url      : '/mail',
            views    : {
                'content@app': {
                    templateUrl: 'app/main/apps/mail/mail.html',
                    controller : 'MailController as vm'
                }
            },
            resolve  : {
                Inbox: function (apiResolver)
                {
                    return apiResolver.resolve('mail.inbox@get');
                }
            },
            bodyClass: 'mail'
        });

        // Translation
        $translatePartialLoaderProvider.addPart('app/main/apps/mail');

        // Navigation
        msNavigationFactoryProvider.saveItem('fuse.mail', {
            title : 'Mail',
            icon  : 'icon-email',
            state : 'app.mail',
            weight: 3
        });
    }
})();