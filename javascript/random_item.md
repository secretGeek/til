# Retrieve a random item from an array

Since `Math.random()` returns a random number from `0` to `1`, returning a random item from an array is as easy as:


    var items = ['hat', 'puzzle', 'cobra', 'window', 'tooth', 'zebra'];

    var  randomItem = items[Math.floor(Math.random() * items.length)];
