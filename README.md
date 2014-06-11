##Blocmetrics

Blocmetrics is a simple api that you can use to track events on your website.

### Configuration
To use Blocmetrics you simply need to add the following snippet right above the `</body>` tag on every page that you want to monitor events on:

```
<!-- blocmetrics -->
<script language="javascript" type="text/javascript">
	$( document ).ready(function() {
		(function (){
			// track a client-side event using the Blocmetrics analytics service
				_bm_event = {
					name: "Test",
					property_1: "p1",
					property_2: "p2"
				}
				var _bm_request = new XMLHttpRequest();
				alert("_bm_request.readyState: " + _bm_request.readyState)

				//use 'localhost:3000' during development.
				_bm_request.open("POST", "http://localhost:3000/api/v1/events", true);

				_bm_request.setRequestHeader('Content-Type', 'application/json');
				_bm_request.onload = function() { //onreadystatechange = function() {
					// this function runs when the Ajax request changes state.
					// https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
				};
				alert("_bm_event: " + _bm_event)
				//alert((JSON.stringify(_bm_event));)
				_bm_request.send(JSON.stringify(_bm_event));
		 }());
	});
</script>
```
   
Once you've added the script, you're good to go!  
You can add send custom attributes with each event like this:  

[add instructions]  
   

