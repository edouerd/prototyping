// ex6: user-input text
// insult generator
// janice pang — (edouard u. mod)
// december 2, 2013 — (2013,dec,03)

String userType = "Name";

// initialize fonts
PFont fontBig;
PFont fontMedium;
PFont fontSmall;

// line variables
int lineW = 900;
int lineH = 8;

// adjectives boolean
boolean adjectives = false;

// declare adjectives array
String[] adj1 = {
  "ugly", "disgusting", "moronic"
};
int adj1_rand = int(random(adj1.length)); // randomizes first adjectve

String[] adj2 = {
  "plebian", "derivative", "hated"
};
int adj2_rand = int(random(adj2.length)); // randomizes second adjective

String[] noun = {
  "piece of shit.", "peasant.", "jerk."
};
int noun_rand = int(random(noun.length)); // randomizes noun


void setup() {
  size(1000, 400);

  // declare fonts
  fontBig = loadFont("Helvetica-Bold-72.vlw");
  fontMedium = loadFont("Helvetica-Bold-24.vlw");
  fontSmall = loadFont("Helvetica-Bold-12.vlw");
}

void draw() {
  // background constantly redrawn
  background(0);
  // background setups
  fill(255);
  rect(50, 100, lineW, lineH);
  rect(50, 292, lineW, lineH);

  // user types text
  fill(255);
  textFont(fontBig);
  text(userType/*(frameCount/10%2 == 0 ? "_" : "")*/, 52, 200);

  //instructions
  fill(255);
  textFont(fontSmall);
  text("Replace 'name' by typing your own, then press enter", 52, 322);


  // adjectives text
  int r = int(random(4));

  if (adjectives) {
    fill(255);
    textFont(fontMedium);
    text("A " + (adj1[adj1_rand]) + ", " + (adj2[adj2_rand]) + " " + (noun[noun_rand]), 52, 252);
    saveFrame(userType + "2.jpg"); // screenshot
    noLoop();
  }
  else {
  }
} 


// allows user to input own type; includes modifications of original code by Tom Carden
void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      userType = userType.substring(0, max(0, userType.length()-1));
      break;
    case ENTER:
    case RETURN:
    case ESC:
    case DELETE:
      break;
    default:
      userType += key;
    }
  }
}


void keyPressed() {
  if (key == ENTER) {
    adjectives = !adjectives;
  }
}
