<csLADSPA>
Name=CsoundGain Plugin
Maker=Victor Lazzarini
UniqueID=1049
Copyright=None
ControlPort=Gain|gain
Range=0|2
ControlPort=Test|test
Range=0|2
</csLADSPA>

<CsoundSynthesizer>

<CsInstruments>
sr = 44100
ksmps = 10
nchnls = 1

instr 1

kGain   chnget "gain"

ain 	in
	
        out	ain*kGain 
endin

</CsInstruments>

<CsScore>
	
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
