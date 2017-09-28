		netinit
		if stat:return "<html><body><h1>Network error</h1>Wininet.dll Initialize failed!</body></html>"
		if strmid(urlget,0,7)!"http://" & strmid(urlget,0,8)!"https://"{
			urlget=pastdomain+urlget
		}else{
			pastdomain=strmid(urlget,0,instr(urlget,10,"/")+10)
		}
		strrep urlget,"/","/"
		if filetype=1 & stat<=2{
			urlget+="/"
		}
		neturl getpath(urlget,32)
		netrequest_get getpath(urlget,8)
		repeat
			netexec res
			if res!0:break
			await 50
		loop
		if res>0{
			netgetv s3source
			repeat strlen(s3source)/16386+1
				s3one=""
				nkfcnv s3one,s3source,"sW",16386
				s3source=strmid(s3source,16386,strlen(s3source)-16386)
				s3converted+=s3one
			loop
			s3source=s3converted
		}else{
			neterror neterrorstrings
			s3source="<html><body><h1>Network error</h1>Request Failed.<br>"+urlget+":"+neterrorstrings+"</body></html>"
		}
		netterm
