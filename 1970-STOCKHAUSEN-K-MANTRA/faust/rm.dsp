import("music.lib");
import("filter.lib");

ringMod = *(1-depth*(osc(freq)*0.5+0.5))
with{
	freq = hslider("frequency[osc:/1/fader1 0 1]",5,0.1,1000,0.01) : smooth(0.999);
	depth = hslider("depth",0,0,1,0.01) : smooth(0.999);
};

process = ringMod <: _,_;
