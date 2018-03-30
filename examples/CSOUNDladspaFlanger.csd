<csLADSPA>
Name=Csound-FLANGER
Maker=Victor Lazzarini
UniqueID=1054
Copyright=None
ControlPort=Flange Depth|depth
Range=0|1
ControlPort=Flange Rate|rate
Range=0|10
</csLADSPA>
	

<CsoundSynthesizer>
	
<CsInstruments>
	
sr = 44100
ksmps = 10
nchnls = 1

instr 1
	
kdeltime    chnget "depth"
krate       chnget "rate"
	
ain         in

	
a1          oscil kdeltime, 1, 1
	
ar          vdelay3 ain, a1+kdeltime, 1000
	
            out ar+ain

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
