<csLADSPA>
Name=CsoundPVSblur Plugin
Maker=Lazzarini
UniqueID=1056
Copyright=None
ControlPort=Max Delay|del
Range=0|1
ControlPort=Blur Time|blur
Range=0|10 &log
</csLADSPA>

<CsoundSynthesizer>
<CsInstruments>
sr = 44100
ksmps = 10
nchnls = 1

instr 1
    
imaxdel     chnget "del"
iblurtime   chnget "blur"

asig    in                                 

fsig    pvsanal   asig, 1024, 256, 1024, 1 
ftps    pvsblur   fsig, 0.2, 0.2           
atps    pvsynth   ftps                     

        out	atps
endin

</CsInstruments>
<CsScore>

f1 0 1024 10 1
i1 0 3600

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
