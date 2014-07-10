videos:
	for video in $$(ls masters); do \
		ffmpeg -i masters/$$video -acodec libfaac -ac 2 -ab 160k -s 1536x1152 -vcodec libx264 -vpre iPod640 -b 1700k -f mp4 -threads 0 $$video; \
	done

posters:
	for video in $$(ls masters); do \
		poster=$$(sed 's/mp4/jpg/' <<< $$video); \
		ffmpeg -ss 11 -i $$video -f image2 -vframes 1 $$poster; \
	done

rsync:
	rsync -avz --exclude=.git --exclude=masters --exclude=olds . dx:/apps/cdn/5draw
