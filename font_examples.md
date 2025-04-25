# All Supported Fonts
## 1Row
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "1Row" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|-[-||() \/\()?||)</span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "1Row" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|-| [- |_ |_ ()   \/\/ () /? |_ |)</span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════╝</span>
```
## 3-D
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3-D" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> **      **         ** **                  **       **                 **      ** **</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**        /**/**                 /**      /**                /**     /**/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**  ***** /**/**  ******         /**   *  /**  ******  ******/**     /**/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/********** **///**/**/** **////**        /**  *** /** **////**//**//*/**  ******/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**//////**/*******/**/**/**   /**        /** **/**/**/**   /** /** / /** **///**/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**/**//// /**/**/**   /****      /**** //****/**   /** /**   /**/**  /**// </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**//************//******//*      /**/   ///**//****** /***   ***//****** **</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">//      //  ////////////  //////  /       //       //  //////  ///   ///  ////// // </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3-D" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> **      **          **  **                   **       **                  **      ** **</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**         /** /**                  /**      /**                 /**     /**/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**  *****  /** /**  ******          /**   *  /**  ******  ****** /**     /**/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/********** **///** /** /** **////**         /**  *** /** **////**//**//* /**  ******/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**//////**/******* /** /**/**   /**         /** **/**/**/**   /** /** /  /** **///**/**</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**/**////  /** /**/**   /** **      /**** //****/**   /** /**    /**/**  /**// </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/**     /**//****** *** ***//****** //*      /**/   ///**//****** /***    ***//****** **</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">//      //  ////// /// ///  //////   /       //       //  //////  ///    ///  ////// // </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## 3D Diagonal
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3D Diagonal" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                                                                                      ,---,  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        ,--,                                                                                                       ,`--.' |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      ,--.'|            ,--,    ,--,                                   .---.                     ,--,              |   :  :  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   ,--,  | :          ,--.'|  ,--.'|                                  /. ./|                   ,--.'|         ,---,'   '  ;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">,---.'|  : '          |  | :  |  | :     ,---.                    .--'.  ' ;   ,---.    __  ,-.|  | :       ,---.'||   |  |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | : _' |          :  : '  :  : '    '   ,'\                  /__./ \ : |  '   ,'\ ,' ,'/ /|:  : '       |   | :'   :  ;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:   : |.'  |   ,---.  |  ' |  |  ' |   /   /   |             .--'.  '   \' . /   /   |'  | |' ||  ' |       |   | ||   |  '  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   ' '  ; :  /     \ '  | |  '  | |  .   ; ,. :            /___/ \ |    ' '.   ; ,. :|  |   ,''  | |     ,--.__| |'   :  |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">'   |  .'. | /    /  ||  | :  |  | :  '   | |: :            ;   \  \;      :'   | |: :'  :  /  |  | :    /   ,'   |;   |  ;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | :  | '.    ' / |'  : |__'  : |__'   | .; :             \   ;  `      |'   | .; :|  | '   '  : |__ .   '  /  |`---'. |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">'   : |  : ;'   ;   /||  | '.'|  | '.'|   :    |              .   \    .\  ;|   :    |;  : |   |  | '.'|'   ; |:  | `--..`;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | '  ,/ '   |  / |;  :    ;  :    ;\   \  /___             \   \   ' \ | \   \  / |  , ;   ;  :    ;|   | '/  '.--,_     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">;   : ;--'  |   :    ||  ,   /|  ,   /  `----'/  .\             :   '  |--"   `----'   ---'    |  ,   / |   :    :||    |`.  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   ,/       \   \  /  ---`-'  ---`-'         \_ ; |             \   \ ;                        ---`-'   \   \  /  `-- -`, ; </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">'---'         `----'                          /  ,"               '---"                                   `----'     '---`"  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                             '--'                                                                            </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3D Diagonal" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                                                                                                      ,---,  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        ,--,                                                                                                                       ,`--.' |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      ,--.'|              ,--,      ,--,                                          .---.                        ,--,                |   :  :  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   ,--,  | :            ,--.'|    ,--.'|                                         /. ./|                      ,--.'|          ,---, '   '  ;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">,---.'|  : '            |  | :    |  | :       ,---.                         .--'.  ' ;    ,---.     __  ,-. |  | :        ,---.'| |   |  |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | : _' |            :  : '    :  : '      '   ,'\                       /__./ \ : |   '   ,'\  ,' ,'/ /| :  : '        |   | : '   :  ;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:   : |.'  |    ,---.   |  ' |    |  ' |     /   /   |                  .--'.  '   \' .  /   /   | '  | |' | |  ' |        |   | | |   |  '  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   ' '  ; :   /     \  '  | |    '  | |    .   ; ,. :                 /___/ \ |    ' ' .   ; ,. : |  |   ,' '  | |      ,--.__| | '   :  |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">'   |  .'. |  /    /  | |  | :    |  | :    '   | |: :                 ;   \  \;      : '   | |: : '  :  /   |  | :     /   ,'   | ;   |  ;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | :  | ' .    ' / | '  : |__  '  : |__  '   | .; :                  \   ;  `      | '   | .; : |  | '    '  : |__  .   '  /  | `---'. |  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">'   : |  : ; '   ;   /| |  | '.'| |  | '.'| |   :    |                   .   \    .\  ; |   :    | ;  : |    |  | '.'| '   ; |:  |  `--..`;  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | '  ,/  '   |  / | ;  :    ; ;  :    ;  \   \  /    ___              \   \   ' \ |  \   \  /  |  , ;    ;  :    ; |   | '/  ' .--,_     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">;   : ;--'   |   :    | |  ,   /  |  ,   /    `----'    /  .\              :   '  |--"    `----'    ---'     |  ,   /  |   :    :| |    |`.  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   ,/        \   \  /   ---`-'    ---`-'               \_ ; |              \   \ ;                           ---`-'    \   \  /   `-- -`, ; </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">'---'          `----'                                   /  ,"                '---"                                       `----'      '---`"  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                       '--'                                                                                  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## 3D-ASCII
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3D-ASCII" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> ___  ___  _______   ___       ___       ________                ___       __   ________  ________  ___       ________  ___       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|\  \|\  \|\  ___ \ |\  \     |\  \     |\   __  \              |\  \     |\  \|\   __  \|\   __  \|\  \     |\   ___ \|\  \      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">\ \  \\\  \ \   __/|\ \  \    \ \  \    \ \  \|\  \             \ \  \    \ \  \ \  \|\  \ \  \|\  \ \  \    \ \  \_|\ \ \  \     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> \ \   __  \ \  \_|/_\ \  \    \ \  \    \ \  \\\  \  ___        \ \  \  __\ \  \ \  \\\  \ \   _  _\ \  \    \ \  \ \\ \ \  \    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  \ \  \ \  \ \  \_|\ \ \  \____\ \  \____\ \  \\\  \|\  \        \ \  \|\__\_\  \ \  \\\  \ \  \\  \\ \  \____\ \  \_\\ \ \__\   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   \ \__\ \__\ \_______\ \_______\ \_______\ \_______\ \  \        \ \____________\ \_______\ \__\\ _\\ \_______\ \_______\|__|   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    \|__|\|__|\|_______|\|_______|\|_______|\|_______|\/  /|        \|____________|\|_______|\|__|\|__|\|_______|\|_______|   ___ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                    |\___/ /                                                                 |\__\</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                    \|___|/                                                                  \|__|</span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3D-ASCII" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> ___  ___      _______       ___           ___           ________                   ___       __       ________      ________      ___          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|\  \|\  \    |\  ___ \     |\  \         |\  \         |\   __  \                 |\  \     |\  \    |\   __  \    |\   __  \    |\  \         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">\ \  \\\  \   \ \   __/|    \ \  \        \ \  \        \ \  \|\  \                \ \  \    \ \  \   \ \  \|\  \   \ \  \|\  \   \ \  \        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> \ \   __  \   \ \  \_|/__   \ \  \        \ \  \        \ \  \\\  \     ___        \ \  \  __\ \  \   \ \  \\\  \   \ \   _  _\   \ \  \       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  \ \  \ \  \   \ \  \_|\ \   \ \  \____    \ \  \____    \ \  \\\  \   |\  \        \ \  \|\__\_\  \   \ \  \\\  \   \ \  \\  \|   \ \  \____  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   \ \__\ \__\   \ \_______\   \ \_______\   \ \_______\   \ \_______\  \ \  \        \ \____________\   \ \_______\   \ \__\\ _\    \ \_______\</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    \|__|\|__|    \|_______|    \|_______|    \|_______|    \|_______|  _\/  /|        \|____________|    \|_______|    \|__|\|__|    \|_______|</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                                       \|___|/                                                                  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                                                                                                                </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> ________      ___                                                                                                                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|\   ___ \    |\  \                                                                                                                             </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">\ \  \_|\ \   \ \  \                                                                                                                            </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> \ \  \ \\ \   \ \  \                                                                                                                           </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  \ \  \_\\ \   \ \__\                                                                                                                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   \ \_______\   \|__|                                                                                                                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    \|_______|       ___                                                                                                                        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                    |\__\                                                                                                                       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                    \|__|                                                                                                                       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## 3x5
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3x5" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># # ##  # #   #  #  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># ####### ########  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">####### ### # ## #  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># ########### ####  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># #    ## #      #  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "3x5" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```

