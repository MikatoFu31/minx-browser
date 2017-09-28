/******************************************************************************************************************************
*                                        HyperLink Processor for HSP version 2.0.0 beta                                       *
*                                      Made by MikatoFu31(https://twitter.com/mikatofu31)                                     *
*                                                       on 2017.09.24                                                         *
/*****************************************************************************************************************************/



/*************************************************************�T�v*************************************************************
*                                                                                                                             *
*  ���̃��W���[���́AHSP�Ƀn�C�p�[�����N�ɂ��W�����v�@�\�𓋍ڂ��邱�Ƃ�⏕����c�[���ł��B�����N�̋�`���W��o�^���Ă���  *
*                             ���ƂŁA�N���b�N�ʒu���ǂ̃����N�ゾ�������𔻒肷�邱�Ƃ��ł��܂��B                            *
*                                                                                                                             *
/*****************************************************************************************************************************/



/*************************************************************����*************************************************************
*                             ���̃��W���[���̓x�[�^�łł��B�܂��o�O���c���Ă��邩������܂���B                              *
*                             �܂��A���̃��W���[���ɂ͂܂��ȉ��̎d�l������܂��B�����ӂ��������B                              *
*         �E��x�o�^�����n�C�p�[�����N��HLK_START�����s����܂ŕҏW�A�폜�ł��Ȃ�(�����ȃ����N�Ƃ��ď㏑���폜�͉\)         *
*                                      �E�n�C�p�[�����N��1024�܂ł����o�^�ł��Ȃ�                                            *
*    �E�����ɕ����̃E�B���h�E�ɑ΂��ăn�C�p�[�����N��ݒ�ł��Ȃ�(���̏����̓��W���[���O�̃X�N���v�g�ōs��Ȃ���΂Ȃ�Ȃ�)   *
/*****************************************************************************************************************************/



/***********************************************************�@�\����***********************************************************
*                                                                                                                             *
*      ���̃��W���[���́A�����N��o�^���Ă����A�}�E�X���W���ǂ̃����N�̏�ɂ��邩�𔻒肷��A�Ƃ����d�g�݂œ����Ă��܂��B     *
*                                                                                                                             *
*                                                                                                                             *
*  HLK_START                                                                                                                  *
*                                                                                                                             *
*    �����HLK���X�^�[�g���閽�߂ł��B�܂��A�o�^���������N������U�S���N���A���邱�Ƃɂ��g���܂��B                          *
*    HLK�����s����ꍇ�͕K����Ɏ��s���Ă��������B                                                                            *
*                                                                                                                             *
*                                                                                                                             *
*  HLK_ADD p1,p2,p3,p4,p5                                                                                                     *
*    p1 ... �����N��o�^����ID                                                                                                *
*    p2,p3 ... �����N�̋�`�̍�����W                                                                                         *
*    p4,p5 ... �����N�̋�`�̉E�����W                                                                                         *
*                                                                                                                             *
*    �����HLK�Ƀ����N��o�^���邽�߂̖��߂ł��B�����NID p1 ��(p2,p3)-(p4,p5)�̋�`��o�^���܂��B                             *
*                                                                                                                             *
*                                                                                                                             *
*  HLK_MOUSEONCHECK(p1,p2)                                                                                                    *
*    p1,p2 ... �}�E�X���W                                                                                                     *
*                                                                                                                             *
*    ����̓}�E�X���W���ǂ̃����N�̏�ɂ��邩�𒲂ׂ閽�߂ł��B�}�E�X���W(p1,p2)���AHLK_ADD�Őݒ肵�������N�̂ǂ�̏�ɂ��邩 *
*    �������܂��B                                                                                                             *
*                                                                                                                             *
*                                                                                                                             *
*  HLK2_ADD p1,p2,p3,p4,p5                                                                                                    *
*    p1 ... �����N �e�L�X�g                                                                                                   *
*    p2,p3 ... �����N�̋�`�̍�����W                                                                                         *
*    p4,p5 ... �����N�̋�`�̉E�����W                                                                                         *
*                                                                                                                             *
*    HLK2.0�Œǉ����ꂽ���߂ł��B�����N �e�L�X�g p1 ��    (p2,p3)-(p4,p5)�̋�`��o�^���܂��B                                 *
*    HLK1.0�p���߂ƕ��p���Ȃ����Ƃ𐄏����܂��B                                                                               *
*                                                                                                                             *
*                                                                                                                             *
*  HLK2_MOUSEONCHECK(p1,p2)                                                                                                   *
*    p1,p2 ... �}�E�X���W                                                                                                     *
*                                                                                                                             *
*     HLK2.0�Œǉ����ꂽ���߂ł��B�}�E�X���W(p1,p2)���AHLK_ADD�Őݒ肵�������N�̂ǂ�̏�ɂ��邩                              *
*    �������܂��BHLK_MOUSEONCHECK�ƈقȂ�Ԓl��������^�Ȃ̂Œ��ӂ��Ă��������B                                               *
*                                                                                                                             *
/*****************************************************************************************************************************/




