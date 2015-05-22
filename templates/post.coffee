VERSION = 9

Weya = require './weya/weya'

UI_JS = [
 'static'
 'parser'
 'reader'
 'nodes'
 'render'
]

template = ->
 @html ->
  @head ->
   @meta charset: "utf-8"
   @title @$.title
   @meta name: "viewport", content: "width=device-width, initial-scale=1.0"
   @meta name: "apple-mobile-web-app-capable", content:"yes"
   @link
    href: 'http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
    rel: 'stylesheet'
    type: 'text/css'

   @link href: "lib/skeleton/css/skeleton.css", rel: "stylesheet"
   @link href: "lib/highlightjs/styles/default.css", rel: "stylesheet"
   @link href: "css/style.css", rel: "stylesheet"
   @link href: "blog.css", rel: "stylesheet"
   @script '''
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-63286859-1', 'auto');
            ga('send', 'pageview');

   '''

  @body ->
   @div ".container.wallapatta-container", ->
    @div ".header", ->
     @h1 ->
      @a href: "index.html", "CHETHIYA ABEYSINGHE"
     @a ".button", href: "https://www.twitter.com/chethiyaa", "@chethiyaa"
    @div ".wallapatta", ->
     @h1 ".title", @$.title
     @h3 ".date", "#{@$.date}"
     @div ".row", ->
      @div ".wallapatta-main.nine.columns", "###MAIN###"
      @div ".wallapatta-sidebar.three.columns", "###SIDEBAR###"
      @div style: {display: 'none'}, "###CODE###"

   @script src: "lib/highlightjs/highlight.pack.js"

   @script src:"lib/weya/weya.js"
   @script src:"lib/weya/base.js"
   @script src:"lib/mod/mod.js"

   for file in @$.scripts
    @script src: "js/#{file}.js?v=#{VERSION}"

exports.html = (options) ->
 options ?= {}
 options.scripts ?= UI_JS

 html = Weya.markup context: options, template

 html = html.replace '###MAIN###', options.main
 html = html.replace '###SIDEBAR###', options.sidebar
 html = html.replace '###CODE###',
  "<div class='wallapatta-code'>#{options.code}</div>"

 html = "<!DOCTYPE html>#{html}"

 return html


