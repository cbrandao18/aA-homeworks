console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
    type: 'GET',
    url: 'http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
    success(data){
        console.log("Got the data.");
        console.log(data);
    }
})

// Add another console log here, outside your AJAX request
console.log("Bottom of file");

// When does the request get sent ?
    // JS told the browser to make the request in between the first and third console.logs
// When does the response come back ?
    // After the last console.log
// What's the current weather in London?
    // Clear sky
// Did the page refresh ?
    // no
// How could we use different HTTP methods in our request ?
    // change the type 