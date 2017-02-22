# Custom Search for Images


Here's a simple example of running an image search against google's 'customsearch' api... Getting it to work is NOT simple.

    <input id="searchterm" />
    <button id="search">search</button>
    <div id="results"></div>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $("#search").click(function(){
            $.getJSON("https://www.googleapis.com/customsearch/v1", {
                q: $("#searchterm").val(),
                alt: "json",
                searchType: "image",
                cx: "0001100:ei392xnwj-ee",
                key: "Your_Very_Long_CustomSearch_API_Key",
                filter: "1",
                num: "10",
                fileType: "jpg",
                imgType: "photo"
            },
            function (data) {
                $.each(data.items, function(i,item){    
                    $("#results").ap    pend('<img class="img-responsive" src="' + item.link + '">');
                });
            });        
        });
    </script>


    
    
There are three tricks:

1. Obtain an API key. 
    
2. Create a custom search engine. 

3. Tell your custom search engine to allow image search.

More detail:

## 1. Obtain an API key. 

To do this you need to "enable" the API.


## 2. Create a custom search engine. 

I wanted one that lets me search the entire internet. There's a trick to doing this.

You need to first create one that searches a specific site. (You have not choice here... you must specify a site)

Then edit it so that it searches the entire internet but favors the site you added.

Then remove the site you added.    


## 3. Tell your custom search engine to allow image search.

By default a customer search engine does not alow image search.

If you don't do step 3 you will get a result of "0 records found".


## Sources

 * [Custom Search Parameters](https://developers.google.com/apis-explorer/?hl=en_GB#p/customsearch/v1/search.cse.list)
 
