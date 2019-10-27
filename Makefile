all:
	coffee -c -o templates templates/*.coffee
	wallapatta --blog blog.yaml --output ../blog --static
	@cp templates/blog.css ../blog
	@cp css/style.css ../blog/css