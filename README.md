##Blocmetrics

Blocmetrics is a simple api that you can use to track events on your website.

### Configuration
To use Blocmetrics you simply need to add the following snippet right above the `</body>` tag on every page that you want to monitor events on:

```
  <script>
		// using module pattern to prevent clashes with existing variables
		(function(){
			// track a client-side event using the Blocmetrics analytics service
			var _bm_event = {
				name: "sale",
				property_1: "some value",
				property_2: "some other value"
			}

			var _bm_request = new XMLHttpRequest();
			_bm_request.open("POST", "localhost:3000/events.json", true);
			_bm_request.setRequestHeader('Content-Type', 'application/json');
			_bm_request.onreadystatechange = function() {
				// this function runs when the Ajax request changes state.
				// https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
			};
			_bm_request.send(JSON.stringify(_bm_event));	
		}());
	</script>
```
   
Once you've added the script, you're good to go!  
You can add send custom attributes with each event like this:  

[add instructions]  
   

