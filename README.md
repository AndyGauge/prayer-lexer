LEX
===

Lexical Prayer Processor
------------------------

This applicaton is used to determine an appropriate biblical verse to recommend based on someones prayer.  Lex uses bayesian classification, a topical bible, and [bible-api.com](http://bible-api.com) to return an encouraging message.

### Training ###

Before parsing prayers, a topical CSV file from [www.openbible.info/topics/](https://a.openbible.info/data/topic-votes.txt) should be located in the root of the repository.  This file is updated weekly, so the one included is out of date.  

There is a rake task that iterates over the CSV and trains the classifier.  This trains the categories (verses) with the topics.  To run the rake task.

    rake train

### Command Line ###

In the working directory of the application, passing lex.rb to ruby with a single argument returns a verse and the text.

    ruby lex.rb "Fill me with the holy spirit"
    Acts 13:52 The disciples were filled with joy and with the Holy Spirit.

### Sinatra Application (Web) ###

To run as a web api, run app.rb and use a browser to navigate to localhost:4567

    rake server

TL;DR
=====

Just run rake.

    rake

This will download the updates, retrain the classifier, and start the application.

More Information
----------------

Visit [Yet Another Site](http://www.yetanother.site/praybook/2016/03/29/prayer-lexer-rewrite-sinatra.html) for the blog.
