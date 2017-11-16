$(document).ready(function(){
    // $('.request_date_picker').datepicker({ dateFormat: 'dd-mm-yy' });
    // $('.new-edit-request').on('cocoon:after-insert', function(e, insertedItem) {
    //    return $('.request_date_picker').datepicker({ dateFormat: 'dd-mm-yy' }).val();
    // });
     jQuery ->                                                                                                                                                                                                   
        $(document).on 'click' , ".delete-duration" , (event) ->                                                                                                                                              
                $(this).prev('input[type=hidden]').val('1')                                                                                                                                                 
                $(this).closest('fieldset').hide()                                                                                                                                                          
                event.preventDefault()  
});
