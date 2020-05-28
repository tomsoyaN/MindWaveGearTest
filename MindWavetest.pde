import java.net.*;
import java.util.*;
import neurosky.*;
import org.json.*;

ThinkGearSocket neuroSocket;
int attention=10;
int meditation=10;
PFont font;
HashMap<String,Integer> List = new HashMap<String,Integer>();

void setup(){
  size(600,600);
  ThinkGearSocket neuroSocket = new ThinkGearSocket(this);
  try {
    neuroSocket.start();
  } 
  catch (Exception e) {
    
  }
  smooth();
  font = createFont("Verdana",12);
  textFont(font);
}

void draw(){
  background(0);
  String txt = "ValueList\n";
  for(Map.Entry e : List.entrySet()){
    print(e.getKey()+":");
    println(e.getValue());
    txt += e.getKey()+":"+e.getValue()+"\n";
  }
  text(txt,20,20); 
}


void poorSignalEvent(int sig){
  println("SignalEvent "+sig);
  List.put("sig",sig);
}

void attentionEvent(int attentionLevel){
  println("Attention Level: " + attentionLevel);
  attention = attentionLevel;
  List.put("attentionlevel",attentionLevel);
}


void meditationEvent(int meditationLevel){
  println("Meditation Level: " + meditationLevel);
  meditation = meditationLevel;
  List.put("meditation",meditationLevel);
}

void blinkEvent(int blinkStrength){
   println("blinkStrength: " + blinkStrength);
  List.put("blinkstrength",blinkStrength);
}

public void eegEvent(int delta, int theta, int low_alpha, int high_alpha, int low_beta, int high_beta, int low_gamma, int mid_gamma){
  println("delta Level: " + delta);
  println("theta Level: " + theta);
  println("low_alpha Level: " + low_alpha);
  println("high_alpha Level: " + high_alpha);
  println("low_beta Level: " + low_beta);
  println("high_beta Level: " + high_beta);
  println("low_gamma Level: " + low_gamma);
  println("mid_gamma Level: " + mid_gamma);
  List.put("delta",delta);
  List.put("theta",theta);
  List.put("low_alpha",low_alpha);
  List.put("high_alpha",high_alpha);
  List.put("low_beta",low_beta);
  List.put("high_beta",high_beta);
  List.put("low_gamma",low_gamma);
  List.put("mid_gamma",mid_gamma);
}

public void rawEvent(int[] raw){
}

void stop(){
  neuroSocket.stop();
  super.stop();
}
