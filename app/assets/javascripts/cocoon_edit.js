$(document).ready(function(){
    $('.request_date_picker').datepicker({ dateFormat: 'dd-mm-yy' });
    $('#new-request').on('cocoon:after-insert', function(e, insertedItem) {
      console.log('aaaa');
       return $('.request_date_picker').datepicker({ dateFormat: 'dd-mm-yy' }).val();
    });
});
