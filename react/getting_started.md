# Getting started with react

 
React concepts:

 * JSX
 * components
 * virtual DOM
 * props
    

Reacts.js is: A javascript library, from facebook, for building user interfaces (in HTML).

Unlike other recent frameworks (e.g. Angular, Polymer) it doesn't do "two-way data binding with templates". Instead it works by having you develop "components". These components are rendered in a virtual DOM, which is then compared to the actual DOM, and only the things that are different are applied.


Okay - the [official getting started](https://facebook.github.io/react/docs/getting-started.html) with react.js is utterly [COIK](../concepts/coik.md). So I've had to write my own, mostly by walking through the react-tutorial.

Start by getting the code.
    
    > git clone https://github.com/reactjs/react-tutorial.git
    > cd react-tutorial
    > npm install  # ..may have to run that multiple times!!   
    > npm start 
    
    # Now browse to http://localhost:3000 ...

This example runs a local webserver (using node). (start, in this case, is an [npm script](../npm/npm_run_scripts.md) in the `package`.json file). The part we're interested in examining is the front end app, not what happens on the server. But I've looking in the server (a file `server.js`) just long enough to see that:

1. it is a node app, 
2. i don't speak node, 
3. The root path (/) simply serves out the subfolder `public`. 

So the place to start is by examining `public/index.html`.

The body of that page contains this:

    <div id="content"></div>
    <script type="text/babel" src="scripts/example.js"></script>
    <script type="text/babel">
      // To get started with this tutorial running your own code, simply remove
      // the script tag loading scripts/example.js and start writing code here.
    </script>

So `#content` is where all the html will go, and there's also an example script we will dig into. You can model your own application's behavior to be a bit like example.js. Note the script type of text/babel!

# Babel...

First let's deal with babel.

There's a reference to this babel library:

    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.6.15/browser.js"></script>

And note that other scripts are of type `text/babel`.

There is no other mention of babel in the entire app.

From this I can assume:

The babel javascript library is loaded, and the `text/babel` scripts are not executed by the browser. The babel library then looks for any `text/babel` scripts, and *transpiles* them into javascript, adding them to the page. (Kids actually do this kind of thing on purpose... Wow.)

Inside the babel scripts we see the intermingling of javascript with XML. The XML is called `JSX`. Babel turns the `JSX` into regular javascript. Again -- kids do this kind of thing on purpose. I know, right. The scariest part isn't that they're doing this sort of business, but that they're actually making it work for them. Really freaking nicely. 

Take this snippet from the example.js

    ReactDOM.render(
      <CommentBox url="/api/comments" pollInterval={2000} />,
      document.getElementById('content')
    );


That's where the whole thing starts. It creates a component called CommentBox.

What is CommentBox you might ask? Is that some new highly-specific HTML5 tag? No... it is a component, that has been defined inside the project. (Note the capital C, more on that later)

So we see that ReactDOM renders that CommentBox **component**. And it renders it inside that `#content` element we saw earlier.

How was it defined? in some code that looks like this:

    var CommentBox = React.createClass({
       ...});

Note the capital C on CommentBox. That's a convention, whereby they're saying "Hey, this thing is a Component! It's kind of a big deal!"
       
Inside that createClass piece of JSON, there's a whoooole bunch of crazy going on.

Let's look at a different component, and pick it apart piece by piece.

    var CommentForm = React.createClass({
      getInitialState: function() {...
      handleAuthorChange: function (comment) {...
      handleTextChange: function (comment) {...
      handleSubmit: function (comment) {...
      render: function() {...
    });

Those three middle functions (handle, handle, handle) are all similar -- we'll see what happens with those in a moment. They're specific to this component.

The first and last functions, `getInitialState` and `render` are to do with the lifecycle of this component.

That last function, 'render' is called by React when an instance of the component is rendered.

Let's start there.

    render: function() {
        return (
          <form className="commentForm" onSubmit={this.handleSubmit}>
            <input
              type="text"
              placeholder="Your name"
              value={this.state.author}
              onChange={this.handleAuthorChange}
            />
            <input
              type="text"
              placeholder="Say something..."
              value={this.state.text}
              onChange={this.handleTextChange}
            />
            <input type="submit" value="Post" />
          </form>
    );

Okay -- so again, it contains `JSX`. It looks like HTML, is actually XML. Is turned into javascript at compile time (by babel) and is rendered into the virtual DOM at render time. And possibly applied to the real DOM, if needed.

Like any good xml document, it needs to have only one root node (a <form /> in this case).

(Btw, these familiar html tags are written with a **lowercase** first letter, unlike our special Components)

Note how, inside a few `{squiggly}` brackets there's a bunch of stuff going on.

Let's pull those bits out and examine them one by one.

These bits are all similar...

    {this.handleSubmit}
    {this.handleAuthorChange}
    {this.handleTextChange}

These indicate event handlers that need to be wired up... to the 3 functions we mentioned earlier.

And these bits are all similar:

    {this.state.author}
    {this.state.text}

...indicating the state of the component will be rendered at that point.

Okay -- so we'll examine "handleTextChange" ---


It's a function that does just this:

    handleTextChange: function(e) {
        this.setState({text: e.target.value});
    },

Now we learn how `this.state` is updated. I suspect it's immutable and a new state was created.

In any case, we had to explicitly add such a handler, demonstrating that two-way binding is not occurring. State propagation has to be taken care of somewhat explicitly. (I like this!)


## Source

 * https://facebook.github.io/react/docs/tutorial.html

## See Also

 * `npm` &mdash; to install: see [install npm](..\npm\install_npm.md)
 * `browserify` &mdash; to install: `npm install -g browserify`
 * [javascript 1.7](javascript_1.7.md)


    
