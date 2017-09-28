/******************************************************************************************************************************
*                                        HyperLink Processor for HSP version 2.0.0 beta                                       *
*                                      Made by MikatoFu31(https://twitter.com/mikatofu31)                                     *
*                                                       on 2017.09.24                                                         *
/*****************************************************************************************************************************/



/*************************************************************概要*************************************************************
*                                                                                                                             *
*  このモジュールは、HSPにハイパーリンクによるジャンプ機能を搭載することを補助するツールです。リンクの矩形座標を登録しておく  *
*                             ことで、クリック位置がどのリンク上だったかを判定することができます。                            *
*                                                                                                                             *
/*****************************************************************************************************************************/



/*************************************************************注意*************************************************************
*                             このモジュールはベータ版です。まだバグが残っているかもしれません。                              *
*                             また、このモジュールにはまだ以下の仕様があります。ご注意ください。                              *
*         ・一度登録したハイパーリンクはHLK_STARTを実行するまで編集、削除できない(無効なリンクとして上書き削除は可能)         *
*                                      ・ハイパーリンクは1024個までしか登録できない                                            *
*    ・同時に複数のウィンドウに対してハイパーリンクを設定できない(この処理はモジュール外のスクリプトで行わなければならない)   *
/*****************************************************************************************************************************/



/***********************************************************機能説明***********************************************************
*                                                                                                                             *
*      このモジュールは、リンクを登録しておき、マウス座標がどのリンクの上にあるかを判定する、という仕組みで動いています。     *
*                                                                                                                             *
*                                                                                                                             *
*  HLK_START                                                                                                                  *
*                                                                                                                             *
*    これはHLKをスタートする命令です。また、登録したリンク情報を一旦全部クリアすることにも使えます。                          *
*    HLKを実行する場合は必ず先に実行してください。                                                                            *
*                                                                                                                             *
*                                                                                                                             *
*  HLK_ADD p1,p2,p3,p4,p5                                                                                                     *
*    p1 ... リンクを登録するID                                                                                                *
*    p2,p3 ... リンクの矩形の左上座標                                                                                         *
*    p4,p5 ... リンクの矩形の右下座標                                                                                         *
*                                                                                                                             *
*    これはHLKにリンクを登録するための命令です。リンクID p1 に(p2,p3)-(p4,p5)の矩形を登録します。                             *
*                                                                                                                             *
*                                                                                                                             *
*  HLK_MOUSEONCHECK(p1,p2)                                                                                                    *
*    p1,p2 ... マウス座標                                                                                                     *
*                                                                                                                             *
*    これはマウス座標がどのリンクの上にあるかを調べる命令です。マウス座標(p1,p2)が、HLK_ADDで設定したリンクのどれの上にいるか *
*    調査します。                                                                                                             *
*                                                                                                                             *
*                                                                                                                             *
*  HLK2_ADD p1,p2,p3,p4,p5                                                                                                    *
*    p1 ... リンク テキスト                                                                                                   *
*    p2,p3 ... リンクの矩形の左上座標                                                                                         *
*    p4,p5 ... リンクの矩形の右下座標                                                                                         *
*                                                                                                                             *
*    HLK2.0で追加された命令です。リンク テキスト p1 に    (p2,p3)-(p4,p5)の矩形を登録します。                                 *
*    HLK1.0用命令と併用しないことを推奨します。                                                                               *
*                                                                                                                             *
*                                                                                                                             *
*  HLK2_MOUSEONCHECK(p1,p2)                                                                                                   *
*    p1,p2 ... マウス座標                                                                                                     *
*                                                                                                                             *
*     HLK2.0で追加された命令です。マウス座標(p1,p2)が、HLK_ADDで設定したリンクのどれの上にいるか                              *
*    調査します。HLK_MOUSEONCHECKと異なり返値が文字列型なので注意してください。                                               *
*                                                                                                                             *
/*****************************************************************************************************************************/




/*************************************************典型的なサンプルスクリプト***************************************************
//スクリーン初期化。
screen 0,640,480

//HyperLink Processor の初期化処理を行います。
HLK_START 640,480

//リンクの描画例。(ひとつめ)
color 255,192,192:boxf 50,50,200,70:color 0,0,0:pos 50,50:mes "ひとつめのリンク"

//そしてその領域をリンク登録。
HLK2_ADD "いっこめ",50,50,200,70

//リンクの描画例。(ふたつめ)
color 255,192,192:boxf 300,200,450,220:color 0,0,0:pos 300,200:mes "ふたつめのリンク"

//そしてふたつめもリンク登録。
HLK2_ADD "にこめ",300,200,450,220

//どこかがクリックされたらジャンプ。
onclick goto *jump2

stop

*jump2

//リンクをクリックした場合にどのリンクをクリックしたか表示します。
if HLK2_MOUSECHECK(mousex,mousey)!"":dialog HLK2_MOUSECHECK(mousex,mousey)+"がおされました!"

stop
/***********************************************************設定項目**********************************************************/



///プリプロセッサ設定(pre-processor settings)///

//必須機能(HLK_START HLK_ADD HLK_MOUSECLICK)のビルド有効化切り替え 0:ビルドしない 1:ビルドする
#define enable_compile_hlp4h 1


//選択機能(現時点で未実装)のビルド有効化切り替え 0:ビルドしない 1:ビルドする
#define enable_advanced_hlp 0


/*******************************************************モジュール本体********************************************************/

#if enable_compile_hlp4h
	#module hyperlinkprocessor//モジュール名の重複には注意してください。
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

