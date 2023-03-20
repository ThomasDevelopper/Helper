library helper;

extension HelperExtensionInt on int {

  /// Function to convert the number into a String like social media.
  ///
  /// For example:
  /// - 1500 -> 1,50 K
  /// - 1 200 000 -> 1,20 M
  /// - 500 -> 500
  String toStringLikeSocialMedia(){
    // Initialize a String
    String numberInString;
    // If the number is equal or greater than 1000
    if(this>=1000){
      // If the number is greater than 1 000 000
      if(this>1000000){
        double millions = this/1000000;
        numberInString = "${_formatDouble(millions)} M";
      }
      // If the number is equal or less than 1 000 000
      else{
        double thousand = this/1000;
        numberInString = "${_formatDouble(thousand)} K";
      }
    }
    // If the number is less than 1000
    else{
      numberInString = toString();
    }
    // Return numberInString
    return numberInString;
  }

  /// Function to convert [nb] into a string
  String _formatDouble(double nb) {
    String str = nb.toStringAsFixed(nb.truncateToDouble()==nb? 0 : 2);
    return str.replaceAll(".", ",");
  }

}