dirkmpc
=======
### Prerequisites
- [Processing](https://processing.org/)
  - [The MidiBus](http://www.smallbutdigital.com/projects/themidibus/)
- [loopMIDI](https://www.tobias-erichsen.de/software/loopmidi.html)
- Any DAW
  - Create a virtual keyboard which
    - Receives from `loopMIDI Port`
    
### How to use
- Modify `myBus = new MidiBus(this, -1, 3);`
  - Change the output index `3` to the index pointing to `"loopMIDI Port"
