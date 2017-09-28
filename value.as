//ŠÂ‹«•Ï”ƒ‚ƒWƒ…[ƒ‹ALFER.hsp

#module valuemng
#deffunc valueinit
sdim vdata,128,128,2
dim vsystemstat
return 0

#deffunc setvalue str addvname,str addval
vsystemstat=-1
if addvname="":return 1
repeat length(vdata)
	if vdata(cnt,0)=addvname{
		vdata(cnt,1)=addval
		vsystemstat=cnt
		break
	}
	if vdata(cnt,0)=""{
		vdata(cnt,0)=addvname
		vdata(cnt,1)=addval
		vsystemstat=cnt
	break
	}
loop
if vsystemstat!-1:return 0
return -1



#defcfunc valueshow str showvname
repeat length(vdata)
	vsystemstat=-1
	if vdata(cnt,0)=showvname{
		vsystemstat=cnt
	break
	}
loop
if vsystemstat!-1:return vdata(vsystemstat,1)
return "Warning:CantFindValue"

#defcfunc getvalue int getvaluem,int getvaluemm
	return vdata(getvaluem,getvaluemm)
#global