import "dart:io";

List kv(int index, terms, json) {
  if (index == terms.length) {
    return json; // Stops recursive function when all terms have been scanned
  }

  // Adds JSON-style key and value names to the list

  if (index == 2) {
    
    json.add(("  " * int.parse(terms[1])) + "\"" + terms[2] + "\": " + "\"" + terms[3] + "\",");
    
  }
  
  kv(index+1, terms, json); // recursion
  return json; // must return type List at end of function
}

List li(terms, json) {

  // Adds JSON-style list syntax to the JSON list variable
  
  json.add(("  " * int.parse(terms[1])) + "\"" + terms[2] + "\": " + "[\"" + terms[3].replaceAll(".", "\",\"") + "\"]" + ",");
  
  return json;
}

write(json, json_str, JSonny_code2) {
  for (String item in json) {
    json_str += item + "\n"; // append each JSON line onto a string
  }

  JSonny_code2.writeAsStringSync("{\n"+ json_str + "\n}");
}

void main() {
  // Synchronus reading of file
  var JSonny_code = File("data.son");
  var JSonny_code2 = File("data.json");
  
  String contents = JSonny_code.readAsStringSync();

  // Splits code into list
  var code_list = contents.split(" | ");

  var json = []; // List containing parsed JSON syntax
  var json_str = ""; // String to add to JSON file
  
  // Analyzes each item in the list 
  for (var item in code_list) {
    int count = 0; // regulates the recursive function
    var terms = item.split(" "); // split into the individual terms of the code (do not put spaces in key or value names)

    if (terms[0] == "obj") {
      json.add(("  " * int.parse(terms[2])) + "\"" + terms[1] + "\": " + "{");
    }

    if (terms[0] == "end") {
      json.add(("  " * int.parse(terms[1])) + "},");
    }
      
    if (terms[0] == "kv") {
      json = kv(count, terms, json);
    }

    if (terms[0] == "li") {
      json = li(terms, json);
    }
    
    write(json, json_str, JSonny_code2);
    
  }
  
  print("Mission accomplished.");
  
}


