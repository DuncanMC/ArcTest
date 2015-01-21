# ArcTest
An iOS project that demonstrates a problem with the CGPathAddArc() function on 64 bit iOS devices

It turns out that the CGPath function CGPathAddArc() behaves differently on 32 and 64 bit devices.

On 32 bit devices, you can switch the state of the clockwise parameter and still get an arc.

On 64 bit devices, if you switch the clockwise flag you also have to switch your startAngle and endAngle 
paremeters or it fails to draw an arc.
