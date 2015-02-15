gsar -o -sWindowXXX -r%1 *.pas
gsar -o -sWindowXXX -r%1 *.dfm
gsar -o -sWindowXXX -r%1 *.dpr
gsar -o -sWindowXXX -r%1 *.dproj
rename uWindowXXX.pas u%1.pas
rename uWindowXXXForm.pas u%1Form.pas
rename uWindowXXXForm.dfm u%1Form.dfm
rename WindowXXX.dpr %1.dpr
rename WindowXXX.dproj %1.dproj 