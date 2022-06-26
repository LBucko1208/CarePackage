﻿pkl_showHelpImage( activate = 0 )
{
;;  EPKL: Added and reworked help image functionality
;;      - Separate background image and Shift/AltGr indicator overlay, configurable in layout.ini
;;      - Transparent color for images (may work for the GUI window vs underlying windows now?)
;;      - Overall image opacity
;;      - Six positions with adjustable screen gutters and right/left push in addition to up/down
;;      - Rescaling by hotkey
;;  
;;  Parameter values:
;;   0 = display, if activated earlier
;;   1 = activate
;;  -1 = deactivate
;;   2 = toggle
;;   3 = suspend on
;;   4 = suspend off
;;   5 = zoom in/out
;;   6 = move between positions
;;  
	
	static im           := {} 		; Only one static now. But: Not compatible with %var% notation!
;	static im.Active    := 0 		; Whether the GUI is currently active; needed for toggling etc
;	static im.ActiveBeforeSuspend := 0
;	static im.Prev 					; The previous image file; if it hasn't changed, don't redraw
;	static im.PosXs     := []
;	static im.PosYs     := []
;	static im.PosNr     := 5 		; Default image position is bottom center (used to be "xCenter")
;	static im.Zooms     := [] 		; Default [ 100, 150 ]
;	static im.ZoomNr    := 1
;	static im.Mrg       := [] 		; [ left, right, top, low, HorzPushPx ] image margins/gutters
;	static im.HorZone 				; Part of image width that activates horizontal push, in %
;	static im.LayDir
;	static im.BgPath 				; Background image file
;	static im.ShRoot 				; Shift image directory
;	static im.BgColor 				; Image GUI background color is set from the (base)layout.ini
;	static im.Opacity 				; Global image opacity: 0 is invisible, 255 opaque
	static imgX 					; Keep these for %var% use with the Gui commands
	static imgY
	static imgW
	static imgH
	static CtrlImage 				; Image control handle
	static CtrlBgImg 				; --"--
	static CtrlShImg 				; --"--
	static initialized  := false
	
	if ( not initialized ) 															; First-time initialization
	{
		im.LayDir   := getLayInfo( "Dir_LayIni" )
		im.BgPath  := fileOrAlt( pklIniRead( "img_bgImage"  ,,  "LayStk" ) 
								, im.LayDir . "\backgr.png"              ) 	; BG image, if found
		im.ShRoot  := fileOrAlt( pklIniRead( "img_shftDir"  ,,  "LayStk" ) 
								, im.LayDir . "\ModStateImg"             ) 	; Shift state images
		im.BgColor  := pklIniRead( "img_bgColor"  , "333333",   "LayStk" ) 	; BG color (was fefeff)
		im.Opacity  := pklIniRead( "img_opacity"  , 255         )
		im.PosNr    := 5 													; Default position is bottom center (used to be "xCenter")
		im.Zooms    := pklIniCSVs( "img_zooms"    , "100,150"   )
		im.ZoomNr   := 1
		imgSizeWH   := pklIniCSVs( "img_sizeWH"   , "541,188",  "LayStk" ) 	; Image size in px, given as Width,Height
		img_Scale   := pklIniRead( "img_scale"    , 100      ,  "LayStk" ) 	; Image scale factor, in % (may be float)
		im.Width_   := Ceil( img_Scale * imgSizeWH[1] / 100 )
		im.Height   := Ceil( img_Scale * imgSizeWH[2] / 100 )
		im.Width_   := ( im.Width_ ) ? im.Width_ : pklIniRead( "img_width" , 460, "LayIni", "global" ) 	; The old PKL had sizes in [global]
		im.Height   := ( im.Height ) ? im.Height : pklIniRead( "img_height", 160, "LayIni", "global" ) 	; --"--
		im.HorZone  := pklIniRead( "img_horZone"  , 20 ) 					; % of width that activates horizontal push - stored as a margin
		im.Mrg      := pklIniCSVs( "img_mrg_lrtb" , "2,2,2,42" ) 			; [ Left, Right, Top, Bottom ] image margins, in px
;		im.Mrg.Push( 0 ) 													; [5]: The horz. push zone in px will be set/rescaled later
		scaleImage  := 1 													; Request an image scaling before drawing it below
		initialized := true
	}	; end first-time initialization
	
	if ( activate == 2 ) 			; Toggle
		activate    := 1 - 2 * im.Active
	if ( activate == 1 ) { 			; Activate
		im.Active   := 1
	} else if ( activate == -1 ) { 	; Deactivate
		im.Active   := 0
	} else if ( activate == 3 ) { 	; Suspend on
		im.ActiveBeforeSuspend := im.Active
		activate    := -1
		im.Active   := 0
	} else if ( activate == 4 ) { 	; Suspend off
		if ( im.ActiveBeforeSuspend == 1 && im.Active != 1) {
			activate    := 1
			im.Active   := 1
		}
	} else if ( activate == 5 ) { 	; Zoom in/out
		if ( ++im.ZoomNr > im.Zooms.maxIndex() )
			im.ZoomNr := 1
		scaleImage := 1
	} else if ( activate == 6 ) { 	; Move image +1 position
		if ( ++im.PosNr > 6 )
			im.PosNr := 1
		scaleImage := 1
	}
	state := _GetState()
	
	if ( activate == 1 ) { 												; Activate the help image
		Menu, Tray, Check, % getPklInfo( "LocStr_ShowHelpImgMenu" ) 	; Tick off the Show Help Image menu item
		Gui, 2:New, +AlwaysOnTop -Border -Caption +ToolWindow 			; Create GUI 2 for the images
					+LastFound +Owner, 				pklImgWin 			; Owner removes the task bar button?
		Gui, 2:Margin, 0, 0
		Gui, 2:Color, % im.BgColor
		if ( im.Opacity > 0 && im.Opacity < 256 ) {
			WinSet, Transparent, % im.Opacity
		} else if ( im.Opacity == -1 ) {
			WinSet, TransColor, % im.BgColor, pklImgWin
		} 				; eD NOTE: Seems that vVv got transparent color to work with separate GUIs for front/back?
		Gui, 2: Add, Pic, xm +BackgroundTrans vCtrlBgImg AltSubmit 		; Make image controls stored in Help##### variables
		Gui, 2: Add, Pic, xm +BackgroundTrans vCtrlImage AltSubmit
		Gui, 2: Add, Pic, xm +BackgroundTrans vCtrlShImg AltSubmit
		Gui, 2: Show, NA, 							pklImgWin 			; eD WIP: Try to avoid the task bar?!
		
		SetTimer, showHelpImage, 100 									; Refresh the help image every 0.2 s 	; eD WIP: Trying a faster refresh rate, to hopefully increase precision. Helps DKs, but not Tap-Ext?
	} else if ( activate == -1 ) { 										; Deactivate image
		Menu, Tray, UnCheck, % getPklInfo( "LocStr_ShowHelpImgMenu" )
		SetTimer, showHelpImage, Off
		Gui, 2:Destroy
		Return
	}
	if ( im.Active == 0 )
		Return
	
	CoordMode, Mouse, Screen 											; Mousing over the image pushes it away
	MouseGetPos, mouseX, , id
	WinGetTitle, title, ahk_id %id%
	if ( title == "pklImgWin" ) {
		if ( mouseX - imgX < im.Mrg[5] ) {
			im.PosNr := ( im.PosNr = 6 ) ? 1 : ++im.PosNr 				; Right (with wrap)
		} else if ( mouseX - imgX > imgW - im.Mrg[5] ) {
			im.PosNr := ( im.PosNr = 1 ) ? 6 : --im.PosNr 				; Left   --"--
		} else {
			im.PosNr := ( im.PosNr > 3 ) ? im.PosNr - 3 : im.PosNr + 3	; Top/Bottom
		}
		scaleImage := 1
	}
	
	if getKeyInfo( "CurrNumOfDKs" ) { 									; DeadKey image
		thisDK  := getLayInfo( "dkImgDir" ) . "\" . getKeyInfo( "CurrNameOfDK" )
		ssuf    := getLayInfo( "dkImgSuf" )								; DK image state suffix
		dkS     := []
		dkS0    := ( ssuf ) ? ssuf . "0.png" :   ".png"					; Img file state 0 suffix
		dkS[1]  := ( ssuf ) ? ssuf . "1.png" : "sh.png"					; Img file state 1 suffix
		for ix, st in [ 6, 7, 8, 9 ] {									; Loop through the remaining states
			dkS[ st ] := ssuf . st . ".png"
		}	; eD TOFIX: A state6 img w/ a state6 DK sometimes seems to break DK img display if we're too fast?
		imgPath := thisDK . dkS0
		imgPath := ( state ) ? fileOrAlt( thisDK . dkS[state], imgPath ) : imgPath
	} else if ExtendIsPressed() { 										; Extend image
		imgPath := getLayInfo( "extendImg" )							; Default im.LayDir . "\extend.png"
	} else {															; Shift state image
		imgPath := im.LayDir . "\state" . state . ".png"
	}
	imgPath := FileExist( imgPath ) ? imgPath : im.LayDir . "\state0.png" 	; The fallback image is state0
	
	if ( scaleImage ) {
		imgW        := Ceil( im.Width_ * im.Zooms[ im.ZoomNr ] / 100 )
		imgH        := Ceil( im.Height * im.Zooms[ im.ZoomNr ] / 100 )
		im.Mrg[5]   := Floor( imgW * im.HorZone / 100 ) 				; Horz. push zone, in px
		imgHorPos := [ im.Mrg[1], ( A_ScreenWidth - imgW )/2, A_ScreenWidth  - imgW - im.Mrg[2] ]	; Left/Mid/Right
		imgVerPos := [ im.Mrg[3],                             A_ScreenHeight - imgH - im.Mrg[4] ]	; Top/bottom
		Loop % 6 {
			im.PosXs[ A_Index ] := imgHorPos[ 1 + Mod( ( A_Index - 1 ) , 3 ) ]
			im.PosYs[ A_Index ] := imgVerPos[ Ceil( A_Index / 3 ) ]
		}
		imgX    := im.PosXs[ im.PosNr ]
		imgY    := im.PosYs[ im.PosNr ]
	} else if ( im.Prev == imgPath ) && ( ! activate ) {
		Return 															; Only redraw the images if they changed
	}
	im.Prev     := imgPath
	
	imgBgPath   := im.BgPath
	imgShPath   := im.ShRoot . "\state" . state . ".png"
	GuiControl, 2:, CtrlBgImg, *w%imgW% *h%imgH% %imgBgPath%
	GuiControl, 2:, CtrlImage, *w%imgW% *h%imgH% %imgPath%
	GuiControl, 2:, CtrlShImg, *w%imgW% *h%imgH% %imgShPath%
	Gui, 2: Show, x%imgX% y%imgY% AutoSize NA, 		pklImgWin 			; Use AutoSize NA to avoid stealing focus
}

_GetState() 															; Get the 0:1:6:7 shift state as in layout.ini and img names
{
	state = 0
	state += 1 * getKeyState( "Shift" )
;	state += 2 * getKeyState( "Ctrl" )
	state += 6 * getLayInfo( "LayHasAltGr" ) * AltGrIsPressed()
	Return state
}
