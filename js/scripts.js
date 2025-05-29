function printR(p) {
    console.log("Inside printR...");
    console.log(JSON.parse(p));
};

const common = {
    printF: function(p) {
        var jsonObject = JSON.parse(p);
        console.log("Inside printF...");
        console.log(jsonObject);
        console.log(jsonObject.glossary);
    }
};

$(document).ready(function(){

    console.log("Hello Jeetu");

});