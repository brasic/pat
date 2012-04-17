Pat
====

A minimalist backbone.js app to store notes and track pending issues.

Notes and comments are written in markdown. Backend is Rails+MongoDB using MongoMapper.  
Frontend is in coffeescript, UI is mostly twitter bootstrap.

Installing
===

 * Use ruby 1.9.3 or newer please.
 * ``git clone <repo> && cd pat && bundle install``
 * Edit ``config/database.mongo.yml`` with your mongoDB info.
 * Authentication is handled by LS, so change ``app/models/user.rb`` to point to a working LS install (like [http://ls](http://ls.ic.ncs.com)) or just don't use auth. (For development, you can run a local LS install on port 3001)
 * ``rails server``


Screenshots
===
![index](http://pearson-ai.github.com/pat/images/index.png)

![concern](http://pearson-ai.github.com/pat/images/concern.png)


More info
===

 * http://documentcloud.github.com/backbone/
 * http://rubyonrails.org/
 * http://mongomapper.com/
 * http://jashkenas.github.com/coffee-script/
 * http://twitter.github.com/bootstrap/