/*************************************************�T�^�I�ȃT���v���X�N���v�g***************************************************
//�X�N���[���������B
screen 0,640,480

//HyperLink Processor �̏������������s���܂��B
HLK_START 640,480

//�����N�̕`���B(�ЂƂ�)
color 255,192,192:boxf 50,50,200,70:color 0,0,0:pos 50,50:mes "�ЂƂ߂̃����N"

//�����Ă��̗̈�������N�o�^�B
HLK2_ADD "��������",50,50,200,70

//�����N�̕`���B(�ӂ���)
color 255,192,192:boxf 300,200,450,220:color 0,0,0:pos 300,200:mes "�ӂ��߂̃����N"

//�����Ăӂ��߂������N�o�^�B
HLK2_ADD "�ɂ���",300,200,450,220

//�ǂ������N���b�N���ꂽ��W�����v�B
onclick goto *jump2

stop

*jump2

//�����N���N���b�N�����ꍇ�ɂǂ̃����N���N���b�N�������\�����܂��B
if HLK2_MOUSECHECK(mousex,mousey)!"":dialog HLK2_MOUSECHECK(mousex,mousey)+"��������܂���!"

stop
/***********************************************************�ݒ荀��**********************************************************/



///�v���v���Z�b�T�ݒ�(pre-processor settings)///

//�K�{�@�\(HLK_START HLK_ADD HLK_MOUSECLICK)�̃r���h�L�����؂�ւ� 0:�r���h���Ȃ� 1:�r���h����
#define enable_compile_hlp4h 1


//�I���@�\(�����_�Ŗ�����)�̃r���h�L�����؂�ւ� 0:�r���h���Ȃ� 1:�r���h����
#define enable_advanced_hlp 0


/*******************************************************���W���[���{��********************************************************/

#if enable_compile_hlp4h
	#module hyperlinkprocessor//���W���[�����̏d���ɂ͒��ӂ��Ă��������B
		#deffunc hlk_start int xwin,int ywin
			dim xwindow
			xwindow=xwin
			dim ywindow
			ywindow=ywin
			gsel 0
			dim hlk_id,1024
			dim hlk_left,1024
			dim hlk_right,1024
			dim hlk_up,1024
			dim hlk_down,1024
			sdim hlk_texts,65536,1024
			sdim hlk_returntext,65536
			
		return 0
		
		#deffunc hlk_add int hlkid,int left,int up,int right,int down
			if abs(hlkid)>=1024:return 21
			hlk_id(hlkid)=1
			hlk_left(hlkid)=left
			hlk_up(hlkid)=up
			hlk_right(hlkid)=right
			hlk_down(hlkid)=down
			
			
			
			
		return 0
		#defcfunc hlk_mousecheck int mousexon,int mouseyon
			counter=-1
			repeat 1024
				if hlk_id(cnt)=0:continue
				if hlk_left(cnt)<mousexon & hlk_right(cnt)>mousexon & hlk_up(cnt)<mouseyon & hlk_down(cnt)>mouseyon{
					counter=cnt
					break
				}
			loop
		
		return counter
		
		
		
		
		#deffunc hlk2_add str hlkstr,int left,int up,int right,int down
			repeat length(hlk_id)
				if hlk_id(cnt)=0{
					hlk_texts(cnt)=hlkstr
					hlk_id(cnt)=1
					hlk_left(cnt)=left
					hlk_up(cnt)=up
					hlk_right(cnt)=right
					hlk_down(cnt)=down
					break
				}
				
			loop
			
			
			
		return 0
		
		#defcfunc hlk2_mousecheck int mousexon,int mouseyon
			counter=-1
			hlk_returntext=""
			repeat 1024
				if hlk_id(cnt)=0:continue
				if hlk_left(cnt)<mousexon & hlk_right(cnt)>mousexon & hlk_up(cnt)<mouseyon & hlk_down(cnt)>mouseyon{
					counter=cnt
					break
				}
			loop
		if counter!-1:hlk_returntext=hlk_texts(counter)
		return hlk_returntext
		
		
	#global
	
#endif


/*****************************************************************************************************************************/

