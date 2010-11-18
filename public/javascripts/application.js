// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var usa = "214";

jQuery(function($) {
  // Only show State field if selected country is United States
  $("select#brewery_address_attributes_country_id").change(function() {
    if ($("select#brewery_address_attributes_country_id option:selected").val() != usa) {
      $("#brewery_address_attributes_state_id option:first-child").attr('selected', 'selected');
      $("div#state").hide();
    } 
    else {
      $("div#state").show();
    }
  });
});
