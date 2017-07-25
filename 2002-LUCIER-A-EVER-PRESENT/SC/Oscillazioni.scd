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