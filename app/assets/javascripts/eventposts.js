$(document).ready(function() {


//Date picker function for non webkit browsers.
    (function() {
        var elem = document.createElement('input');
        elem.setAttribute('type', 'date');

        $('#date').datepicker({
            dateFormat: 'mm-dd-yy'
        });

        if ( elem.type === 'text' ) {
            $('#date').datepicker();
        }
    })();




});//End jQuery