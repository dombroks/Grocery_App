class CountryPrefixCode {
  String code;
  
  CountryPrefixCode({
    this.code,
    
  });
  
  

  CountryPrefixCode.fromJson(Map<String, String> parsedJson)
      : code = parsedJson['code'];
  
}
