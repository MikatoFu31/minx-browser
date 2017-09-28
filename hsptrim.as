#module hsptrim
	#defcfunc trim str fortrim
		sdim strings,65536
		strings=fortrim
		repeat
			if strmid(strings,0,1)=" "{
				strings=strmid(strings,1,strlen(strings)-1)
			}else{
				break
			}
			await
		loop
		repeat
			if strmid(strings,-1,1)=" "{
				strings=strmid(strings,0,strlen(strings)-1)
			}else{
				break
			}
			await
		loop
	return strings
#global