<span style="color: yellow;">╔════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># #      #   #              # #          #    #  #  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># # ###  #   #  ###         # # ### ###  #  ###  #  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">### ##   #   #  # #         ### # # #    #  # #  #  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># # ###  ##  ## ###  #      ### ### #    ## ###     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"># #                 #       # #                  #  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════╝</span>

## 4Max
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "4Max" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">88  88 888888 88     88      dP"Yb          Yb        dP  dP"Yb  88""Yb 88     8888b.  d8b </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">88  88 88__   88     88     dP   Yb          Yb  db  dP  dP   Yb 88__dP 88      8I  Yb Y8P </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">888888 88""   88  .o 88  .o Yb   dP  .o.      YbdPYbdP   Yb   dP 88"Yb  88  .o  8I  dY `"' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">88  88 888888 88ood8 88ood8  YbodP  ,dP'       YP  YP     YbodP  88  Yb 88ood8 8888Y"  (8) </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "4Max" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">88  88 888888 88     88      dP"Yb           Yb        dP  dP"Yb  88""Yb 88     8888b.  d8b </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">88  88 88__   88     88     dP   Yb           Yb  db  dP  dP   Yb 88__dP 88      8I  Yb Y8P </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">888888 88""   88  .o 88  .o Yb   dP  .o.       YbdPYbdP   Yb   dP 88"Yb  88  .o  8I  dY `"' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">88  88 888888 88ood8 88ood8  YbodP  ,dP'        YP  YP     YbodP  88  Yb 88ood8 8888Y"  (8) </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## 5 Line Oblique
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "5 Line Oblique" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                                                    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    //    / /                         ||   / |  / /                              // </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   //___ / /  ___     // //  ___      ||  /  | / /  ___      __     //  ___   / //  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  / ___   / //___) ) // // //   ) )   || / /||/ / //   ) ) //  ) ) // //   ) / //   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> //    / / //       // // //   / /    ||/ / |  / //   / / //      // //   / /       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">//    / / ((____   // // ((___/ / //  |  /  | / ((___/ / //      // ((___/ / //     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "5 Line Oblique" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                                                                                      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    //    / /                                           ||   / |  / /                                              // </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   //___ / /      ___       //     //      ___          ||  /  | / /      ___        __       //      ___   /     //  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  / ___   /     //___) )   //     //     //   ) )       || / /||/ /     //   ) )   //  ) )   //     //   ) /     //   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> //    / /     //         //     //     //   / /        ||/ / |  /     //   / /   //        //     //   / /           </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">//    / /     ((____     //     //     ((___/ /    //   |  /  | /     ((___/ /   //        //     ((___/ /     //     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## Acrobatic
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Acrobatic" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  o         o               o   o                        o              o                         o          o    o   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> <|>       <|>             <|> <|>                      <|>            <|>                       <|>        <|>  <|>  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> < >       < >             / \ / \                      / \            / \                       / \        < \  / \  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  |         |    o__  __o  \o/ \o/   o__ __o            \o/            \o/   o__ __o   \o__ __o  \o/   o__ __o/  \o/  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  o__/_ _\__o   /v      |>  |   |   /v     v\            |              |   /v     v\   |     |>  |   /v     |    |   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  |         |  />      //  / \ / \ />       <\          < >            < > />       <\ / \   < > / \ />     / \  < >  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> <o>       <o> \o    o/    \o/ \o/ \         /    o      \o    o/\o    o/  \         / \o/       \o/ \      \o/       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  |         |   v\  /v __o  |   |   o       o    <|>      v\  /v  v\  /v    o       o   |         |   o      |    o   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> / \       / \   <\/> __/> / \ / \  <\__ __/>    < >       <\/>    <\/>     <\__ __/>  / \       / \  <\__  / \ _<|>_ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                 o/                                                                   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                /v                                                                    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                               />                                                                     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Acrobatic" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  o         o                 o    o                            o              o                            o           o     o   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> <|>       <|>               <|>  <|>                          <|>            <|>                          <|>         <|>   <|>  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> < >       < >               / \  / \                          / \            / \                          / \         < \   / \  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  |         |     o__  __o   \o/  \o/    o__ __o               \o/            \o/    o__ __o    \o__ __o   \o/    o__ __o/   \o/  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  o__/_ _\__o    /v      |>   |    |    /v     v\               |              |    /v     v\    |     |>   |    /v     |     |   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  |         |   />      //   / \  / \  />       <\             < >            < >  />       <\  / \   < >  / \  />     / \   < >  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> <o>       <o>  \o    o/     \o/  \o/  \         /     o        \o    o/\o    o/   \         /  \o/        \o/  \      \o/        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  |         |    v\  /v __o   |    |    o       o     <|>        v\  /v  v\  /v     o       o    |          |    o      |     o   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> / \       / \    <\/> __/>  / \  / \   <\__ __/>     < >         <\/>    <\/>      <\__ __/>   / \        / \   <\__  / \  _<|>_ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                      o/                                                                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                     /v                                                                           </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                    />                                                                            </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## Alligator
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alligator" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      :::    ::: :::::::::: :::        :::        ::::::::            :::       :::  ::::::::  :::::::::  :::        :::::::::  ::: </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     :+:    :+: :+:        :+:        :+:       :+:    :+:           :+:       :+: :+:    :+: :+:    :+: :+:        :+:    :+: :+:  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    +:+    +:+ +:+        +:+        +:+       +:+    +:+           +:+       +:+ +:+    +:+ +:+    +:+ +:+        +:+    +:+ +:+   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   +#++:++#++ +#++:++#   +#+        +#+       +#+    +:+           +#+  +:+  +#+ +#+    +:+ +#++:++#:  +#+        +#+    +:+ +#+    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  +#+    +#+ +#+        +#+        +#+       +#+    +#+           +#+ +#+#+ +#+ +#+    +#+ +#+    +#+ +#+        +#+    +#+ +#+     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> #+#    #+# #+#        #+#        #+#       #+#    #+# #+#        #+#+# #+#+#  #+#    #+# #+#    #+# #+#        #+#    #+#          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">###    ### ########## ########## ########## ########  ##          ###   ###    ########  ###    ### ########## #########  ###       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alligator" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      :::    :::       ::::::::::       :::        :::        ::::::::                  :::       :::       ::::::::       :::::::::       :::  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     :+:    :+:       :+:              :+:        :+:       :+:    :+:                 :+:       :+:      :+:    :+:      :+:    :+:      :+:   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    +:+    +:+       +:+              +:+        +:+       +:+    +:+                 +:+       +:+      +:+    +:+      +:+    +:+      +:+    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   +#++:++#++       +#++:++#         +#+        +#+       +#+    +:+                 +#+  +:+  +#+      +#+    +:+      +#++:++#:       +#+     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  +#+    +#+       +#+              +#+        +#+       +#+    +#+                 +#+ +#+#+ +#+      +#+    +#+      +#+    +#+      +#+      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> #+#    #+#       #+#              #+#        #+#       #+#    #+#      #+#         #+#+# #+#+#       #+#    #+#      #+#    #+#      #+#       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">###    ###       ##########       ########## ########## ########       ##           ###   ###         ########       ###    ###      ########## </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      :::::::::       :::                                                                                                                       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     :+:    :+:      :+:                                                                                                                        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    +:+    +:+      +:+                                                                                                                         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   +#+    +:+      +#+                                                                                                                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  +#+    +#+      +#+                                                                                                                           </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> #+#    #+#                                                                                                                                     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">#########       ###                                                                                                                             </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## Alligator2
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alligator2" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:::    ::: :::::::::: :::        :::        ::::::::           :::       :::  ::::::::  :::::::::  :::        :::::::::  ::: </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:+:    :+: :+:        :+:        :+:       :+:    :+:          :+:       :+: :+:    :+: :+:    :+: :+:        :+:    :+: :+: </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">+:+    +:+ +:+        +:+        +:+       +:+    +:+          +:+       +:+ +:+    +:+ +:+    +:+ +:+        +:+    +:+ +:+ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">+#++:++#++ +#++:++#   +#+        +#+       +#+    +:+          +#+  +:+  +#+ +#+    +:+ +#++:++#:  +#+        +#+    +:+ +#+ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">+#+    +#+ +#+        +#+        +#+       +#+    +#+          +#+ +#+#+ +#+ +#+    +#+ +#+    +#+ +#+        +#+    +#+ +#+ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">#+#    #+# #+#        #+#        #+#       #+#    #+# #+#       #+#+# #+#+#  #+#    #+# #+#    #+# #+#        #+#    #+#     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">###    ### ########## ########## ########## ########  ##         ###   ###    ########  ###    ### ########## #########  ### </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alligator2" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:::    ::: :::::::::: :::        :::         ::::::::            :::       :::  ::::::::  :::::::::  :::        :::::::::  ::: </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:+:    :+: :+:        :+:        :+:        :+:    :+:           :+:       :+: :+:    :+: :+:    :+: :+:        :+:    :+: :+: </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">+:+    +:+ +:+        +:+        +:+        +:+    +:+           +:+       +:+ +:+    +:+ +:+    +:+ +:+        +:+    +:+ +:+ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">+#++:++#++ +#++:++#   +#+        +#+        +#+    +:+           +#+  +:+  +#+ +#+    +:+ +#++:++#:  +#+        +#+    +:+ +#+ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">+#+    +#+ +#+        +#+        +#+        +#+    +#+           +#+ +#+#+ +#+ +#+    +#+ +#+    +#+ +#+        +#+    +#+ +#+ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">#+#    #+# #+#        #+#        #+#        #+#    #+# #+#        #+#+# #+#+#  #+#    #+# #+#    #+# #+#        #+#    #+#     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">###    ### ########## ########## ##########  ########  ##          ###   ###    ########  ###    ### ########## #########  ### </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## Alpha
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alpha" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">          _____                   _____                   _____    _____    _______                           _____                  _______         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         /\    \                 /\    \                 /\    \  /\    \  /::\    \                         /\    \                /::\    \        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        /::\____\               /::\    \               /::\____\/::\____\/::::\    \                       /::\____\              /::::\    \       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       /:::/    /              /::::\    \             /:::/    /:::/    /::::::\    \                     /:::/    /             /::::::\    \      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      /:::/    /              /::::::\    \           /:::/    /:::/    /::::::::\    \                   /:::/   _/___          /::::::::\    \     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     /:::/    /              /:::/\:::\    \         /:::/    /:::/    /:::/~~\:::\    \                 /:::/   /\    \        /:::/~~\:::\    \    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    /:::/____/              /:::/__\:::\    \       /:::/    /:::/    /:::/    \:::\    \               /:::/   /::\____\      /:::/    \:::\    \   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   /::::\    \             /::::\   \:::\    \     /:::/    /:::/    /:::/    / \:::\    \             /:::/   /:::/    /     /:::/    / \:::\    \  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  /::::::\    \   _____   /::::::\   \:::\    \   /:::/    /:::/    /:::/____/   \:::\____\           /:::/   /:::/   _/___  /:::/____/   \:::\____\ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> /:::/\:::\    \ /\    \ /:::/\:::\   \:::\    \ /:::/    /:::/    /:::|    |     |:::|    |         /:::/___/:::/   /\    \|:::|    |     |:::|    |</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/:::/  \:::\    /::\____\:::/__\:::\   \:::\____\:::/____/:::/____/|:::|____|     |:::|    |        |:::|   /:::/   /::\____\:::|____|     |:::|    |</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">\::/    \:::\  /:::/    \:::\   \:::\   \::/    \:::\    \:::\    \ \:::\    \   /:::/    /         |:::|__/:::/   /:::/    /\:::\    \   /:::/    / </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> \/____/ \:::\/:::/    / \:::\   \:::\   \/____/ \:::\    \:::\    \ \:::\    \ /:::/    /           \:::\/:::/   /:::/    /  \:::\    \ /:::/    /  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">          \::::::/    /   \:::\   \:::\    \      \:::\    \:::\    \ \:::\    /:::/    /             \::::::/   /:::/    /    \:::\    /:::/    /   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">           \::::/    /     \:::\   \:::\____\      \:::\    \:::\    \ \:::\__/:::/    /               \::::/___/:::/    /      \:::\__/:::/    /    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">           /:::/    /       \:::\   \::/    /       \:::\    \:::\    \ \::::::::/    /                 \:::\__/:::/    /        \::::::::/    /     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">          /:::/    /         \:::\   \/____/         \:::\    \:::\    \ \::::::/    /                   \::::::::/    /          \::::::/    /      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         /:::/    /           \:::\    \              \:::\    \:::\    \ \::::/    /                     \::::::/    /            \::::/    /       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        /:::/    /             \:::\____\              \:::\____\:::\____\ \::/____/                       \::::/    /              \::/____/        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        \::/    /               \::/    /               \::/    /\::/    /  ~~                              \::/____/                ~~              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         \/____/                 \/____/                 \/____/  \/____/                                    ~~                                      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">          _____                   _____    _____                  /\                                                                                 </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         /\    \                 /\    \  /\    \                /  \                                                                                </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        /::\    \               /::\____\/::\    \              /    \                                                                               </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       /::::\    \             /:::/    /::::\    \            /      \                                                                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      /::::::\    \           /:::/    /::::::\    \          /        \                                                                             </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     /:::/\:::\    \         /:::/    /:::/\:::\    \        /          \                                                                            </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    /:::/__\:::\    \       /:::/    /:::/  \:::\    \      /            \                                                                           </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   /::::\   \:::\    \     /:::/    /:::/    \:::\    \    /              \                                                                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  /::::::\   \:::\    \   /:::/    /:::/    / \:::\    \  /     Lennert    \                                                                         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> /:::/\:::\   \:::\____\ /:::/    /:::/    /   \:::\ ___\/       Stock      \                                                                        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/:::/  \:::\   \:::|    /:::/____/:::/____/     \:::|    \       1994       /                                                                        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">\::/   |::::\  /:::|____\:::\    \:::\    \     /:::|____|\                /                                                                         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> \/____|:::::\/:::/    / \:::\    \:::\    \   /:::/    /  \              /                                                                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       |:::::::::/    /   \:::\    \:::\    \ /:::/    /    \            /                                                                           </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       |::|\::::/    /     \:::\    \:::\    /:::/    /      \          /                                                                            </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       |::| \::/____/       \:::\    \:::\  /:::/    /        \        /                                                                             </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       |::|  ~|              \:::\    \:::\/:::/    /          \      /                                                                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       |::|   |               \:::\    \::::::/    /            \    /                                                                               </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       \::|   |                \:::\____\::::/    /              \  /                                                                                </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        \:|   |                 \::/    /\::/____/                \/                                                                                 </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         \|___|                  \/____/  ~~                                                                                                         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alpha" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">          _____                    _____                    _____            _____           _______                           _____          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         /\    \                  /\    \                  /\    \          /\    \         /::\    \                         /\    \         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        /::\____\                /::\    \                /::\____\        /::\____\       /::::\    \                       /::\____\        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       /:::/    /               /::::\    \              /:::/    /       /:::/    /      /::::::\    \                     /:::/    /        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      /:::/    /               /::::::\    \            /:::/    /       /:::/    /      /::::::::\    \                   /:::/   _/___      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     /:::/    /               /:::/\:::\    \          /:::/    /       /:::/    /      /:::/~~\:::\    \                 /:::/   /\    \     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    /:::/____/               /:::/__\:::\    \        /:::/    /       /:::/    /      /:::/    \:::\    \               /:::/   /::\____\    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   /::::\    \              /::::\   \:::\    \      /:::/    /       /:::/    /      /:::/    / \:::\    \             /:::/   /:::/    /    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  /::::::\    \   _____    /::::::\   \:::\    \    /:::/    /       /:::/    /      /:::/____/   \:::\____\           /:::/   /:::/   _/___  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \  /:::/    /       /:::/    /      |:::|    |     |:::|    |         /:::/___/:::/   /\    \ </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">/:::/  \:::\    /::\____\/:::/__\:::\   \:::\____\/:::/____/       /:::/____/       |:::|____|     |:::|    |        |:::|   /:::/   /::\____\</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">\::/    \:::\  /:::/    /\:::\   \:::\   \::/    /\:::\    \       \:::\    \        \:::\    \   /:::/    /         |:::|__/:::/   /:::/    /</span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> \/____/ \:::\/:::/    /  \:::\   \:::\   \/____/  \:::\    \       \:::\    \        \:::\    \ /:::/    /           \:::\/:::/   /:::/    / </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">          \::::::/    /    \:::\   \:::\    \       \:::\    \       \:::\    \        \:::\    /:::/    /             \::::::/   /:::/    /  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">           \::::/    /      \:::\   \:::\____\       \:::\    \       \:::\    \        \:::\__/:::/    /               \::::/___/:::/    /   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">           /:::/    /        \:::\   \::/    /        \:::\    \       \:::\    \        \::::::::/    /                 \:::\__/:::/    /    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">          /:::/    /          \:::\   \/____/          \:::\    \       \:::\    \        \::::::/    /                   \::::::::/    /     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         /:::/    /            \:::\    \               \:::\    \       \:::\    \        \::::/    /                     \::::::/    /      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        /:::/    /              \:::\____\               \:::\____\       \:::\____\        \::/____/                       \::::/    /       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        \::/    /                \::/    /                \::/    /        \::/    /         ~~                              \::/____/        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         \/____/                  \/____/                  \/____/          \/____/                                           ~~              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         _______                   _____                    _____            _____                   /\                                       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        /::\    \                 /\    \                  /\    \          /\    \                 /  \                                      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       /::::\    \               /::\    \                /::\____\        /::\    \               /    \                                     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      /::::::\    \             /::::\    \              /:::/    /       /::::\    \             /      \                                    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     /::::::::\    \           /::::::\    \            /:::/    /       /::::::\    \           /        \                                   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    /:::/~~\:::\    \         /:::/\:::\    \          /:::/    /       /:::/\:::\    \         /          \                                  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   /:::/    \:::\    \       /:::/__\:::\    \        /:::/    /       /:::/  \:::\    \       /            \                                 </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  /:::/    / \:::\    \     /::::\   \:::\    \      /:::/    /       /:::/    \:::\    \     /              \                                </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> /:::/____/   \:::\____\   /::::::\   \:::\    \    /:::/    /       /:::/    / \:::\    \   /     Lennert    \                               </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|:::|    |     |:::|    | /:::/\:::\   \:::\____\  /:::/    /       /:::/    /   \:::\ ___\ /       Stock      \                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|:::|____|     |:::|    |/:::/  \:::\   \:::|    |/:::/____/       /:::/____/     \:::|    |\       1994       /                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> \:::\    \   /:::/    / \::/   |::::\  /:::|____|\:::\    \       \:::\    \     /:::|____| \                /                               </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  \:::\    \ /:::/    /   \/____|:::::\/:::/    /  \:::\    \       \:::\    \   /:::/    /   \              /                                </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   \:::\    /:::/    /          |:::::::::/    /    \:::\    \       \:::\    \ /:::/    /     \            /                                 </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">    \:::\__/:::/    /           |::|\::::/    /      \:::\    \       \:::\    /:::/    /       \          /                                  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">     \::::::::/    /            |::| \::/____/        \:::\    \       \:::\  /:::/    /         \        /                                   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      \::::::/    /             |::|  ~|               \:::\    \       \:::\/:::/    /           \      /                                    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       \::::/    /              |::|   |                \:::\    \       \::::::/    /             \    /                                     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">        \::/____/               \::|   |                 \:::\____\       \::::/    /               \  /                                      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">         ~~                      \:|   |                  \::/    /        \::/____/                 \/                                       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                  \|___|                   \/____/          ~~                                                                </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## Alphabet
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alphabet" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  H   l         W     W      l   d!!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  H   l         W     W      l   d!!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">HHHHeeelooo      W  W  Wooorrrl ddd!!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  He elo o       W W W o or  ld  d    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  Hee looo,,      W W  ooor  l ddd!!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">            ,                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Alphabet" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  H     l l            W     W         l    d !!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  H     l l            W     W         l    d !!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">HHHH eee l l ooo        W  W  W ooo rrr l  ddd !!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  H e e l l o o         W W W  o o r   l d  d     </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">H  H ee  l l ooo ,,       W W   ooo r   l  ddd !!! </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                  ,                                </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════╝</span>
```
## AMC 3 Line
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC 3 Line" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">. .-..  .  .-.  . . ..-.-..  .-.. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|-|- |  |  | |  | | || |( |  |  ) </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">' `-'`-'`-'`-', `.'.'`-' '`-'`-'. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC 3 Line" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">. . .-. .   .   .-.     . . . .-. .-. .   .-. . </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|-| |-  |   |   | |     | | | | | |(  |   |  )| </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">' ` `-' `-' `-' `-' ,   `.'.' `-' ' ' `-' `-' . </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════╝</span>
```
## AMC 3 Liv1
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC 3 Liv1" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.:;S;:.            :.     :..:;S;:. .:;S;:..:;S;:..:;.;:.     :. .:;:.         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   S   S  S  S      S      SS     S      ( S     SS  S         SS     S.:;s ;: </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">`:;S;:'`:;S;:'`:;S;:'`:;S;:'`:;S;:' `:;S;:'`:;S;:'`:;S;:'`:;S;:'`:;S;:'        </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC 3 Liv1" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.:;S;:.              :.      :. .:;S;:.      .:;S;:. .:;S;:. .:;.;:.      :.  .:;:.          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   S    S  S  S       S       S S     S           (  S     S S  S          S S     S .:;s ;: </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">`:;S;:' `:;S;:' `:;S;:' `:;S;:' `:;S;:'      `:;S;:' `:;S;:' `:;S;:' `:;S;:' `:;S;:'         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## AMC AAA01
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC AAA01" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> .S    S.   sSSsS.  S.    sSSs_sSSs    .S     S.   sSSs_sSSs   .S_sSSs  S.     .S_sSSs    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.SS    SS. d%%SPSS. SS.  d%%SP~YS%%b  .SS     SS. d%%SP~YS%%b .SS~YS%%b SS.   .SS~YS%%b   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%S    S%Sd%S'  S%S S%S d%S'     `S%b S%S     S%Sd%S'     `S%bS%S   `S%bS%S   S%S   `S%b  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%S    S%SS%S   S%S S%S S%S       S%S S%S     S%SS%S       S%SS%S    S%SS%S   S%S    S%S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%S SSSS%SS&S   S&S S&S S&S       S&S S%S     S%SS&S       S&SS%S    d*SS&S   S%S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S&S  SSS&SS&S_SsS&S S&S S&S       S&S S&S     S&SS&S       S&SS&S   .S*SS&S   S&S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S&S    S&SS&S~SPS&S S&S S&S       S&S S&S     S&SS&S       S&SS&S_sdSSS S&S   S&S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S&S    S&SS&S   S&S S&S S&S       S&S S&S     S&SS&S       S&SS&S~YSY%b S&S   S&S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S*S    S*SS*b   S*b S*b S*b       d*S S*S     S*SS*b       d*SS*S   `S%bS*b   S*S    d*S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S*S    S*SS*S.  S*S.S*S.S*S.     .S*S S*S  .  S*SS*S.     .S*SS*S    S%SS*S.  S*S   .S*S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S*S    S*S SSSbs SSSbsSSbsSSbs_sdSSS  S*S_sSs_S*S SSSbs_sdSSS S*S    S&S SSSbsS*S_sdSSS   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSS    S*S  YSSP  YSSPYSSPYSSP~YSSY   SSS~SSS~S*S  YSSP~YSSY  S*S    SSS  YSSPSSS~YSSY    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       SP                                                     SP                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       Y                                                      Y                           </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC AAA01" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;"> .S    S.     sSSs  S.      S.        sSSs_sSSs           .S     S.     sSSs_sSSs     .S_sSSs    S.       .S_sSSs    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.SS    SS.   d%%SP  SS.     SS.      d%%SP~YS%%b         .SS     SS.   d%%SP~YS%%b   .SS~YS%%b   SS.     .SS~YS%%b   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%S    S%S  d%S'    S%S     S%S     d%S'     `S%b        S%S     S%S  d%S'     `S%b  S%S   `S%b  S%S     S%S   `S%b  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%S    S%S  S%S     S%S     S%S     S%S       S%S        S%S     S%S  S%S       S%S  S%S    S%S  S%S     S%S    S%S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%S SSSS%S  S&S     S&S     S&S     S&S       S&S        S%S     S%S  S&S       S&S  S%S    d*S  S&S     S%S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S&S  SSS&S  S&S_Ss  S&S     S&S     S&S       S&S        S&S     S&S  S&S       S&S  S&S   .S*S  S&S     S&S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S&S    S&S  S&S~SP  S&S     S&S     S&S       S&S        S&S     S&S  S&S       S&S  S&S_sdSSS   S&S     S&S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S&S    S&S  S&S     S&S     S&S     S&S       S&S        S&S     S&S  S&S       S&S  S&S~YSY%b   S&S     S&S    S&S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S*S    S*S  S*b     S*b     S*b     S*b       d*S        S*S     S*S  S*b       d*S  S*S   `S%b  S*b     S*S    d*S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S*S    S*S  S*S.    S*S.    S*S.    S*S.     .S*S        S*S  .  S*S  S*S.     .S*S  S*S    S%S  S*S.    S*S   .S*S  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S*S    S*S   SSSbs   SSSbs   SSSbs   SSSbs_sdSSS         S*S_sSs_S*S   SSSbs_sdSSS   S*S    S&S   SSSbs  S*S_sdSSS   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSS    S*S    YSSP    YSSP    YSSP    YSSP~YSSY          SSS~SSS~S*S    YSSP~YSSY    S*S    SSS    YSSP  SSS~YSSY    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       SP                                                                            SP                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">       Y                                                                             Y                               </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## AMC Neko
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Neko" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.sSSS SSSSS                                                  .sSSS       s.                                              SSSSS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSSSS SSSSS.sSSSSs.   SSSSS      SSSSS      .sSSSSs.         SSSSS       SSSs.sSSSSs.   .sSSSSSSSs.SSSSS      .sSSSSs.   S SSS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S SSS SSSSSS SSSSSSSs.S SSS      S SSS      S SSSSSSSs.      S SSS       SSSSS SSSSSSSs.S SSS SSSSSS SSS      S SSSSSSSs.S  SS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S  SS SSSSSS  SS SSSS'S  SS      S  SS      S  SS SSSSS      S  SS       SSSSS  SS SSSSSS  SS SSSS'S  SS      S  SS SSSSSS;;;S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S..SSsSSSSSS..SS      S..SS      S..SS      S..SS SSSSS      S..SS       SSSSS..SS SSSSSS..SSsSSSa.S..SS      S..SS SSSSSS%%%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S:::S SSSSSS:::SSSS   S:::S      S:::S      S:::S SSSSS      S:::S       SSSSS:::S SSSSSS:::S SSSSSS:::S      S:::S SSSSSSSSSS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S;;;S SSSSSS;;;S      S;;;S      S;;;S      S;;;S SSSSS.sSs. S;;;S   S   SSSSS;;;S SSSSSS;;;S SSSSSS;;;S      S;;;S SSSSS.sSs. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%%%S SSSSSS%%%S SSSSSS%%%S SSSSSS%%%S SSSSSS%%%S SSSSSS%%%S S%%%S  SSS  SSSSS%%%S SSSSSS%%%S SSSSSS%%%S SSSSSS%%%S SSSS'S%%%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSSSS SSSSSSSSSSsSS;:'SSSSSsSS;:'SSSSSsSS;:'SSSSSsSSSSS`"":5 SSSSSsSS SSsSSSSSSSSSsSSSSSSSSSS SSSSSSSSSSsSS;:'SSSSSsS;:' `:;:' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                         ;:'                                                                   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Neko" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.sSSS SSSSS                                                            .sSSS       s.                                                    SSSSS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSSSS SSSSS .sSSSSs.    SSSSS       SSSSS       .sSSSSs.               SSSSS       SSSs. .sSSSSs.    .sSSSSSSSs. SSSSS       .sSSSSs.    S SSS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S SSS SSSSS S SSSSSSSs. S SSS       S SSS       S SSSSSSSs.            S SSS       SSSSS S SSSSSSSs. S SSS SSSSS S SSS       S SSSSSSSs. S  SS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S  SS SSSSS S  SS SSSS' S  SS       S  SS       S  SS SSSSS            S  SS       SSSSS S  SS SSSSS S  SS SSSS' S  SS       S  SS SSSSS S;;;S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S..SSsSSSSS S..SS       S..SS       S..SS       S..SS SSSSS            S..SS       SSSSS S..SS SSSSS S..SSsSSSa. S..SS       S..SS SSSSS S%%%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S:::S SSSSS S:::SSSS    S:::S       S:::S       S:::S SSSSS            S:::S       SSSSS S:::S SSSSS S:::S SSSSS S:::S       S:::S SSSSS SSSSS </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S;;;S SSSSS S;;;S       S;;;S       S;;;S       S;;;S SSSSS .sSs.      S;;;S   S   SSSSS S;;;S SSSSS S;;;S SSSSS S;;;S       S;;;S SSSSS .sSs. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">S%%%S SSSSS S%%%S SSSSS S%%%S SSSSS S%%%S SSSSS S%%%S SSSSS S%%%S      S%%%S  SSS  SSSSS S%%%S SSSSS S%%%S SSSSS S%%%S SSSSS S%%%S SSSS' S%%%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSSSS SSSSS SSSSSsSS;:' SSSSSsSS;:' SSSSSsSS;:' SSSSSsSSSSS `"":5      SSSSSsSS SSsSSSSS SSSSSsSSSSS SSSSS SSSSS SSSSSsSS;:' SSSSSsS;:'  `:;:' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                                                              ;:'                                                                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## AMC Razor
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Razor" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                 ___                                    ___    ___                   __                       </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  .'| |`.   .'|=|_.'  .'|       .'|       .'|=|`.      |   |  |   |  .'|=|`.    .'|=|  |  .'|       .'|=|`.   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.'  | |  `.'  |  ___.'  |     .'  |     .'  | |  `.    |   |  |   |.'  | |  `..'  | |  |.'  |     .'  | |  `. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   |=|   |   |=|_.'|   |     |   |     |   | |   |    |   |  |   ||   | |   ||   |=|.' |   |     |   | |   | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | |   |   |  ___|   |  ___|   |  ___`.  | |  .'.-. `.  |  |  .'`.  | |  .'|   |  |`.|   |  ___|   | |  .' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|___| |___|___|=|_.'|___|=|_.'|___|=|_.'  `.|=|.'  `/'   `.|/\|.'    `.|=|.'  |___|  |_||___|=|_.'|___|=|.'   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Razor" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">                   ___                                           ___    ___                     __                         </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">  .'| |`.     .'|=|_.'   .'|        .'|        .'|=|`.          |   |  |   |   .'|=|`.     .'|=|  |   .'|        .'|=|`.   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.'  | |  `. .'  |  ___ .'  |      .'  |      .'  | |  `.        |   |  |   | .'  | |  `. .'  | |  | .'  |      .'  | |  `. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   |=|   | |   |=|_.' |   |      |   |      |   | |   |        |   |  |   | |   | |   | |   |=|.'  |   |      |   | |   | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|   | |   | |   |  ___ |   |  ___ |   |  ___ `.  | |  .' .-.    `.  |  |  .' `.  | |  .' |   |  |`. |   |  ___ |   | |  .' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|___| |___| |___|=|_.' |___|=|_.' |___|=|_.'   `.|=|.'   `/'      `.|/\|.'     `.|=|.'   |___|  |_| |___|=|_.' |___|=|.'   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## AMC Razor2
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Razor2" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   . .      . .      .        .        . .       .    .    .   . .      . .      .        . .   .    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.+'| |`+..+'|=|`+..+'|     .+'|     .+'|=|`+. .+'|  .'|  .'|.+'|=|`+..+'|=|`+..+'|     .+'|=|`+.|`+. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  ||  | `+.||  |     |  |     |  | |  | |  |  | |  | ||  | |  ||  | |  ||  |     |  | `+ ||  | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  |=|  ||  |=|`. |  |     |  |     |  | |  | |  |  | |  | ||  | |  ||  |'. '.|  |     |  |  | ||  | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  ||  | `.| |  |     |  |     |  | |  | |  |  | |  | ||  | |  ||  | |  ||  |     |  |  | |`+.| </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  ||  |    .|  |    .|  |    .|  | |  | |  |  | |  | ||  | |  ||  | |  ||  |    .|  |  | |.    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  ||  | .+'||  | .+'||  | .+'||  | |  | |  | .+ | .+ ||  | |  ||  | |  ||  | .+'||  | .+ ||`+. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">`+.| |..|`+.|=|.+'`+.|=|.+'`+.|=|.+'`+.|=|.+' `+.|=|.+'=|.+'`+.|=|.+'`+.| |.+'`+.|=|.+'`+.|=|.+'`+.| </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Razor2" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">   . .       . .       .         .         . .          .    .    .    . .       . .       .         . .    .    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.+'| |`+. .+'|=|`+. .+'|      .+'|      .+'|=|`+.    .+'|  .'|  .'| .+'|=|`+. .+'|=|`+. .+'|      .+'|=|`+. |`+. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  | |  | `+.| |  |      |  |      |  | |  |    |  |  | |  | | |  | |  | |  | |  | |  |      |  | `+ | |  | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  |=|  | |  |=|`.  |  |      |  |      |  | |  |    |  |  | |  | | |  | |  | |  |'. '. |  |      |  |  | | |  | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  | |  | `.|  |  |      |  |      |  | |  |    |  |  | |  | | |  | |  | |  | |  | |  |      |  |  | | `+.| </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  | |  |    . |  |    . |  |    . |  | |  |    |  |  | |  | | |  | |  | |  | |  | |  |    . |  |  | | .    </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|  | |  | |  | .+'| |  | .+'| |  | .+'| |  | |  |    |  | .+ | .+ | |  | |  | |  | |  | |  | .+'| |  | .+ | |`+. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">`+.| |..| `+.|=|.+' `+.|=|.+' `+.|=|.+' `+.|=|.+'    `+.|=|.+'=|.+' `+.|=|.+' `+.| |.+' `+.|=|.+' `+.|=|.+' `+.| </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## AMC Slash
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Slash" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.s    s.                                      .s s.  s.                                      </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      SS..s5SSSs. .s       .s       .s5SSSs.     SS. SS..s5SSSs. .s5SSSs. .s       .s5SSSs.  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">sS    S%S      SS.                        SS. sS S%S S%S      SS.      SS.               SS. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    S%SsS    `:;sS       sS       sS    S%S SS S%S S%SsS    S%SsS    S%SsS       sS    S%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSSs. S%SSSSs.    SS       SS       SS    S%S SS S%S S%SSS    S%SSS .sS;:'SS       SS    S%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    S%SSS       SS       SS       SS    S%S SS S%S S%SSS    S%SSS    ;, SS       SS    S%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    `:;SS       SS       SS       SS    `:; SS `:; `:;SS    `:;SS    `:;SS       SS    `:; </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    ;,.SS    ;,.SS    ;,.SS    ;,.SS    ;,. SS ;,. ;,.SS    ;,.SS    ;,.SS    ;,.SS    ;,. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:;    ;:'`:;;;;;:'`:;;;;;:'`:;;;;;:'`:;;;;;:' `:;;:'`::'`:;;;;;:'`:    ;:'`:;;;;;:';;;;;;;:' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Slash" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.s    s.                                              .s s.  s.                                          </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">      SS. .s5SSSs.  .s        .s        .s5SSSs.         SS. SS. .s5SSSs.  .s5SSSs.  .s        .s5SSSs.  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">sS    S%S       SS.                           SS.     sS S%S S%S       SS.       SS.                 SS. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    S%S sS    `:; sS        sS        sS    S%S     SS S%S S%S sS    S%S sS    S%S sS        sS    S%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SSSs. S%S SSSs.     SS        SS        SS    S%S     SS S%S S%S SS    S%S SS .sS;:' SS        SS    S%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    S%S SS        SS        SS        SS    S%S     SS S%S S%S SS    S%S SS    ;,  SS        SS    S%S </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    `:; SS        SS        SS        SS    `:;     SS `:; `:; SS    `:; SS    `:; SS        SS    `:; </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">SS    ;,. SS    ;,. SS    ;,. SS    ;,. SS    ;,.     SS ;,. ;,. SS    ;,. SS    ;,. SS    ;,. SS    ;,. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">:;    ;:' `:;;;;;:' `:;;;;;:' `:;;;;;:' `:;;;;;:'     `:;;:'`::' `:;;;;;:' `:    ;:' `:;;;;;:' ;;;;;;;:' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## AMC Slider
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Slider" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">           ____                       ______                         ______                              </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|         |          |      |       .~      ~.  `.               .'.~      ~.|`````````,|      |``````.  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|_________|______    |      |      |          |   `.           .' |          |'''|''''' |      |       | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|         |          |      |      |          |     `.   .   .'   |          |    `.    |      |       | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|         |__________|______|_______`.______.'        `.' `.'      `.______.'|      `.  |______|......'  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Slider" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">             ____                             ______                                  ______                                   </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|         | |            |        |         .~      ~.         `.               .'  .~      ~.  |`````````, |        |``````.  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|_________| |______      |        |        |          |          `.           .'   |          | |'''|'''''  |        |       | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">|         | |___________ |_______ |_______  `.______.'               `.' `.'        `.______.'  |      `.   |_______ |......'  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
## AMC Thin
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Thin" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -ScreenWigth 150 
```
```
<span style="color: yellow;">╔══════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.-.   .-..-..--..-.    .-.    .-..-..-.    .-. .-. .-..-..-..-..-..-.  .-.    .-..-.  .-. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| | _ | || | ~~ | |    | |    | | ~ | |    | | | | | || | ~ | || | ~.-.| |    | | ~.-.| | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| |`-'| || | _  | |    | |    | |   | |    | | | | | || |   | || |.-.~ | |    | |  | || | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| |   | || |`-' | |    | |    | |   | |    | | | | | || |   | || | ~.-.| |    | |  | |`-' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| |   | || | __ | | __ | | __ | | _ | | _  `-'_`-'_`-'| | _ | || |  | || | __ | | _`-' _  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">`-'   `-'`-'`--'`-'`--'`-'`--'`-'`-'`-'`/'   `-' `-'  `-'`-'`-'`-'  `-'`-'`--'`-'`-'  `-' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚══════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
```powershell
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "AMC Thin" -BorderType DoubleBox -TextColor Cyan -BorderColor Yellow -HorizontalLayout Full -VerticalLayout Full -ScreenWigth 150 
```
```
<span style="color: yellow;">╔════════════════════════════════════════════════════════════════════════════════════════════════════════╗</span>
<span style="color: yellow;">║</span><span style="color: cyan;">.-.   .-. .-..--. .-.     .-.     .-..-..-.         .-. .-. .-. .-..-..-. .-..-.   .-.     .-..-.   .-. </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| | _ | | | | ~~  | |     | |     | | ~ | |         | | | | | | | | ~ | | | | ~.-. | |     | | ~.-. | | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| |`-'| | | | _   | |     | |     | |   | |         | | | | | | | |   | | | |.-.~  | |     | |  | | | | </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| |   | | | |`-'  | |     | |     | |   | |         | | | | | | | |   | | | | ~.-. | |     | |  | | `-' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">| |   | | | | __  | | __  | | __  | | _ | |  _      `-'_`-'_`-' | | _ | | | |  | | | | __  | | _`-'  _  </span><span style="color: yellow;">║</span>
<span style="color: yellow;">║</span><span style="color: cyan;">`-'   `-' `-'`--' `-'`--' `-'`--' `-'`-'`-' `/'       `-' `-'   `-'`-'`-' `-'  `-' `-'`--' `-'`-'   `-' </span><span style="color: yellow;">║</span>
<span style="color: yellow;">╚════════════════════════════════════════════════════════════════════════════════════════════════════════╝</span>
```
