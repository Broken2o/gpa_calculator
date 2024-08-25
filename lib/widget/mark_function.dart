double markfunction(mark){
  double grade=0;
  if (mark<50.00){grade=0;}
  else if (mark<55.00){grade=1;}
  else if (mark<60.00){grade=1.5;}
  else if (mark<64.00){grade=2;}
  else if (mark<68.00){grade=2.2;}
  else if (mark<72.00){grade=2.4;}
  else if (mark<76.00){grade=2.6;}
  else if (mark<80.00){grade=2.8;}
  else if (mark<84.00){grade=3;}
  else if (mark<88.00){grade=3.2;}
  else if (mark<92.00){grade=3.4;}
  else if (mark<96.00){grade=3.7;}
  else{grade=4;}
  return grade;
}