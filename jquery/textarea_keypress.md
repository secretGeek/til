# Jquery event on textarea change

This is surprising and has gone through a few changes across the years.



    var oldVal = "";
    
    $("#textarea").on("change keyup paste", function() {
        var currentVal = $(this).val();
        if(currentVal == oldVal) {
            return; //check to prevent multiple simultaneous triggers
        }

        oldVal = currentVal;
        //action to be performed on textarea changed
        alert("changed!");
    });
    
    
    