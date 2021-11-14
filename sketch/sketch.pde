import processing.sound.*;
import processing.serial.*; // import the Processing serial library


SoundFile[] a = new SoundFile[3];
SoundFile[] b = new SoundFile[3];
SoundFile[] c = new SoundFile[3];
SoundFile[] d = new SoundFile[3];
SoundFile[] e = new SoundFile[3];
SoundFile[] f = new SoundFile[3];

SoundFile kickSound;
SoundFile crashSound;
SoundFile snareSound;
SoundFile tom1Sound;
SoundFile tom2Sound;
SoundFile hatSound;

int selectedSettingIndex = 0;

Serial myPort; // The serial port

void setup() {
size(500,500);
// List all the available serial ports in the console
printArray(Serial.list());

// Change the 0 to the appropriate number of the serial port
// that your microcontroller is attached to.
String portName = Serial.list()[3];
myPort = new Serial(this, portName, 9600);
// read incoming bytes to a buffer
// until you get a linefeed (ASCII 10):
myPort.bufferUntil('\n');

a[0] = new SoundFile(this, "kick.wav");
b[0] = new SoundFile(this, "crash.wav");
c[0] = new SoundFile(this, "tom1.wav");
d[0] = new SoundFile(this, "tom2.wav");
e[0] = new SoundFile(this, "snare.wav");
f[0] = new SoundFile(this, "hat.wav");

a[1] = new SoundFile(this, "c4.mp3");
b[1] = new SoundFile(this, "d4.mp3");
c[1] = new SoundFile(this, "e4.mp3");
d[1] = new SoundFile(this, "f4.mp3");
e[1] = new SoundFile(this, "g4.mp3");
f[1] = new SoundFile(this, "a5.mp3");

a[2] = new SoundFile(this, "cello_c4.wav");
b[2] = new SoundFile(this, "cello_d4.wav");
c[2] = new SoundFile(this, "cello_e4.wav");
d[2] = new SoundFile(this, "cello_f4.wav");
e[2] = new SoundFile(this, "cello_g4.wav");
f[2] = new SoundFile(this, "cello_a5.wav");


}


void draw()
{
background(255);
fill(255,0,0);
}

void serialEvent(Serial myPort) {
// read the serial buffer:
String myString = myPort.readStringUntil('\n');
if (myString != null) {
// println(myString);
myString = trim(myString);

// split the string at the commas
// and convert the sections into floats:
//float sensors[] = float(split(myString, ','));
print("Touch Value : " + myString + "\t");
println();
//pitch = sensors[0];
//roll = sensors[1];
switch(myString){
  case "0": selectedSettingIndex = 0; break;
  case "1": selectedSettingIndex = 1; break;
  case "2": selectedSettingIndex = 2; break;
 
  case "3": a[selectedSettingIndex].play(); break;
  case "4": b[selectedSettingIndex].play(); break;
  case "6": c[selectedSettingIndex].play(); break;
  case "8": d[selectedSettingIndex].play(); break;
  case "9": e[selectedSettingIndex].play(); break;
  case "10": f[selectedSettingIndex].play(); break;

}
}
}
