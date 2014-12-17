/*
 * SimpleModal Basic Modal Dialog
 * http://simplemodal.com
 *
 * Copyright (c) 2013 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 */

jQuery(function ($) {
    // Load dialog on page load
    //$('#basic-modal-content').modal();

    // Load dialog on click
    $('.thumbnail .basic').on('click', function (e) {
        $('#basic-modal-content').modal({overlayClose: true});

        return false;
    });

    $('#registerButton').on('click', function (e) {
        $('#basic-modal-register').modal({overlayClose: true,
            containerCss: {
                height: 400,
                width: 300}});

        return false;
    });

    $('#registerButton').on('click', function (e) {
        $('#basic-modal-register-return').modal({overlayClose: true});

        return false;
    });

    $('#privacyStatement').on('click', function (e) {
        $('#basic-modal-privacyStatement').modal({overlayClose: true,
            containerCss: {
                height:600,
                width: 500
            }
        });

        return false;
    });


});