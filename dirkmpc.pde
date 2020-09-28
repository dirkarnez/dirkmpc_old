import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

// https://processing.org/examples/button.html
// https://www.youtube.com/watch?v=jfM-LAp-tKE&ab_channel=curtis%27schannel

PImage img;

int channel = 1;
int velocity = 127;
int lastPitch = 0;

//void noteOn(int channel, int pitch, int velocity) {
//  // Receive a noteOn
//  println();
//  println("Note On:");
//  println("--------");
//  println("Channel:"+channel);
//  println("Pitch:"+pitch);
//  println("Velocity:"+velocity);
//}

//void noteOff(int channel, int pitch, int velocity) {
//  // Receive a noteOff
//  println();
//  println("Note Off:");
//  println("--------");
//  println("Channel:"+channel);
//  println("Pitch:"+pitch);
//  println("Velocity:"+velocity);
//}

//void controllerChange(int channel, int number, int value) {
//  // Receive a controllerChange
//  println();
//  println("Controller Change:");
//  println("--------");
//  println("Channel:"+channel);
//  println("Number:"+number);
//  println("Value:"+value);
//}




//Minim minim;
//AudioPlayer song1, song2, song3, song4, song5, song6, song7;
int rectNum = 4;

void displayRect() {
  //float rectSize = width / rectNum;
  
  //println("rectNum: ", rectNum, " rectSize: ", rectSize);

  //for (int y = 0; y < height; y += rectSize) {
  //  for (int x = 0; x < width; x += rectSize) {
  //    noStroke();
  //    fill(255 * x / width, 255 * y / height, 255);
  //    println("R: ", 255 * x / width, " G: ", 255*y / height, " B: 255");
  //    rect(x, y, rectSize, rectSize);
  //  }
  //}

  noStroke();
  fill(0);
  rect(0, 0, width, height);
}

void displayText() {
  PFont f;
  f = createFont("Helvetica", 16, true);

  textFont(f, 40);
  fill(0);
  text ("kick", 60, 60);
}

void setup() {
  size(1000, 625);
  
  img = loadImage("mpc1000.png");
  
  initMidiBus();
  
  displayRect();
  //displayText();
}

void initMidiBus() {
  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // Either you can
  //                   Parent In Out
  //                     |    |  |
  //myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  // or you can ...
  //                   Parent         In                   Out
  //                     |            |                     |
  //myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

  // or for testing you could ...
  //                 Parent  In        Out
  //                   |     |          |
  myBus = new MidiBus(this, -1, 3); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}
void draw() {
  //background(0);

//  delay(200);
//  myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

//  //int number = 0;
//  //int value = 90;

// // myBus.sendControllerChange(channel, number, value); // Send a controllerChange
//  delay(2000);
  image(img, 0, 0, width, height);
}

void keyPressed() {
  if (lastPitch > 0) {
    myBus.sendNoteOff(channel, lastPitch, velocity); // Send a Midi nodeOff
  }
  
  if (key==CODED) {
    println(keyCode);
  } else {
    if (key == 'q' || key == 'Q') {
      myBus.sendNoteOn(channel, 64, velocity); // Send a Midi noteOn
      lastPitch = 64;
    } else if (key == 'w' || key == 'W') {
       myBus.sendNoteOn(channel, 65, velocity); // Send a Midi noteOn
       lastPitch = 65;
    }
  }
  delay(1);
}
 

void mousePressed() {
  if (lastPitch > 0) {
    myBus.sendNoteOff(channel, lastPitch, velocity); // Send a Midi nodeOff
  }
  delay(1);
      
  float rectSize = width / rectNum;

  if (mouseX < rectSize && mouseY < rectSize) {
      myBus.sendNoteOn(channel, 64, velocity); // Send a Midi noteOn
      lastPitch = 64;
  } else if (mouseX >= rectSize && mouseX < rectSize*2 && mouseY < rectSize) {
      myBus.sendNoteOn(channel, 65, velocity); // Send a Midi noteOn
      lastPitch = 65;
  } else if (mouseX >= rectSize*2 && mouseX < rectSize*3 && mouseY < rectSize) {
    //song3.play();
    //song3.rewind();
  } else if (mouseX >= rectSize*3 && mouseX < rectSize*4 && mouseY < rectSize) {
    //song4.play();
    //song4.rewind();
  //} else if (mouseX < rectSize && mouseY >= rectSize && mouseY < rectSize*2) {
  //  song5.play();
  //  song5.rewind();
  } else if (mouseX >= rectSize && mouseX < rectSize*2 && mouseY < rectSize*2) {
    //song6.play();
    //song6.rewind();
  //} else if (mouseX >= rectSize*2 && mouseX < rectSize*3 && mouseY < rectSize*2) {
  //  song7.play();
  //  song7.rewind();
  }
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
