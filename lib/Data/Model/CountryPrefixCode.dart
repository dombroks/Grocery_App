class CountryPrefixCode {
  String code;

  CountryPrefixCode({
    this.code,
    
  });
  
  

  CountryPrefixCode.fromJson(Map<String, dynamic> parsedJson)
      : code = parsedJson['code'];

  
  
}
