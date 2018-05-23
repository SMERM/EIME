<CsoundSynthesizer>


<CsOptions>
csound  -W -o "Primo_mov.wav"
</CsOptions>


<CsInstruments>
sr = 44100
kr = 4410
0dbfs = 1.0
nchnls = 1



instr 1
kspeed init 1  ; velocità di lettura
iskip= ((p4*1000)+21)/76.2
iloop init 0


asig diskin2 "C:/Users/Andrea/Desktop/misturerev3.wav",kspeed, iskip, iloop  ; p4=pitch= 1 lettura normale = -1 reverse. p5 attacco in cm
out asig*(p5); fattore moltiplicativo per regolare le ampiezze
endin

instr 2
kspeed init -1  ; velocità di lettura
iskip= ((p4*1000)+700)/76.2
iloop init 0
asig diskin2 "C:/Users/Andrea/Desktop/misturerev3.wav",kspeed, iskip, iloop  ; p4=pitch= 1 lettura normale = -1 reverse. p5 attacco in cm
out asig*(p5)
endin
</CsInstruments>
<CsScore>
t0 4572

i 1 0 119  67
i 2 66.2 51.5  136

</CsScore>
</CsoundSynthesizer>