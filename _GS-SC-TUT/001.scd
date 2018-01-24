/*

   ------------------------------------------------------------------------------------------------------
   ---- processo di liberazione da MaxMsp    ------------------------------------------------------------
   ---- questa breve guida non è un'introduzione a SuperCollider ma all'utilizzo di sc per --------------
   ---- relaizzare le oscillazioni sinusoidali per il brano "Ever Present" di Alvin Lucier. -------------
   ------------------------------------------------------------------------------------------------------

   # che cos'è SuperCollider?

   > an object-oriented language for sound synthesis and digital signal processing (DSP)
   > SuperCollider is actually three programs:
   > The text editor (or IDE) which you are looking at,
   > the language (sclang, or 'client' app),
   > and the server, which does the actual synthesis and calculation of audio.

   # imparare a consultare la documentazione in linea
     la documentazione di sc è scritta in sc, i file della guida si possono suonare e modificare.
     provare per credere.

*/

// due righe per accendere e spegnere i motori
// shift+d su `s.boot; per far partire il server
s.boot;

// shift+d su `s.quit; per fermare il server
s.quit;

// a motore acceso si possono bloccare tutte le funzioni audio con command+.
// tre modi di scrivere lo stesso codice, con tre possibilità diverse di attivazione:
// +-- 1) una sola linea attivabile con shift+D oppure con command+d
{ [SinOsc.ar(440, 0, 0.2), SinOsc.ar(442, 0, 0.2)] }.play;
// command+. per fermare tutte le funzioni audio

// +-- 2) più linee di codice, attivabile solamente selezionando interamente il testo e poi command+d
{[
  SinOsc.ar(440, 0, 0.2),
  SinOsc.ar(442, 0, 0.2)
]}.play;

// +-- 3) più linee di codice attivabili posizionandosi sulla parentesi più esterna e poi command+d
({[
  SinOsc.ar(440, 0, 0.2),
  SinOsc.ar(442, 0, 0.2)
]}.play;)


// un inviluppo trapezoidale
Env.new([0, 1, 1, 0], [0.1, 1, 0.1], [1, 0, 1]).plot;

{SinOsc.ar(XLine.kr(start: 60.midicps, end: 84.midicps, dur: 504), 0, 0.5)}.play;


// oscillazione sinistra che sale
// questa deve uscire sul canale 1
{ SinOsc.ar(
  Line.kr(
    start: 60.midicps,
    end: 84.midicps,
    dur: 504,
), 0, 0.5) }.play;

// oscillazione destra che scende
// questa deve uscire sul canale 2
{ SinOsc.ar(
  Line.kr(
    start: 60.midicps,
    end: 56.midicps,
    dur: 252,
), 0, [0, 0.5]) }.play;

// come far suonare eventi in successione?

//   UP da c3 a c4 in 252
// DOWN da c3 a aes2 in 252
{ SinOsc.ar([Line.kr(60.midicps, 72.midicps, dur: 252), Line.kr(60.midicps, 56.midicps, dur: 252)], 0, 0.5) }.play;

//   UP da c3 a c4 in 252
// DOWN da c3 a aes2 in 252
{ SinOsc.ar([Line.kr(72.midicps, 84.midicps, dur: 252), Line.kr(56.midicps, 47.midicps, dur: 252)], 0, 0.5) }.play;

(
  SystemClock.sched(0.0,{
    "00:00 starting point".postln;
    x = SynthDef.new("sinosc", { Out.ar(0, SinOsc.ar([Line.kr(60.midicps, 72.midicps, 252), Line.kr(60.midicps, 56.midicps, 252.1)], 0, 0.5))}).play;
    nil;
});

  SystemClock.sched(252.0,{
    "252 bottom cue".postln;
    x.free;
    y = SynthDef.new("sinosc", { Out.ar(0, SinOsc.ar([Line.kr(72.midicps, 84.midicps, 252), Line.kr(56.midicps, 47.midicps, 252.1)], 0, 0.5))}).play;
    nil;
});

  SystemClock.sched(504.0,{
    "middle point".postln;
    y.free;
    nil;
});
  s.record(duration:504);
)