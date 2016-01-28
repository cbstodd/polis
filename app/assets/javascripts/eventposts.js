// page:load tells turbolinks that page was reloaded
//  to trigger jquery.
$(document).on('ready page:load', function() {

        //Date picker
        $('#date').datepicker({
            dateFormat: 'yy-mm-dd'
        });


});//End jQuery