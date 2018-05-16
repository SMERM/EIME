//--------------------------------------------------------------------------------------------------
// 1987 - LUIGI NONO - POST PREAE LUDIUM PER DONAU
//--------------------------------------------------------------------------------------------------

declare name "NONO - POST-PRAE-LUDIUM PER DONAU";
declare version "0.1";
declare author "Giuseppe Silvi";
declare copyright "Giuseppe Silvi 2018";
declare license "BSD";
declare reference "giuseppesilvi.com";
declare description "AMBIENTE D'ESECUZIONE";

import("stdfaust.lib");
import("basics.lib");
import("delays.lib");
//import("effect.lib");
import("filters.lib");
import("reverbs.lib");

vmeter(x)	= attach(x, envelop(x) : vbargraph("[unit:dB]", -70, 0));
hmeter(x)	= attach(x, envelop(x) : hbargraph("[unit:dB]", -70, 0));
  envelop = abs : max(ba.db2linear(-70)) : ba.linear2db : min(10)  : max ~ -(80.0/ma.SR);
  gain(x) = x : db2linear : si.smooth(0.999);
    fader = _ * (gain(vslider("[unit:dB]", 0, -70, 12, 0.1)));
    hader = _ * (gain(hslider("[unit:dB]", 0, -70, 12, 0.1)));

INPUT = vgroup("[1] MIC", hmeter : hader);

//-------------------------------------------------
// AMPLIFICAZIONE TRASPARENTE
//-------------------------------------------------

atoLF = hgroup("LF", fader : vmeter);
atoRF = hgroup("RF", fader : vmeter);
atoLB = hgroup("LB", fader : vmeter);
atoRB = hgroup("RB", fader : vmeter);

atdLF = sdelay(192000,1024,ba.sec2samp(nentry("LF distance (mseconds)", 0., 0., 1., 0.001)));
atdRF = sdelay(192000,1024,ba.sec2samp(nentry("RF distance (mseconds)", 0., 0., 1., 0.001)));
atdLB = sdelay(192000,1024,ba.sec2samp(nentry("LB distance (mseconds)", 0., 0., 1., 0.001)));
atdRB = sdelay(192000,1024,ba.sec2samp(nentry("RB distance (mseconds)", 0., 0., 1., 0.001)));

AT = hgroup("[2] Amplificazione Trasparente", _ <: vmeter, vgroup("Delay",atdLF, atdRF, atdLB, atdRB) : !, hgroup("Out Fader", atoLF, atoRF, atoLB, atoRB));

//-------------------------------------------------
// PGM1
//-------------------------------------------------

pgm1LF = hgroup("LF",  sdelay(192000,1024,ba.sec2samp(5)) : fader : vmeter);
pgm1RF = hgroup("RF",  sdelay(192000,1024,ba.sec2samp(7)) : fader : vmeter);
pgm1LB = hgroup("LB",  sdelay(192000,1024,ba.sec2samp(10)) : fader : vmeter);
pgm1RB = hgroup("RB",  sdelay(192000,1024,ba.sec2samp(15)) : fader : vmeter);

PGM1 = hgroup("[3] PGM1", _ : jcrev : pgm1LF, pgm1RF, pgm1LB, pgm1RB);

//-------------------------------------------------
// PGM2
//-------------------------------------------------

phasing = pf.phaser2_mono(13,.707,500,1000,2,1500,1,1,0,0);

rot1 = os.phasor(1024,0.16) : _;
rot2 = os.phasor(1024,-0.23) : _;

pgm2LF = hgroup("LF", fader : vmeter);
pgm2RF = hgroup("RF", fader : vmeter);
pgm2LB = hgroup("LB", fader : vmeter);
pgm2RB = hgroup("RB", fader : vmeter);

PGM2 = hgroup("[4] PGM2", _ : phasing <:
       vgroup("HALAFON", sp.spat(4, rot1, 1),
                         sp.spat(4, rot2, 1)) :>
                         pgm2LF, pgm2RF, pgm2LB, pgm2RB);

//-------------------------------------------------
// PGM3 + PGM4
//-------------------------------------------------

pgm3LF = hgroup("LF", fader : vmeter);
pgm3RF = hgroup("RF", fader : vmeter);
pgm4LB = hgroup("LB", fader : vmeter);
pgm4RB = hgroup("RB", fader : vmeter);

rev30 = hgroup("PGM3", re.zita_rev1_stereo(35,500,2500,30,30,48000) : pgm3LF, pgm3RF);
rev10 = _,_ : !, lowpass(2, 566) <: hgroup("PGM4", re.zita_rev1_stereo(35,500,2500,10,10,48000) : pgm4LB, pgm4RB);

PGM34 = hgroup("[5] PGM3 ---- PGM4", _ <: rev30, rev10) ;

//-------------------------------------------------
// PPLPD MAIN
//-------------------------------------------------

PPLPD = vgroup("Post-Prae-Ludium Per Donau. Luigi Nono. 1987", INPUT <: AT, PGM1, PGM2, PGM34 :> _,_,_,_);

process =  PPLPD;
