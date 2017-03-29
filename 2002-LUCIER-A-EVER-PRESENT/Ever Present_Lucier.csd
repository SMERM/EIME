<CsoundSynthesizer>
<CsOptions>
csound -3 -A -o EverPresent.aiff 
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 1
nchnls = 2


	instr 1
	
	iamp = ampdbfs(p4)
	idur = p3
	ipitchA = cpspch(p5)
	ipitchB = cpspch(p6)
	
ksweep  expseg ipitchA, idur, ipitchB
a1 oscili iamp,ksweep,1

	outch 1,a1 
	
	endin
	
	instr 2
	iamp = ampdbfs(p4)
	idur = p3
	ipitchA = cpspch(p5)
	ipitchB = cpspch(p6)
	
ksweep  expseg ipitchA, idur, ipitchB
a2 oscili iamp,ksweep,1

	outch 2,a2 
	
	endin
	
	
	

</CsInstruments>
<CsScore>
f 1 0 8192 10 1 
; i At   idur      iamp    pitchA     pitchB
i 1  0.   504.      -12     08.00      10.00
i 1  +    408.      -12     10.00      08.00

i 2  0.   252.      -12     08.00      07.08
i 2  +    252.      -12     07.08      06.11
i 2  +    216.      -12     06.11      07.08
i 2  +    192.      -12     07.08      08.00

 

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
