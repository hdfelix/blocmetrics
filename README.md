##Blocmetrics

Blocmetrics is a simple api that you can use to track events on your website.

### Configuration
To use Blocmetrics you simply need to add the following snippet right above the `</body>` tag on every page that you want to monitor events on:

```
<!-- blocmetrics -->
  <script language="javascript" type="text/javascript">
$( document ).ready(function() {
  (function (){
      _bm_event = {
        referer: window.location.hostname,
        name: "PageLoad",
        property_1: window.location.pathname,
        property_2: navigator.userAgent.toString().toLowerCase()
      }
      $.ajax({
          type: "POST",
          url: "http://localhost:3000/api/v1/events.json",
          data: JSON.stringify(_bm_event),
          contentType: "application/json; charset=utf-8",
          dataType: "json"
      });
   }());
});
  </script>
```
   
Once you've added the script, you're good to go!  
You can add send custom attributes with each event by changing the properties sent on the `_bm_event` variable.
 

