# SplishSplash
A little app that does magic

### Implementation Details

A Splish Splash consists of two parts:

1. *Splish*
The Splish is a colored circle with 80% opacity. The Splish appears at the moment when and location where a user’s finger touches the screen. Its animation curve has a standard ease out timing. It has a starting radius of 0 and a final radius anywhere between 60–150px¹. It takes 0.2s to appear fully. After it appears, it stays on screen for 1.5s, then it fades out over 0.5s.
2. *Splash*
The Splash occurs 0.15s after the Splish begins. It consists of between 2–5 colored circles that have the exact same properties as the Splish, except that they are anywhere between 20–40%¹ smaller in radius. Their centers are located anywhere between 60–100px¹ away from the center of the Splish, randomly distributed around the center of the Splish.

When the user taps anywhere on the screen, generate a Splish Splash at the tap location according to the following rules:

1. The Splish Splash should be a randomly generated color.
2. A “tap” is defined as “when the user touches the screen.”
3. Any number of simultaneous taps is allowed; each should generate a Splish Splash.
4. There is no specific limit to where a Splish Splash can appear.
5. There is no specific limit to the number of Splish Splashes that can be on screen at once.
