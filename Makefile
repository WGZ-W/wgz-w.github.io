
.PHONY : commit

commit : 
		git add *
		git commit -m "a"
		git push
	
.PHONY : cp

cp : 
	cp /my/note/*.html .
