#Refinery CMS Video.js
Simple video engine for [Refinery CMS](http://refinerycms.com).
There are ways to include video in your project.
- You can embedded video (like youtube or vimeo iframes)
- You can upload files
- You can use link to external source

Engine use [Video.js](http:videojs.com) player to playback video (except embedded video, of course).
Engine allows you to manage playback configuration (poster image, width, height, autoplay, controls, etc).
When you insert video to pages using wymeditor, you insert HTML code with video (or iframe) tag.
Engine will automatically download video.js library on frontend.

#Demo
You can see engine in action [here](http://refinerycms-videojs-demo.herokuapp.com/refinery/videos)
Use demo@adexin.com / demo@adexin.com to login.
Please, remove you videos after playing around.

##Requirements
Refinery CMS version 2.0.1 or above

##Install
Open up your ``Gemfile`` and add at the bottom this line:

```ruby
gem 'refinerycms-videojs'
```

Now, run ``bundle install``

Next, to install the blog plugin run:

    rails generate refinery:videos

Run database migrations:

    rake db:migrate

And you're done.

##Developing and Contribution
- Please see [refinerycms-videojs-demo](https://github.com/antonmi/refinerycms-videojs-demo) repo

##More Information
- Check out Refinery CMS [guides](http://refinerycms.com/guides)
- Check out our [website](http://adexin.com)
