function setThumbnail(event) {
			var reader = new FileReader();
			var file = event.target.files[0];

			if (file && file.type.match("image.*")) {
				reader.onload = function(e) {
					var img = document.createElement("img");
					img.setAttribute("src", e.target.result);
					document.querySelector("#photo-container").innerHTML = "";
					document.querySelector("#photo-container").appendChild(img);
				}

				reader.readAsDataURL(file);
			}
		}