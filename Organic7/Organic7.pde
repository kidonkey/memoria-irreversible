Tree tree;
Changelog changelog;
String f = "41";

void setup() {
  size(400,700);
  pixelDensity(2);
  smooth();
  String path = "../changelogs/" + f + ".csv";
  changelog = new Changelog(path);
  tree = new Tree();
}

void draw() {
  if (frameCount < 2000) {
    delay(100);
    background(190);
    translate(width/2,height);
    rotate(-PI/2);
    String[] burst = changelog.getNextBurst();
    tree.change(burst);
    tree.display();
    println("TREE: \"" + tree.structure() + "\"");
  } else {
    noLoop();
    println("DONE:", changelog.t*100/changelog.log.length + "%");
  }
}