gsar -o -sXXX -r%1 *.pas
gsar -o -sXXX -r%1 *.dfm
gsar -o -sXXX -r%1 *.dpr
gsar -o -sXXX -r%1 *.dproj
rename uWindowXXX.pas uWindow%1.pas
rename uWindowXXXForm.pas uWindow%1Form.pas
rename uWindowXXXForm.dfm uWindow%1Form.dfm
rename WindowXXX.dpr Window%1.dpr
rename WindowXXX.dproj Window%1.dproj 