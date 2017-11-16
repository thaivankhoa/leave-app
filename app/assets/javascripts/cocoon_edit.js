$(document).ready(function(){
    $('.request_date_picker').datepicker({ dateFormat: 'dd-mm-yy' });
    $('.new-edit-request').on('cocoon:after-insert', function(e, insertedItem) {
       return $('.request_date_picker').datepicker({ dateFormat: 'dd-mm-yy' }).val();
    });
});
