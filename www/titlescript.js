jQuery(function(){
    $('img').attr('title', function(){
        return $(this).attr('src')
    });
})