# SENDING HTTP REQUESTS

1. Storing Data:
    * On Device Storage (it can be persist, we'll use it user authentication)
    * Web server
2. Some http Verbs:
    * GET
    * POST
    * PATCH
    * DELETE
    * PUT
3. Url
    * copy your url from your webserver, it's firebase webserver in my situation.
    * const url = 'https://..........com'; this is a link of firebase
    * if you wanna store them in a folder or something like that you should also write its name
    * const url = 'https//...........com/products.json'; also add .json to end of the link (other apis might work differently)
    
4. encoding and decoding
    * json.encode(); it gets a map (Actually it can take any object but we've used map at the moment)
    * in then(...) method we used decoding to initialize an id. (That's an awsome solution)
5. Showing something while loading
    * In this application we used _isLoading variable and this was an awesome logic fot this circumstance.
    * we also used setState((){}).
    * _isLoading was initially false
    * we write it in setState(...) and then assign true
    * after something okay(http request or some this kind of thing) assign it again as false.
6. async & await

    
