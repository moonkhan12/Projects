// Import required libraries
#include <stdio.h>
#include "WiFi.h"
#include "ESPAsyncWebServer.h"
#include <Adafruit_Sensor.h>
#include <DHT.h>


// Replace with your network credentials
const char* ssid = "UHWireless";
const char* password = "moonkhan12"; 


#define TimeSetDelaySeconds 10 //specify how long of a delay you would like. Keep above 2**
#define STACK_SIZE 10000

DHT dht(27, DHT22); //


AsyncWebServer server(80);// Instantiate an AsyncWebServer object with port 80


//Read from sensor. Sensor reading may take up to 2 seconds. //Important to not set an time for sampling of less than 2 seconds.
String readDHTTemperature() {
  float t = dht.readTemperature(true); // true condition reads temp as Fahrenheit. //For Celsius leave condition blank.
  // Check if any reads failed
  if (isnan(t)) {    
    Serial.println("Failed to read from DHT sensor!");
    return "--.--"; //return a blank time for display
  }
  else {
    Serial.println(t);
    return String(t);
  }
}



 
String readDHTHumidity() {
  // Sensor readings may also be up to 2 seconds 'old' (its a very slow sensor)
  float h = dht.readHumidity();
  if (isnan(h)) {
    Serial.println("Failed to read from DHT sensor!");
    return "--.--";
  }
  else {
    Serial.println(h);
    return String(h);
  }
}

//HTML JavaScript stuff
// <!--Comments are written like this for html-->
const char index_html[] PROGMEM = R"rawliteral(
<!DOCTYPE HTML><html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <style>
    html {
     font-family: Arial;
     display: inline-block;
     margin: 0px auto;
     text-align: center;
    }
    h2 { font-size: 3.0rem; }
    p { font-size: 2.5rem; }
    .units { font-size: 1.2rem; }
    .dht-labels{
      font-size: 1.5rem;
      vertical-align:middle;
      padding-bottom: 20px;
    }
  </style>
</head>
<body>
  <h2>Atmospheric Condition Monitor</h2>
  <p>
    <i class="fas fa-thermometer-half" style="color:Tomato;"></i> 
    <span class="dht-labels">Temperature:</span> 
    <span id="temperature">%TEMPERATURE%</span>
    <sup class="units">&deg;F</sup>
  </p>
  <p>
    <i class="fas fa-tint" style="color:#00add6;"></i> 
    <span class="dht-labels">Humidity:</span>
    <span id="humidity">%HUMIDITY%</span>
    <sup class="units">%</sup>
  </p>
  <p>Last updated: <span id="datetime"></span></p>
  
  <script>
  var dt = new Date();
  if((dt.getMonth()+1) == 11)
  {
    var mon = "Nov.";
  }
  else if((dt.getMonth()+1) == 12)
  {
    var mon = "Dec.";
  }
  else if((dt.getMonth()+1) == 1)
  {
    var mon = "Jan.";
  }
  else if((dt.getMonth()+1) == 2)
  {
    var mon = "Feb.";
  }
  else if((dt.getMonth()+1) == 3)
  {
    var mon = "Mar.";
  }
  else if((dt.getMonth()+1) == 4)
  {
    var mon = "Apr.";
  }
  else if((dt.getMonth()+1) == 5)
  {
    var mon = "May.";
  }
  else if((dt.getMonth()+1) == 6)
  {
    var mon = "Jun.";
  }
  else if((dt.getMonth()+1) == 7)
  {
    var mon = "Jul.";
  }
  else if((dt.getMonth()+1) == 8)
  {
    var mon = "Aug.";
  }
  else if((dt.getMonth()+1) == 9)
  {
    var mon = "Sep.";
  }
  else if((dt.getMonth()+1) == 10)
  {
    var mon = "Oct.";
  }
  var ampm = "AM"
  var h = dt.getHours()
  if(h > 12)
  {
    h = (h - 12);
    ampm = "PM"
  }
  if (h == 0)
  {
    h = 12;
  }
//<!- - Network Time - -> 
  document.getElementById("datetime").innerHTML = mon +" "+ (("0"+dt.getDate()).slice(-2)) +" at "+ h +":"+ (("0"+dt.getMinutes()).slice(-2)) + " " + ampm;
  setTimeout;
  </script>
  <!-- Footer -->
  <div>
  
  
  <footer class="w3-center w3-light-grey w3-padding-8">
  <br><br><br><br><br>
  <p style="margin:0;"><font size="2">Created by: Mubashar Khan, Trey Barker, Ali Memon<br>ECE 4335 Fall 2019</font></p>
  <p style="margin:2;"><font size="2"></font></p>

</footer>
</div>
</body>
<script>
setInterval(function ( ) 
{
  var xhttp = new XMLHttpRequest();//Allows part of the webpage to be updated without changing the whole page.
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) { //When readyState is 4 and status is 200, the response is ready: The webpage can be updated.
      document.getElementById("temperature").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/temperature", true);
  xhttp.send();
}, 10000 ) ;

setTimeout(function() {
  location.reload();
}, 10000);

setInterval(function ( ) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("humidity").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/humidity", true);
  xhttp.send();
}, 10000 ) ;
</script>
</html>)rawliteral";

// Replaces placeholder with DHT values
String processor(const String& var){
  //Serial.println(var);
  if(var == "TEMPERATURE"){
    return readDHTTemperature();
  }
  else if(var == "HUMIDITY"){
    return readDHTHumidity();
  }
  return String();
}

void setup(){
  // Serial port for debugging purposes
  Serial.begin(115200);

  dht.begin();
  
  // Connect to Wi-Fi
  WiFi.begin(ssid);
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }

  // Print ESP32 Local IP Address
  Serial.println(WiFi.localIP());

  // Route for root / web page
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/html", index_html, processor);
  });
  server.on("/temperature", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/plain", readDHTTemperature().c_str());
  });
  server.on("/humidity", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send_P(200, "text/plain", readDHTHumidity().c_str());
  });

  // Start server
  server.begin();
}

 
void loop(){
    
}
