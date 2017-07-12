Server.internal.options.device = "Soundflower (2ch)";
Server.local.options.device = "Soundflower (2ch)";

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