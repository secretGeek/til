# Custom Search for Images


Here's a simple example of running an image search against google's 'customsearch' api... Getting their API to work, however, is NOT simple.

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
                    $("#results").append('<img class="img-responsive" src="' + item.link + '">');
                });
            });        
        });
    </script>


    
    
There are three tricks:

1. Obtain an API key (for the `key` parameter)
    
2. Create a custom search engine (for the `cx` parameter)

3. Tell your custom search engine to allow image search.

More detail:

## 1. Obtain an API key. 

To do this you need to "enable" the API.

Steps:

1. Go to <https://console.developers.google.com/> and sign up as a developer if you haven't already.

2. Then create a new project, and give it a name. Then wait for it to be 'created'. 

3. On the 'dashboard' for the project you just created, click `+ Enable API` and find the 'Custom Search' API.

4 Click the `Enable` button which is up near the top of the screen where you easily overlook it.

5. Click on 'Create Credentials' then click on 'What credentials do I need?'

6. It will then create an API key for you.

This is so ridiculously convoluted.

At this point you can easily add 'restrictions' to the API key to prevent 'quota theft'. So yeh, do that if you want.


## 2. Create a custom search engine. 


You can see your custom search engines here: https://cse.google.com/cse/all



I wanted one that lets me search the entire internet. There's a trick to doing this.

You need to first create one that searches a specific site. (You have not choice here... you must specify a site)

Then edit it so that it searches the entire internet but favors the site you added.

Then remove the site you added.    


Steps are:

1.  go to: <https://cse.google.com/cse/all>  and click `Add`

2. Put some url in the `Sites to Search` box.

3. Click 'Create'.

4. go to <https://cse.google.com/cse/all>  and click the custom search engine you just added.

5. Changes 'Sites to Search' from 'Search only included sites' to 'Search the entire web but emphasize included sites'

6. Delete the site from underneath 'Sites to Search'.

7. Click update. (or follow the next few steps before clicking update...)


Now you also need to get the value to put in `cx`. 

In the Details section click on `Search Engine ID` and you will see a small modal popup that says something like:

> Your search engine ID:
>
> 001100:ei392xnwj-ee

Copy that and use it for the `cx` parameter in your search, above.

## 3. Tell your custom search engine to allow image search.

By default a customer search engine does not allow image search.

If you don't do step 3 you will get a result of "0 records found".

Just below the details section for your custom search engine, there is an 'image search' setting which defaults to `Off`.

Turn it `On`.

Then click the `Update` button at the bottom of the form.



## Sources

 * [Custom Search Parameters](https://developers.google.com/apis-explorer/?hl=en_GB#p/customsearch/v1/search.cse.list)
 
 * [Stackoverflow: Direct link to obtain a google custom search API key?](http://stackoverflow.com/questions/7489862/direct-link-to-obtain-a-google-custom-search-api-key)

